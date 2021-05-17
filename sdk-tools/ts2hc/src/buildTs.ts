import * as fs from "fs";

import * as chalk from "chalk";
import * as ts from "typescript";

import { BuildOptions } from "./buildOptions";
import { buildBundleInfo } from "./bundle/buildBundleInfo";
import { bundle } from "./bundle/bundle";
import { BundleInfo } from "./bundle/bundleInfo";
import { compileByteCodeAndWriteHash } from "./compileByteCodeAndWriteHash";
import { configHash } from "./configHash";
import { LogEventType } from "./logEvent";
import { LogMgr } from "./logMgr";
import { setupArtifactDirectories } from "./setupArtifactDirectories";

export async function buildTs({
    config,
    logMgr,
}: {
    config: BuildOptions;
    logMgr: LogMgr;
}): Promise<boolean> {
    const startTime = new Date().getTime();

    const buildHash = configHash(config);

    logMgr.log({
        event: {
            logEventType: LogEventType.diagnostic,
            message: `Lowering files`,
        },
    });

    const {
        outFileHash,
        outFile,
        outFileSymbols,
        tempFile,
        tempDir,
        oldBundleInfo,
    } = setupArtifactDirectories(buildHash, config);

    let oldBuild: BundleInfo | undefined;
    if (fs.existsSync(oldBundleInfo)) {
        oldBuild = JSON.parse(fs.readFileSync(oldBundleInfo).toString());
    }

    logMgr.log({
        event: {
            logEventType: LogEventType.progressStart,
            progessId: buildHash,
        },
    });

    const bundleInfo = await buildBundleInfo(
        config,
        logMgr,
        (currentStep, totalSteps, suffixMessage) => {
            logMgr.log({
                event: {
                    logEventType: LogEventType.progressTick,
                    progessId: buildHash,
                    currentStep: currentStep,
                    totalSteps: totalSteps,
                    suffixMessage: suffixMessage,
                },
            });
        },
        oldBuild
    );

    logMgr.log({
        event: {
            logEventType: LogEventType.progressStop,
            progessId: buildHash,
        },
    });

    if (bundleInfo.diagnostics && bundleInfo.diagnostics.length) {
        bundleInfo.diagnostics.forEach((x) => {
            if (x.file) {
                const { line, character } =
                    x.file.getLineAndCharacterOfPosition(x.start!);
                const message = ts.flattenDiagnosticMessageText(
                    x.messageText,
                    "\n"
                );
                const fileNameMsg = chalk.blue(x.file.fileName);
                const lineMsg = chalk.yellow(line + 1);
                const characterMsg = chalk.yellow(character + 1);
                const diagMsg = chalk.red(message);

                logMgr.log({
                    event: {
                        logEventType: LogEventType.error,
                        message: `${fileNameMsg}:${lineMsg}:${characterMsg} - ${diagMsg}`,
                    },
                });
            } else {
                const diagMsg = chalk.red(
                    ts.flattenDiagnosticMessageText(x.messageText, "\n")
                );

                logMgr.log({
                    event: {
                        logEventType: LogEventType.error,
                        message: diagMsg,
                    },
                });
            }
        });

        return false;
    }

    fs.writeFileSync(oldBundleInfo, JSON.stringify(bundleInfo, undefined, 0));

    const bundleResult = bundle(bundleInfo, logMgr);

    fs.writeFileSync(`${tempDir}/${config.modName}`, bundleResult.bundle);

    if (config.profile == "debug") {
        const symbolsString = JSON.stringify(bundleResult.debugSymbols);
        fs.writeFileSync(`${tempDir}/${config.modName}.symbols`, symbolsString);
        fs.writeFileSync(outFileSymbols, symbolsString);
    }

    compileByteCodeAndWriteHash(outFile, outFileHash, tempFile, config);

    const endTime = new Date().getTime();

    return true;
}

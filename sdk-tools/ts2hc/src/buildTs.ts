import * as fs from "fs";

import * as chalk from "chalk";
import * as ts from "typescript";

import { BuildOptions } from "./buildOptions";
import { buildBundleInfo } from "./bundle/buildBundleInfo";
import { bundle } from "./bundle/bundle";
import { BundleInfo } from "./bundle/bundleInfo";
import { compileByteCodeAndWriteHash } from "./compileByteCodeAndWriteHash";
import { configHash } from "./configHash";
import { ProgressBar } from "./progressBar";
import { setupArtifactDirectories } from "./setupArtifactDirectories";

export async function buildTs(config: BuildOptions): Promise<void> {
    const startTime = new Date().getTime();

    const buildHash = configHash(config);
    console.log(`Build ${chalk.yellow(buildHash)}`);

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

    const compileProgressBar = new ProgressBar("Compiling");

    const bundleInfo = await buildBundleInfo(
        config,
        (currentStep, totalSteps, suffixMessage) => {
            compileProgressBar.update(currentStep, totalSteps, suffixMessage);
        },
        oldBuild
    );

    compileProgressBar.stop();

    if (bundleInfo.diagnostics && bundleInfo.diagnostics.length) {
        bundleInfo.diagnostics.forEach((x) => {
            if (x.file) {
                const {
                    line,
                    character,
                } = x.file.getLineAndCharacterOfPosition(x.start!);
                const message = ts.flattenDiagnosticMessageText(
                    x.messageText,
                    "\n"
                );
                const fileNameMsg = chalk.blue(x.file.fileName);
                const lineMsg = chalk.yellow(line + 1);
                const characterMsg = chalk.yellow(character + 1);
                const diagMsg = chalk.red(message);

                console.log(
                    `${fileNameMsg}:${lineMsg}:${characterMsg} - ${diagMsg}`
                );
            } else {
                const diagMsg = chalk.red(
                    ts.flattenDiagnosticMessageText(x.messageText, "\n")
                );
                console.log(diagMsg);
            }
        });

        return;
    }

    fs.writeFileSync(oldBundleInfo, JSON.stringify(bundleInfo, undefined, 0));

    const bundleResult = bundle(bundleInfo);

    fs.writeFileSync(`${tempDir}/${config.modName}`, bundleResult.bundle);
    const symbolsString = JSON.stringify(bundleResult.debugSymbols);
    fs.writeFileSync(`${tempDir}/${config.modName}.symbols`, symbolsString);
    fs.writeFileSync(outFileSymbols, symbolsString);

    compileByteCodeAndWriteHash(outFile, outFileHash, tempFile, config);

    const endTime = new Date().getTime();
    console.log(`Finished build in ${endTime - startTime}ms`);

    console.log(`${chalk.blue(config.entry)} ----> ${chalk.yellow(outFile)}`);
    console.log(
        `${chalk.blue(config.entry)} ----> ${chalk.yellow(outFileHash)}`
    );
    console.log(
        `${chalk.blue(config.entry)} ----> ${chalk.yellow(outFileSymbols)}`
    );
}

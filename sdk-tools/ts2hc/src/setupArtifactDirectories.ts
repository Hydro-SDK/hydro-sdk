import * as fs from "fs";

import { BuildOptions } from "./buildOptions";

export function setupArtifactDirectories(
    buildHash: string,
    config: BuildOptions
) {
    const tempDir = `.hydroc/ts2hc/${buildHash}`;
    const oldBundleInfo = `.hydroc/ts2hc/${buildHash}/build.json`;
    const tempFile = `.hydroc/ts2hc/${buildHash}/${config.modName}`;
    const outFile = `${config.outDir}/${config.modName}.hc`;
    const outFileHash = `${config.outDir}/${config.modName}.hc.sha256`;
    const outFileSymbols = `${config.outDir}/${config.modName}.hc.symbols`;

    fs.mkdirSync(config.outDir, { recursive: true });
    fs.mkdirSync(tempDir, { recursive: true });

    return {
        tempDir,
        tempFile,
        outFile,
        outFileHash,
        outFileSymbols,
        oldBundleInfo,
    };
}

import * as cp from "child_process";
import * as crypto from "crypto";
import * as fs from "fs";

import { BuildOptions } from "./buildOptions";
import { makeSdkToolPath } from "./makeSdkToolsPath";

export function compileByteCodeAndWriteHash(
    outFile: string,
    outFileHash: string,
    tempFile: string,
    config: BuildOptions
) {
    cp.execSync(
        `${makeSdkToolPath({ toolName: "luac52", config: config })} ${
            config.profile == "release" ? "-s" : ""
        } -o ${outFile} ${tempFile}`
    );

    if (config.profile == "debug") {
        const hash = crypto.createHash("sha256");
        hash.update(fs.readFileSync(outFile).toString());
        fs.writeFileSync(outFileHash, hash.digest("hex"));
    }
}

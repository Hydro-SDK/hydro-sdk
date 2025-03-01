import { IFuture } from "../async/future";
import { IImage } from "./image";
export interface IPicture {
    toImage: (width: number, height: number) => IFuture<IImage>;
    dispose: () => void;
    getApproximateBytesUsed: () => number;
}

import { JITAllocatingRTManagedBox } from "./../../syntheticBox";
import { RuntimeBaseClass } from "./../../runtimeBaseClass";
import { Type } from "./../core/type";

declare const dart: {
    ui: {
        color: (this: void, hex: number) => Color;
    };
};

export class Color extends JITAllocatingRTManagedBox<undefined, Color> implements RuntimeBaseClass {
    public readonly internalRuntimeType = new Type(Color);
    public props = undefined;
    private hex: number;
    public constructor(hex: number) {
        super();
        this.hex = hex;
    }

    public static fromARGB(a: number, r: number, g: number, b: number) {
        return new Color((((a & 0xff) << 24) |
            ((r & 0xff) << 16) |
            ((g & 0xff) << 8) |
            ((b & 0xff) << 0)) & 0xFFFFFFFF);
    }

    //@todo Color:fromRGBO(r number,g : number, b : number, opacity : number) : Color
    //  We need a round division like Dart's ~/ operator
    // public static fromRGBO(r: number, g: number, b: number, opacity: number) {
    //     return new Color((((((opacity * 0xff / 1)) & 0xff) << 24) |
    //         ((r & 0xff) << 16) |
    //         ((g & 0xff) << 8) |
    //         ((b & 0xff) << 0)) & 0xFFFFFFFF);
    // }

    public unwrap(): Color {
        return dart.ui.color(this.hex);
    }
}
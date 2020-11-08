
import { JITAllocatingRTManagedBox } from "../../syntheticBox";
import { RuntimeBaseClass } from "../../runtimeBaseClass";
import { Type } from "../../dart/core/type";
import { Color } from "../../dart/ui/color";
import { List } from "../../dart/collection/list";
import { Key } from "../foundation/key";
import { ValueChanged } from "../foundation/valueChanged";

import { BottomNavigationBarItem } from "../widgets/bottomNavigationBarItem";
import { Border } from "../painting/border";
import { BorderSide } from "../painting/borderSide";
import { BorderStyle } from "../painting/borderStyle";
import { kDefaultTabBarInactiveColor, kDefaultTabBarBorderColor } from "./constants";


export interface CupertinoTabBarProps {
    key?: Key | undefined;
    items: List<BottomNavigationBarItem>;
    onTap?: ValueChanged<number>;
    currentIndex?: number;
    backgroundColor?: Color | undefined;
    activeColor?: Color | undefined;
    inactiveColor?: Color | undefined;
    iconSize?: number | undefined;
    border?: Border | undefined;
}

declare const flutter: {
    cupertino: {
        cupertinoTabBar: (this: void, props: CupertinoTabBarProps) => CupertinoTabBar;
    }
}

export class CupertinoTabBar extends JITAllocatingRTManagedBox<CupertinoTabBarProps, CupertinoTabBar> implements RuntimeBaseClass {
    public readonly internalRuntimeType = new Type(CupertinoTabBar);
    public props: CupertinoTabBarProps;
    public constructor(props: CupertinoTabBarProps) {
        super();

        this.props = props;

        if (this.props.currentIndex === undefined) {
            this.props.currentIndex = 0;
        }

        if (this.props.inactiveColor === undefined) {
            this.props.inactiveColor = kDefaultTabBarInactiveColor;
        }

        if (this.props.iconSize === undefined) {
            this.props.iconSize = 30.0;
        }

        if (this.props.border === undefined) {
            this.props.border = new Border({
                top: new BorderSide({
                    color: kDefaultTabBarBorderColor.color,
                    width: 0.0,
                    style: BorderStyle.solid,
                })
            });
        }
    }

    public unwrap() {
        return flutter.cupertino.cupertinoTabBar(this.props);
    }
}

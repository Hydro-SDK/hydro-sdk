import 'package:flutter/material.dart';

import 'package:hydro_sdk/cfr/builtins/boxing/unboxers.dart';
import 'package:hydro_sdk/cfr/vm/context.dart';
import 'package:hydro_sdk/cfr/vm/table.dart';
import 'package:hydro_sdk/hydroState.dart';

void loadStack({@required HydroState luaState, @required HydroTable table}) {
  table["stack"] = makeLuaDartFunc(func: (List<dynamic> args) {
    return [
      Stack(
        key: maybeUnBoxAndBuildArgument<Widget>(args[0]["key"],
            parentState: luaState),
        textDirection: TextDirection.values.firstWhere(
            (x) => x.index == args[0]["textDirection"],
            orElse: () => null),
        fit: StackFit.values
            .firstWhere((x) => x.index == args[0]["fit"], orElse: () => null),
        overflow: Overflow.values.firstWhere(
            (x) => x.index == args[0]["overflow"],
            orElse: () => null),
        children: maybeUnBoxAndBuildArgument<Widget>(args[0]["children"],
            parentState: luaState),
      )
    ];
  });
}

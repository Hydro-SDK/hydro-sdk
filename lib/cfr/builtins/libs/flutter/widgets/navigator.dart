import 'package:flutter/material.dart';

import 'package:hydro_sdk/cfr/builtins/boxing/unboxers.dart';
import 'package:hydro_sdk/cfr/vm/context.dart';
import 'package:hydro_sdk/cfr/vm/table.dart';
import 'package:hydro_sdk/hydroState.dart';

void loadNavigator(
    {@required HydroState luaState, @required HydroTable table}) {
  table["navigatorPush"] = makeLuaDartFunc(func: (List<dynamic> args) {
    return [
      maybeUnBoxAndBuildArgument<Widget>(
          Navigator.push(
              maybeUnBoxAndBuildArgument<BuildContext>(args[0],
                  parentState: luaState),
              maybeUnBoxAndBuildArgument<Route<Object>>(args[1],
                  parentState: luaState)),
          parentState: luaState)
    ];
  });
}

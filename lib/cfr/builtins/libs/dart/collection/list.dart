import 'package:meta/meta.dart';

import 'package:hydro_sdk/cfr/builtins/boxing/boxers.dart';
import 'package:hydro_sdk/cfr/builtins/boxing/boxes.dart';
import 'package:hydro_sdk/cfr/builtins/boxing/unboxers.dart';
import 'package:hydro_sdk/cfr/vm/closure.dart';
import 'package:hydro_sdk/cfr/vm/context.dart';
import 'package:hydro_sdk/cfr/vm/table.dart';
import 'package:hydro_sdk/hydroState.dart';

class VMManagedList extends VMManagedBox<List<dynamic>> {
  final HydroTable table;
  final HydroState hydroState;
  final List<dynamic> vmObject;
  VMManagedList({
    @required this.table,
    @required this.hydroState,
    @required this.vmObject,
  }) : super(
          table: table,
          hydroState: hydroState,
          vmObject: vmObject,
        ) {
    table["unwrap"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [HydroTable()..arr = caller.unwrap()];
    });

    table["first"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [caller.unwrap().first];
    });

    table["last"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [caller.unwrap().last];
    });

    table["isEmpty"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [caller.unwrap().isEmpty];
    });

    table["isNotEmpty"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [caller.unwrap().isNotEmpty];
    });

    table["last"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [caller.unwrap().last];
    });

    table["length"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      return [caller.unwrap().length];
    });

    table["map"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      Closure map = args[1];
      return [
        maybeBoxObject<List<dynamic>>(
          object: caller
              .unwrap()
              .map((e) => map.dispatch([null, e], parentState: hydroState)[0])
              ?.toList(),
          hydroState: hydroState,
          table: HydroTable(),
        )
      ];
    });

    table["elementAt"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      int index = args[1];
      return [caller.unwrap().elementAt(index)];
    });

    table["where"] = makeLuaDartFunc(func: (List<dynamic> args) {
      VMManagedList caller = args[0];
      Closure predicate = args[1];
      return [
        maybeBoxObject<List<dynamic>>(
          object: caller
              .unwrap()
              .where((element) => predicate.dispatch(
                    [null, element],
                    parentState: hydroState,
                    resetEnclosingLexicalEnvironment: true,
                  )[0])
              .toList(),
          hydroState: hydroState,
          table: HydroTable(),
        )
      ];
    });
  }
}

void loadList({@required HydroState hydroState, @required HydroTable table}) {
  registerBoxer<List<dynamic>>(boxer: (
      {List<dynamic> vmObject, HydroState hydroState, HydroTable table}) {
    return VMManagedList(
        vmObject: vmObject, hydroState: hydroState, table: table);
  });

  registerUnBoxer(unBoxer: ({dynamic box, HydroState parentState}) {
    if (box is VMManagedList) {
      return box.unwrap();
    }
    return null;
  });

  table["fromArray"] = makeLuaDartFunc(func: (List<dynamic> args) {
    if (args[0] is HydroTable) {
      HydroTable arg = args[0];
      return [
        maybeBoxObject<List<dynamic>>(
          object: arg.arr,
          hydroState: hydroState,
          table: HydroTable(),
        )
      ];
    } else if (args[0] is List<dynamic>) {
      List<dynamic> arg = args[0];
      return [
        maybeBoxObject<List<dynamic>>(
          object: arg,
          hydroState: hydroState,
          table: HydroTable(),
        )
      ];
    }
    return [];
  });
}

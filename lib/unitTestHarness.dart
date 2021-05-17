import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';

import 'package:hydro_sdk/cfr/builtins/loadBuiltins.dart';
import 'package:hydro_sdk/cfr/coroutine/coroutineresult.dart';
import 'package:hydro_sdk/cfr/linkStatus.dart';
import 'package:hydro_sdk/cfr/moduleDebugInfo.dart';
import 'package:hydro_sdk/hc.g.dart';
import 'package:hydro_sdk/hydroState.dart';

Future<CoroutineResult> unitTestHarness({
  @required String path,
  @required List<BuiltinLib> libs,
}) async {
  var state = HydroState();
  loadBuiltins(hydroState: state, builtins: libs);

  List<ModuleDebugInfo> moduleDebugInfo;
  try {
    moduleDebugInfo = json
        .decode(File("$path.symbols").readAsStringSync())
        ?.map((x) => ModuleDebugInfo.fromJson(x))
        ?.toList()
        ?.cast<ModuleDebugInfo>();
  } catch (err) {}

  state.symbols = moduleDebugInfo;
  var linkStatus = LinkStatus();
  var val = await state.loadBuffer(
      buffer: File(path).readAsBytesSync(),
      name: path,
      thunks: thunks,
      linkStatus: null);
  state.dispatchContext = DispatchContext(dispatchContext: val);
  print(
      "I/Hydro ${linkStatus.nativePrototypes} native, ${linkStatus.virtualPrototypes} virtual prototypes");

  return val.pcall([], parentState: state);
}

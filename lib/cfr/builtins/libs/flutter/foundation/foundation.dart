import 'package:hydro_sdk/cfr/builtins/libs/flutter/foundation/changeNotifier.dart';
import 'package:hydro_sdk/cfr/builtins/libs/flutter/foundation/diagnosticsNode.dart';
import 'package:hydro_sdk/cfr/builtins/libs/flutter/foundation/key.dart';
import 'package:hydro_sdk/cfr/builtins/libs/flutter/foundation/textTreeConfiguration.dart';
import 'package:hydro_sdk/hydroState.dart';
import 'package:hydro_sdk/cfr/vm/table.dart';
import 'package:meta/meta.dart';

void loadFoundation(
    {@required HydroState luaState, @required HydroTable table}) {
  var foundation = HydroTable();

  table["foundation"] = foundation;

  loadKey(foundation);
  loadChangeNotifier();
  loadTextTreeConfiguration(hydroState: luaState, table: foundation);
  loadDiagnosticsNode(hydroState: luaState, table: foundation);
}

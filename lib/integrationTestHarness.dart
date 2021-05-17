import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hydro_sdk/cfr/moduleDebugInfo.dart';
import 'package:hydro_sdk/cfr/preloadCustomNamespaces.dart';
import 'package:hydro_sdk/hc.g.dart';
import 'package:hydro_sdk/runFromNetwork.dart';

Widget integrationTestHarness(
  String path, {
  List<dynamic> args = const [],
  List<CustomNamespaceLoader> customNamespaces,
}) {
  WidgetsFlutterBinding.ensureInitialized();
  return RunFromNetwork(
    filePath: path,
    args: args,
    thunks: thunks,
    baseUrl: path,
    customNamespaces: customNamespaces,
    downloadHash: (String uri) async {
      try {
      var file = File("$path.hc.sha256");
      var res = file.readAsStringSync();
      return res;
      } catch (err) {
        return null;
      }
    },
    downloadByteCodeImage: (String uri) async {
      var file = File("$path.hc");
      var res = file.readAsBytesSync();
      return res;
    },
    downloadDebugInfo: (String uri) async {
      try {
        var file = File("$path.hc.symbols");
        var res = file.readAsStringSync();
        return json
            .decode(res)
            ?.map((x) => ModuleDebugInfo.fromJson(x))
            ?.toList()
            ?.cast<ModuleDebugInfo>();
      } catch (err) {
        return [];
      }
    },
  );
}

import 'dart:collection';
import 'dart:core';
import 'dart:math';

import 'package:hydro_sdk/cfr/runtimeSupport.dart';

class VMManagedUnmodifiableListView
    extends VMManagedBox<UnmodifiableListView<dynamic>> {
  VMManagedUnmodifiableListView(
      {required this.table, required this.vmObject, required this.hydroState})
      : super(
          table: table,
          vmObject: vmObject,
          hydroState: hydroState,
        ) {
    table['lastIndexOf'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.lastIndexOf(
            maybeUnBoxAndBuildArgument<Object?, dynamic>(luaCallerArguments[1],
                parentState: hydroState),
            luaCallerArguments[2]),
      ];
    });
    table['indexOf'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.indexOf(
            maybeUnBoxAndBuildArgument<Object?, dynamic>(luaCallerArguments[1],
                parentState: hydroState),
            luaCallerArguments[2]),
      ];
    });
    table['cast'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<List<dynamic>>(
            object: vmObject.cast(),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['getLength'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.length,
      ];
    });
    table['setAll'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.setAll(
          luaCallerArguments[1],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[2],
              parentState: hydroState));
      return [];
    });
    table['add'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.add(luaCallerArguments[1]);
      return [];
    });
    table['insert'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.insert(luaCallerArguments[1], luaCallerArguments[2]);
      return [];
    });
    table['insertAll'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.insertAll(
          luaCallerArguments[1],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[2],
              parentState: hydroState));
      return [];
    });
    table['addAll'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.addAll(maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
          luaCallerArguments[1],
          parentState: hydroState));
      return [];
    });
    table['remove'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.remove(maybeUnBoxAndBuildArgument<Object?, dynamic>(
            luaCallerArguments[1],
            parentState: hydroState)),
      ];
    });
    table['removeWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      vmObject.removeWhere((element) => unpackedtest.dispatch(
            [luaCallerArguments[0], element],
            parentState: hydroState,
          )[0]);
      return [];
    });
    table['retainWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      vmObject.retainWhere((element) => unpackedtest.dispatch(
            [luaCallerArguments[0], element],
            parentState: hydroState,
          )[0]);
      return [];
    });
    table['sort'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure? unpackedcompare = luaCallerArguments[1];
      vmObject.sort(unpackedcompare != null
          ? (a, b) => unpackedcompare.dispatch(
                [luaCallerArguments[0], a, b],
                parentState: hydroState,
              )[0]
          : null);
      return [];
    });
    table['shuffle'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.shuffle(maybeUnBoxAndBuildArgument<Random?, dynamic>(
          luaCallerArguments[1],
          parentState: hydroState));
      return [];
    });
    table['clear'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.clear();
      return [];
    });
    table['removeAt'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.removeAt(luaCallerArguments[1]),
      ];
    });
    table['removeLast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.removeLast(),
      ];
    });
    table['setRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.setRange(
          luaCallerArguments[1],
          luaCallerArguments[2],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[3],
              parentState: hydroState),
          luaCallerArguments[4]);
      return [];
    });
    table['removeRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.removeRange(luaCallerArguments[1], luaCallerArguments[2]);
      return [];
    });
    table['replaceRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.replaceRange(
          luaCallerArguments[1],
          luaCallerArguments[2],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[3],
              parentState: hydroState));
      return [];
    });
    table['fillRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.fillRange(
          luaCallerArguments[1], luaCallerArguments[2], luaCallerArguments[3]);
      return [];
    });
    table['setLength'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.length = (luaCallerArguments[1]);
      return [];
    });
    table['setFirst'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.first = (luaCallerArguments[1]);
      return [];
    });
    table['setLast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.last = (luaCallerArguments[1]);
      return [];
    });
    table['indexWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        vmObject.indexWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            luaCallerArguments[2]),
      ];
    });
    table['lastIndexWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        vmObject.lastIndexWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            luaCallerArguments[2]),
      ];
    });
    table['sublist'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<List<dynamic>>(
            object:
                vmObject.sublist(luaCallerArguments[1], luaCallerArguments[2]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['getRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object:
                vmObject.getRange(luaCallerArguments[1], luaCallerArguments[2]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['asMap'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Map>(
            object: vmObject.asMap(),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['getReversed'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.reversed,
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['followedBy'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.followedBy(
                maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
                    luaCallerArguments[1],
                    parentState: hydroState)),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['map'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedf = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.map((e) => unpackedf.dispatch(
                  [luaCallerArguments[0], e],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['where'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.where((element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['whereType'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.whereType(),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['expand'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedf = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.expand((element) =>
                maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
                    unpackedf.dispatch(
                      [luaCallerArguments[0], element],
                      parentState: hydroState,
                    )[0],
                    parentState: hydroState)),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['contains'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.contains(maybeUnBoxAndBuildArgument<Object?, dynamic>(
            luaCallerArguments[1],
            parentState: hydroState)),
      ];
    });
    table['forEach'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedf = luaCallerArguments[1];
      vmObject.forEach((element) => unpackedf.dispatch(
            [luaCallerArguments[0], element],
            parentState: hydroState,
          ));
      return [];
    });
    table['reduce'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedcombine = luaCallerArguments[1];
      return [
        vmObject.reduce((value, element) => unpackedcombine.dispatch(
              [luaCallerArguments[0], value, element],
              parentState: hydroState,
            )[0]),
      ];
    });
    table['fold'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedcombine = luaCallerArguments[2];
      return [
        vmObject.fold(
            luaCallerArguments[1],
            (previousValue, element) => unpackedcombine.dispatch(
                  [luaCallerArguments[0], previousValue, element],
                  parentState: hydroState,
                )[0]),
      ];
    });
    table['every'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        vmObject.every((element) => unpackedtest.dispatch(
              [luaCallerArguments[0], element],
              parentState: hydroState,
            )[0]),
      ];
    });
    table['join'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.join(luaCallerArguments[1]),
      ];
    });
    table['any'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        vmObject.any((element) => unpackedtest.dispatch(
              [luaCallerArguments[0], element],
              parentState: hydroState,
            )[0]),
      ];
    });
    table['toList'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<List<dynamic>>(
            object: vmObject.toList(
                growable: luaCallerArguments.length >= 2
                    ? luaCallerArguments[1]['growable']
                    : null),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['toSet'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Set>(
            object: vmObject.toSet(),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['take'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.take(luaCallerArguments[1]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['takeWhile'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.takeWhile((value) => unpackedtest.dispatch(
                  [luaCallerArguments[0], value],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['skip'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.skip(luaCallerArguments[1]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['skipWhile'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: vmObject.skipWhile((value) => unpackedtest.dispatch(
                  [luaCallerArguments[0], value],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['firstWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      Closure? unpackedorElse = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['orElse']
          : null;
      return [
        vmObject.firstWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            orElse: unpackedorElse != null
                ? () => unpackedorElse.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0]
                : null),
      ];
    });
    table['lastWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      Closure? unpackedorElse = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['orElse']
          : null;
      return [
        vmObject.lastWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            orElse: unpackedorElse != null
                ? () => unpackedorElse.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0]
                : null),
      ];
    });
    table['singleWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      Closure? unpackedorElse = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['orElse']
          : null;
      return [
        vmObject.singleWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            orElse: unpackedorElse != null
                ? () => unpackedorElse.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0]
                : null),
      ];
    });
    table['elementAt'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.elementAt(luaCallerArguments[1]),
      ];
    });
    table['toString'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.toString(),
      ];
    });
    table['getIterator'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterator>(
            object: vmObject.iterator,
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['getIsEmpty'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.isEmpty,
      ];
    });
    table['getIsNotEmpty'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.isNotEmpty,
      ];
    });
    table['getFirst'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.first,
      ];
    });
    table['getLast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.last,
      ];
    });
    table['getSingle'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.single,
      ];
    });
    table['getHashCode'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.hashCode,
      ];
    });
  }

  final HydroTable table;

  final HydroState hydroState;

  final UnmodifiableListView vmObject;
}

class RTManagedUnmodifiableListView extends UnmodifiableListView
    implements Box<UnmodifiableListView> {
  RTManagedUnmodifiableListView(Iterable<dynamic> source,
      {required this.table, required this.hydroState})
      : super(
          source,
        ) {
    table['vmObject'] = vmObject;
    table['unwrap'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [unwrap()];
    });
    table['_dart_lastIndexOf'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        super.lastIndexOf(
            maybeUnBoxAndBuildArgument<Object?, dynamic>(luaCallerArguments[1],
                parentState: hydroState),
            luaCallerArguments[2])
      ];
    });
    table['_dart_indexOf'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        super.indexOf(
            maybeUnBoxAndBuildArgument<Object?, dynamic>(luaCallerArguments[1],
                parentState: hydroState),
            luaCallerArguments[2])
      ];
    });
    table['_dart_cast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<List<dynamic>>(
            object: super.cast(), hydroState: hydroState, table: HydroTable())
      ];
    });
    table['_dart_getLength'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.length];
    });
    table['_dart_setAll'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.setAll(
          luaCallerArguments[1],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[2],
              parentState: hydroState));
      return [];
    });
    table['_dart_add'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.add(luaCallerArguments[1]);
      return [];
    });
    table['_dart_insert'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.insert(luaCallerArguments[1], luaCallerArguments[2]);
      return [];
    });
    table['_dart_insertAll'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.insertAll(
          luaCallerArguments[1],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[2],
              parentState: hydroState));
      return [];
    });
    table['_dart_addAll'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.addAll(maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
          luaCallerArguments[1],
          parentState: hydroState));
      return [];
    });
    table['_dart_remove'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        super.remove(maybeUnBoxAndBuildArgument<Object?, dynamic>(
            luaCallerArguments[1],
            parentState: hydroState))
      ];
    });
    table['_dart_removeWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      super.removeWhere((element) => unpackedtest.dispatch(
            [luaCallerArguments[0], element],
            parentState: hydroState,
          )[0]);
      return [];
    });
    table['_dart_retainWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      super.retainWhere((element) => unpackedtest.dispatch(
            [luaCallerArguments[0], element],
            parentState: hydroState,
          )[0]);
      return [];
    });
    table['_dart_sort'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure? unpackedcompare = luaCallerArguments[1];
      super.sort(unpackedcompare != null
          ? (a, b) => unpackedcompare.dispatch(
                [luaCallerArguments[0], a, b],
                parentState: hydroState,
              )[0]
          : null);
      return [];
    });
    table['_dart_shuffle'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.shuffle(maybeUnBoxAndBuildArgument<Random?, dynamic>(
          luaCallerArguments[1],
          parentState: hydroState));
      return [];
    });
    table['_dart_clear'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.clear();
      return [];
    });
    table['_dart_removeAt'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.removeAt(luaCallerArguments[1])];
    });
    table['_dart_removeLast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.removeLast()];
    });
    table['_dart_setRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.setRange(
          luaCallerArguments[1],
          luaCallerArguments[2],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[3],
              parentState: hydroState),
          luaCallerArguments[4]);
      return [];
    });
    table['_dart_removeRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.removeRange(luaCallerArguments[1], luaCallerArguments[2]);
      return [];
    });
    table['_dart_replaceRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.replaceRange(
          luaCallerArguments[1],
          luaCallerArguments[2],
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[3],
              parentState: hydroState));
      return [];
    });
    table['_dart_fillRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.fillRange(
          luaCallerArguments[1], luaCallerArguments[2], luaCallerArguments[3]);
      return [];
    });
    table['_dart_setLength'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.length = (luaCallerArguments[1]);
      return [];
    });
    table['_dart_setFirst'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.first = (luaCallerArguments[1]);
      return [];
    });
    table['_dart_setLast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      super.last = (luaCallerArguments[1]);
      return [];
    });
    table['_dart_indexWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        indexWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            luaCallerArguments[2])
      ];
    });
    table['_dart_lastIndexWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        lastIndexWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            luaCallerArguments[2])
      ];
    });
    table['_dart_sublist'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<List<dynamic>>(
            object: sublist(luaCallerArguments[1], luaCallerArguments[2]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_getRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: getRange(luaCallerArguments[1], luaCallerArguments[2]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_asMap'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Map>(
            object: asMap(), hydroState: hydroState, table: HydroTable())
      ];
    });
    table['_dart_getReversed'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [reversed];
    });
    table['_dart_followedBy'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: super.followedBy(
                maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
                    luaCallerArguments[1],
                    parentState: hydroState)),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_map'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedf = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: super.map((e) => unpackedf.dispatch(
                  [luaCallerArguments[0], e],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_where'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: super.where((element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_whereType'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: super.whereType(),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_expand'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedf = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: super.expand((element) =>
                maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
                    unpackedf.dispatch(
                      [luaCallerArguments[0], element],
                      parentState: hydroState,
                    )[0],
                    parentState: hydroState)),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_contains'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        super.contains(maybeUnBoxAndBuildArgument<Object?, dynamic>(
            luaCallerArguments[1],
            parentState: hydroState))
      ];
    });
    table['_dart_forEach'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedf = luaCallerArguments[1];
      super.forEach((element) => unpackedf.dispatch(
            [luaCallerArguments[0], element],
            parentState: hydroState,
          ));
      return [];
    });
    table['_dart_reduce'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedcombine = luaCallerArguments[1];
      return [
        super.reduce((value, element) => unpackedcombine.dispatch(
              [luaCallerArguments[0], value, element],
              parentState: hydroState,
            )[0])
      ];
    });
    table['_dart_fold'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedcombine = luaCallerArguments[2];
      return [
        super.fold(
            luaCallerArguments[1],
            (previousValue, element) => unpackedcombine.dispatch(
                  [luaCallerArguments[0], previousValue, element],
                  parentState: hydroState,
                )[0])
      ];
    });
    table['_dart_every'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        super.every((element) => unpackedtest.dispatch(
              [luaCallerArguments[0], element],
              parentState: hydroState,
            )[0])
      ];
    });
    table['_dart_join'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.join(luaCallerArguments[1])];
    });
    table['_dart_any'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        super.any((element) => unpackedtest.dispatch(
              [luaCallerArguments[0], element],
              parentState: hydroState,
            )[0])
      ];
    });
    table['_dart_toList'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<List<dynamic>>(
            object: super.toList(
                growable: luaCallerArguments.length >= 2
                    ? luaCallerArguments[1]['growable']
                    : null),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_toSet'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Set>(
            object: super.toSet(), hydroState: hydroState, table: HydroTable())
      ];
    });
    table['_dart_take'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: super.take(luaCallerArguments[1]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_takeWhile'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: super.takeWhile((value) => unpackedtest.dispatch(
                  [luaCallerArguments[0], value],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_skip'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Iterable>(
            object: super.skip(luaCallerArguments[1]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_skipWhile'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      return [
        maybeBoxObject<Iterable>(
            object: super.skipWhile((value) => unpackedtest.dispatch(
                  [luaCallerArguments[0], value],
                  parentState: hydroState,
                )[0]),
            hydroState: hydroState,
            table: HydroTable())
      ];
    });
    table['_dart_firstWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      Closure? unpackedorElse = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['orElse']
          : null;
      return [
        super.firstWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            orElse: unpackedorElse != null
                ? () => unpackedorElse.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0]
                : null)
      ];
    });
    table['_dart_lastWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      Closure? unpackedorElse = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['orElse']
          : null;
      return [
        super.lastWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            orElse: unpackedorElse != null
                ? () => unpackedorElse.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0]
                : null)
      ];
    });
    table['_dart_singleWhere'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedtest = luaCallerArguments[1];
      Closure? unpackedorElse = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['orElse']
          : null;
      return [
        super.singleWhere(
            (element) => unpackedtest.dispatch(
                  [luaCallerArguments[0], element],
                  parentState: hydroState,
                )[0],
            orElse: unpackedorElse != null
                ? () => unpackedorElse.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0]
                : null)
      ];
    });
    table['_dart_elementAt'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.elementAt(luaCallerArguments[1])];
    });
    table['_dart_toString'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.toString()];
    });
    table['_dart_getIterator'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [iterator];
    });
    table['_dart_getIsEmpty'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.isEmpty];
    });
    table['_dart_getIsNotEmpty'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.isNotEmpty];
    });
    table['_dart_getFirst'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.first];
    });
    table['_dart_getLast'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.last];
    });
    table['_dart_getSingle'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.single];
    });
    table['_dart_getHashCode'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [super.hashCode];
    });
  }

  final HydroTable table;

  final HydroState hydroState;

  UnmodifiableListView unwrap() => this;
  UnmodifiableListView get vmObject => this;
  @override
  int lastIndexOf(Object? element, [int? start]) {
    Closure closure = table["lastIndexOf"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  int indexOf(Object? element, [int start = 0]) {
    Closure closure = table["indexOf"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  List<R> cast<R>() {
    Closure closure = table["cast"];
    return maybeUnBoxAndBuildArgument<List<R>, R>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  int get length {
    Closure closure = table["getLength"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void setAll(int at, Iterable iterable) {
    Closure closure = table["setAll"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void add(dynamic value) {
    Closure closure = table["add"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void insert(int index, dynamic element) {
    Closure closure = table["insert"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void insertAll(int at, Iterable iterable) {
    Closure closure = table["insertAll"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void addAll(Iterable iterable) {
    Closure closure = table["addAll"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  bool remove(Object? element) {
    Closure closure = table["remove"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void removeWhere(test) {
    Closure closure = table["removeWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void retainWhere(test) {
    Closure closure = table["retainWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void sort([compare]) {
    Closure closure = table["sort"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void shuffle([Random? random]) {
    Closure closure = table["shuffle"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void clear() {
    Closure closure = table["clear"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic removeAt(int index) {
    Closure closure = table["removeAt"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic removeLast() {
    Closure closure = table["removeLast"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void setRange(int start, int end, Iterable iterable, [int skipCount = 0]) {
    Closure closure = table["setRange"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void removeRange(int start, int end) {
    Closure closure = table["removeRange"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void replaceRange(int start, int end, Iterable iterable) {
    Closure closure = table["replaceRange"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void fillRange(int start, int end, [dynamic? fillValue]) {
    Closure closure = table["fillRange"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void set length(int newLength) {
    Closure closure = table["setLength"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void set first(dynamic element) {
    Closure closure = table["setFirst"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void set last(dynamic element) {
    Closure closure = table["setLast"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  int indexWhere(test, [int start = 0]) {
    Closure closure = table["indexWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  int lastIndexWhere(test, [int? start]) {
    Closure closure = table["lastIndexWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  List<dynamic> sublist(int start, [int? end]) {
    Closure closure = table["sublist"];
    return maybeUnBoxAndBuildArgument<List<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> getRange(int start, int end) {
    Closure closure = table["getRange"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Map<int, dynamic> asMap() {
    Closure closure = table["asMap"];
    return maybeUnBoxAndBuildArgument<Map<int, dynamic>, int>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> get reversed {
    Closure closure = table["getReversed"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> followedBy(Iterable other) {
    Closure closure = table["followedBy"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<T> map<T>(f) {
    Closure closure = table["map"];
    return maybeUnBoxAndBuildArgument<Iterable<T>, T>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> where(test) {
    Closure closure = table["where"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<T> whereType<T>() {
    Closure closure = table["whereType"];
    return maybeUnBoxAndBuildArgument<Iterable<T>, T>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<T> expand<T>(f) {
    Closure closure = table["expand"];
    return maybeUnBoxAndBuildArgument<Iterable<T>, T>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  bool contains(Object? element) {
    Closure closure = table["contains"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  void forEach(f) {
    Closure closure = table["forEach"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic reduce(combine) {
    Closure closure = table["reduce"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  T fold<T>(T initialValue, combine) {
    Closure closure = table["fold"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  bool every(test) {
    Closure closure = table["every"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  String join([String separator = ""]) {
    Closure closure = table["join"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  bool any(test) {
    Closure closure = table["any"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  List<dynamic> toList({bool growable = true}) {
    Closure closure = table["toList"];
    return maybeUnBoxAndBuildArgument<List<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Set<dynamic> toSet() {
    Closure closure = table["toSet"];
    return maybeUnBoxAndBuildArgument<Set<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> take(int count) {
    Closure closure = table["take"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> takeWhile(test) {
    Closure closure = table["takeWhile"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> skip(int count) {
    Closure closure = table["skip"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  Iterable<dynamic> skipWhile(test) {
    Closure closure = table["skipWhile"];
    return maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  dynamic firstWhere(test, {orElse}) {
    Closure closure = table["firstWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic lastWhere(test, {orElse}) {
    Closure closure = table["lastWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic singleWhere(test, {orElse}) {
    Closure closure = table["singleWhere"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic elementAt(int index) {
    Closure closure = table["elementAt"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  String toString() {
    Closure closure = table["__tostring"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  Iterator<dynamic> get iterator {
    Closure closure = table["getIterator"];
    return maybeUnBoxAndBuildArgument<Iterator<dynamic>, dynamic>(
        closure.dispatch([table], parentState: hydroState)[0],
        parentState: hydroState);
  }

  @override
  bool get isEmpty {
    Closure closure = table["getIsEmpty"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  bool get isNotEmpty {
    Closure closure = table["getIsNotEmpty"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic get first {
    Closure closure = table["getFirst"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic get last {
    Closure closure = table["getLast"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  dynamic get single {
    Closure closure = table["getSingle"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }

  @override
  int get hashCode {
    Closure closure = table["getHashCode"];
    return closure.dispatch([table], parentState: hydroState)[0];
  }
}

void loadUnmodifiableListView(
    {required HydroState hydroState, required HydroTable table}) {
  table['unmodifiableListView'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      RTManagedUnmodifiableListView(
          maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
              luaCallerArguments[1],
              parentState: hydroState),
          table: luaCallerArguments[0],
          hydroState: hydroState)
    ];
  });
  registerBoxer<UnmodifiableListView>(boxer: (
      {required UnmodifiableListView vmObject,
      required HydroState hydroState,
      required HydroTable table}) {
    return VMManagedUnmodifiableListView(
        vmObject: vmObject, hydroState: hydroState, table: table);
  });
}

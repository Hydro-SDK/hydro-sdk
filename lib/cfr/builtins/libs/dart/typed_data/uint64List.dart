import 'dart:core';
import 'dart:math';
import 'dart:typed_data';

import 'package:hydro_sdk/cfr/runtimeSupport.dart';

class VMManagedUint64List extends VMManagedBox<Uint64List> {
  VMManagedUint64List(
      {required this.table, required this.vmObject, required this.hydroState})
      : super(
          table: table,
          vmObject: vmObject,
          hydroState: hydroState,
        ) {
    table['sublist'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Uint64List>(
            object:
                vmObject.sublist(luaCallerArguments[1], luaCallerArguments[2]),
            hydroState: hydroState,
            table: HydroTable()),
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
    table['add'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.add(luaCallerArguments[1]);
      return [];
    });
    table['addAll'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.addAll(maybeUnBoxAndBuildArgument<Iterable<int>, int>(
          luaCallerArguments[1],
          parentState: hydroState));
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
    table['indexOf'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.indexOf(luaCallerArguments[1], luaCallerArguments[2]),
      ];
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
    table['lastIndexOf'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.lastIndexOf(luaCallerArguments[1], luaCallerArguments[2]),
      ];
    });
    table['clear'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.clear();
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
          maybeUnBoxAndBuildArgument<Iterable<int>, int>(luaCallerArguments[2],
              parentState: hydroState));
      return [];
    });
    table['setAll'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.setAll(
          luaCallerArguments[1],
          maybeUnBoxAndBuildArgument<Iterable<int>, int>(luaCallerArguments[2],
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
    table['setRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.setRange(
          luaCallerArguments[1],
          luaCallerArguments[2],
          maybeUnBoxAndBuildArgument<Iterable<int>, int>(luaCallerArguments[3],
              parentState: hydroState),
          luaCallerArguments[4]);
      return [];
    });
    table['removeRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.removeRange(luaCallerArguments[1], luaCallerArguments[2]);
      return [];
    });
    table['fillRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.fillRange(
          luaCallerArguments[1], luaCallerArguments[2], luaCallerArguments[3]);
      return [];
    });
    table['replaceRange'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.replaceRange(
          luaCallerArguments[1],
          luaCallerArguments[2],
          maybeUnBoxAndBuildArgument<Iterable<int>, int>(luaCallerArguments[3],
              parentState: hydroState));
      return [];
    });
    table['asMap'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Map>(
            object: vmObject.asMap(),
            hydroState: hydroState,
            table: HydroTable()),
      ];
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
    table['getLength'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.length,
      ];
    });
    table['setLength'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.length = (luaCallerArguments[1]);
      return [];
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
                maybeUnBoxAndBuildArgument<Iterable<int>, int>(
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
    table['getElementSizeInBytes'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.elementSizeInBytes,
      ];
    });
    table['getOffsetInBytes'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.offsetInBytes,
      ];
    });
    table['getLengthInBytes'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        vmObject.lengthInBytes,
      ];
    });
    table['getBuffer'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<ByteBuffer>(
            object: vmObject.buffer,
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
  }

  final HydroTable table;

  final HydroState hydroState;

  final Uint64List vmObject;
}

void loadUint64List(
    {required HydroState hydroState, required HydroTable table}) {
  table['uint64List'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Uint64List>(
          object: Uint64List(luaCallerArguments[1]),
          hydroState: hydroState,
          table: luaCallerArguments[0])
    ];
  });
  table['uint64ListFromList'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Uint64List>(
          object: Uint64List.fromList(
              maybeUnBoxAndBuildArgument<List<int>, int>(luaCallerArguments[1],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['uint64ListView'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Uint64List>(
          object: Uint64List.view(
              maybeUnBoxAndBuildArgument<ByteBuffer, dynamic>(
                  luaCallerArguments[1],
                  parentState: hydroState),
              luaCallerArguments[2],
              luaCallerArguments[3]),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['uint64ListSublistView'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Uint64List>(
          object: Uint64List.sublistView(
              maybeUnBoxAndBuildArgument<TypedData, dynamic>(
                  luaCallerArguments[1],
                  parentState: hydroState),
              luaCallerArguments[2],
              luaCallerArguments[3]),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  registerBoxer<Uint64List>(boxer: (
      {required Uint64List vmObject,
      required HydroState hydroState,
      required HydroTable table}) {
    return VMManagedUint64List(
        vmObject: vmObject, hydroState: hydroState, table: table);
  });
}

import 'package:analyzer/dart/ast/ast.dart'
    show
        ConstructorName,
        InstanceCreationExpression,
        IntegerLiteral,
        StringLiteral,
        NamedExpression,
        Label,
        SimpleStringLiteral,
        SimpleIdentifier,
        BooleanLiteral,
        ArgumentList,
        PrefixedIdentifier,
        DoubleLiteral;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import 'package:hydro_sdk/swid/ir/frontend/dart/swidBooleanLiteral.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidIntegerLiteral.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidStaticConst.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidStaticConstFieldReference.dart';
import 'package:hydro_sdk/swid/ir/frontend/dart/swidStringLiteral.dart';

part 'swidStaticConstFunctionInvocation.freezed.dart';
part 'swidStaticConstFunctionInvocation.g.dart';

@freezed
abstract class SwidStaticConstFunctionInvocation
    with _$SwidStaticConstFunctionInvocation {
  factory SwidStaticConstFunctionInvocation({
    @required String value,
    @required List<SwidStaticConst> normalParameters,
    @required Map<String, SwidStaticConst> namedParameters,
    @required bool isConstructorInvocation,
  }) = _$Data;

  factory SwidStaticConstFunctionInvocation.fromJson(
          Map<String, dynamic> json) =>
      _$SwidStaticConstFunctionInvocationFromJson(json);

  factory SwidStaticConstFunctionInvocation.fromInstanceCreationExpression(
      {@required InstanceCreationExpression instanceCreationExpression}) {
    ConstructorName constructor = instanceCreationExpression.childEntities
        .firstWhere((x) => x is ConstructorName);
    return SwidStaticConstFunctionInvocation(
        value: constructor.type.name.name +
            (constructor.name != null ? ".${constructor.name.name}" : ""),
        normalParameters: (instanceCreationExpression.childEntities
                    ?.firstWhere((x) => x is ArgumentList) as ArgumentList)
                ?.childEntities
                ?.map((x) {
              if (x is IntegerLiteral) {
                return SwidStaticConst.fromSwidIntegerLiteral(
                    swidIntegerLiteral: SwidIntegerLiteral.fromIntegerLiteral(
                        integerLiteral: x));
              } else if (x is StringLiteral) {
                return SwidStaticConst.fromSwidStringLiteral(
                    swidStringLiteral: SwidStringLiteral(value: x.stringValue));
              } else if (x is DoubleLiteral) {
                return SwidStaticConst.fromSwidIntegerLiteral(
                    swidIntegerLiteral:
                        SwidIntegerLiteral(value: "${x.value}"));
              } else if (x is PrefixedIdentifier) {
                return SwidStaticConst.fromSwidStaticConstFieldReference(
                    swidStaticConstFieldReference:
                        SwidStaticConstFieldReference(name: x.name));
              }
            })?.toList() ??
            []
          ..removeWhere((x) => x == null),
        namedParameters: Map.fromEntries((instanceCreationExpression
                    .childEntities
                    .firstWhere((x) => x is ArgumentList) as ArgumentList)
                ?.childEntities
                ?.map((x) {
              if (x is NamedExpression) {
                var argument = x.childEntities.firstWhere(
                    (x) =>
                        x is SimpleStringLiteral ||
                        x is BooleanLiteral ||
                        x is SimpleIdentifier,
                    orElse: () => null);
                return MapEntry(
                    (x.childEntities.firstWhere((x) => x is Label) as Label)
                        .label
                        .name,
                    argument is SimpleStringLiteral
                        ? SwidStaticConst.fromSwidStringLiteral(
                            swidStringLiteral:
                                SwidStringLiteral(value: argument.value))
                        : argument is BooleanLiteral
                            ? SwidStaticConst.fromSwidBooleanLiteral(
                                swidBooleanLiteral: SwidBooleanLiteral(
                                    value: argument.value.toString()))
                            : argument is SimpleIdentifier
                                ? SwidStaticConst
                                    .fromSwidStaticConstFieldReference(
                                        swidStaticConstFieldReference:
                                            SwidStaticConstFieldReference
                                                .fromSimpleIdentifier(
                                                    simpleIdentifier: argument))
                                : null);
              }
              return MapEntry(null, null);
            })?.toList() ??
            {})
          ..remove(null),
        isConstructorInvocation: constructor.name == null);
  }
}

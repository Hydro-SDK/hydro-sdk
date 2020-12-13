import 'package:hydro_sdk/swid/ir/frontend/dart/swidFunctionType.dart';
import 'package:hydro_sdk/swid/transforms/transformToCamelCase.dart';
import 'package:meta/meta.dart';

class TsFunctionDefaultNamedPropsObjectName {
  final SwidFunctionType swidFunctionType;

  TsFunctionDefaultNamedPropsObjectName({@required this.swidFunctionType});

  String toTsSource() =>
      "${transformToCamelCase(str: swidFunctionType.name)}DefaultProps";
}

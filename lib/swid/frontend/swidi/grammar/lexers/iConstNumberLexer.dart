import 'package:meta/meta.dart';
import 'package:petitparser/petitparser.dart';

@optionalTypeArgs
@immutable
abstract class IConstNumberLexer<T extends dynamic, U extends Parser<T>> {
  const IConstNumberLexer();

  U constNumber();
}

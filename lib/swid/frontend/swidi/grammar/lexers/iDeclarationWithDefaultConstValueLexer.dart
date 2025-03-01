import 'package:meta/meta.dart';
import 'package:petitparser/petitparser.dart';

import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iConstLexer.dart';
import 'package:hydro_sdk/swid/frontend/swidi/grammar/lexers/iSimpleDeclarationLexer.dart';

@optionalTypeArgs
@immutable
abstract class IDeclarationWithDefaultConstValueLexer<T extends dynamic,
        U extends Parser<T>>
    implements ISimpleDeclarationLexer<T, U>, IConstLexer<T, U> {
  const IDeclarationWithDefaultConstValueLexer();

  U declarationWithDefaultConstValue();
}

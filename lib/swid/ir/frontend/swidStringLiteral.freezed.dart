// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'swidStringLiteral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SwidStringLiteral _$SwidStringLiteralFromJson(Map<String, dynamic> json) {
  return _$Data.fromJson(json);
}

/// @nodoc
class _$SwidStringLiteralTearOff {
  const _$SwidStringLiteralTearOff();

// ignore: unused_element
  _$Data call({@required String value}) {
    return _$Data(
      value: value,
    );
  }

// ignore: unused_element
  SwidStringLiteral fromJson(Map<String, Object> json) {
    return SwidStringLiteral.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SwidStringLiteral = _$SwidStringLiteralTearOff();

/// @nodoc
mixin _$SwidStringLiteral {
  String get value;

  Map<String, dynamic> toJson();
  $SwidStringLiteralCopyWith<SwidStringLiteral> get copyWith;
}

/// @nodoc
abstract class $SwidStringLiteralCopyWith<$Res> {
  factory $SwidStringLiteralCopyWith(
          SwidStringLiteral value, $Res Function(SwidStringLiteral) then) =
      _$SwidStringLiteralCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$SwidStringLiteralCopyWithImpl<$Res>
    implements $SwidStringLiteralCopyWith<$Res> {
  _$SwidStringLiteralCopyWithImpl(this._value, this._then);

  final SwidStringLiteral _value;
  // ignore: unused_field
  final $Res Function(SwidStringLiteral) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as String,
    ));
  }
}

/// @nodoc
abstract class _$$DataCopyWith<$Res>
    implements $SwidStringLiteralCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res> extends _$SwidStringLiteralCopyWithImpl<$Res>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, (v) => _then(v as _$Data));

  @override
  _$Data get _value => super._value as _$Data;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_$Data(
      value: value == freezed ? _value.value : value as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_$Data implements _$Data {
  _$_$Data({@required this.value}) : assert(value != null);

  factory _$_$Data.fromJson(Map<String, dynamic> json) =>
      _$_$_$DataFromJson(json);

  @override
  final String value;

  @override
  String toString() {
    return 'SwidStringLiteral(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _$Data &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_$DataToJson(this);
  }
}

abstract class _$Data implements SwidStringLiteral {
  factory _$Data({@required String value}) = _$_$Data;

  factory _$Data.fromJson(Map<String, dynamic> json) = _$_$Data.fromJson;

  @override
  String get value;
  @override
  _$$DataCopyWith<_$Data> get copyWith;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_learn_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToLearnWord _$ToLearnWordFromJson(Map<String, dynamic> json) {
  return _ToLearnWord.fromJson(json);
}

/// @nodoc
mixin _$ToLearnWord {
  String get x => throw _privateConstructorUsedError;
  String get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToLearnWordCopyWith<ToLearnWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToLearnWordCopyWith<$Res> {
  factory $ToLearnWordCopyWith(
          ToLearnWord value, $Res Function(ToLearnWord) then) =
      _$ToLearnWordCopyWithImpl<$Res, ToLearnWord>;
  @useResult
  $Res call({String x, String y});
}

/// @nodoc
class _$ToLearnWordCopyWithImpl<$Res, $Val extends ToLearnWord>
    implements $ToLearnWordCopyWith<$Res> {
  _$ToLearnWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToLearnWordImplCopyWith<$Res>
    implements $ToLearnWordCopyWith<$Res> {
  factory _$$ToLearnWordImplCopyWith(
          _$ToLearnWordImpl value, $Res Function(_$ToLearnWordImpl) then) =
      __$$ToLearnWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String x, String y});
}

/// @nodoc
class __$$ToLearnWordImplCopyWithImpl<$Res>
    extends _$ToLearnWordCopyWithImpl<$Res, _$ToLearnWordImpl>
    implements _$$ToLearnWordImplCopyWith<$Res> {
  __$$ToLearnWordImplCopyWithImpl(
      _$ToLearnWordImpl _value, $Res Function(_$ToLearnWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$ToLearnWordImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToLearnWordImpl implements _ToLearnWord {
  const _$ToLearnWordImpl({required this.x, required this.y});

  factory _$ToLearnWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToLearnWordImplFromJson(json);

  @override
  final String x;
  @override
  final String y;

  @override
  String toString() {
    return 'ToLearnWord(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToLearnWordImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToLearnWordImplCopyWith<_$ToLearnWordImpl> get copyWith =>
      __$$ToLearnWordImplCopyWithImpl<_$ToLearnWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToLearnWordImplToJson(
      this,
    );
  }
}

abstract class _ToLearnWord implements ToLearnWord {
  const factory _ToLearnWord(
      {required final String x, required final String y}) = _$ToLearnWordImpl;

  factory _ToLearnWord.fromJson(Map<String, dynamic> json) =
      _$ToLearnWordImpl.fromJson;

  @override
  String get x;
  @override
  String get y;
  @override
  @JsonKey(ignore: true)
  _$$ToLearnWordImplCopyWith<_$ToLearnWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learn_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LearnMethod _$LearnMethodFromJson(Map<String, dynamic> json) {
  return _LearnMethod.fromJson(json);
}

/// @nodoc
mixin _$LearnMethod {
  bool get flashcard => throw _privateConstructorUsedError;
  bool get spelling => throw _privateConstructorUsedError;
  bool get test => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearnMethodCopyWith<LearnMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearnMethodCopyWith<$Res> {
  factory $LearnMethodCopyWith(
          LearnMethod value, $Res Function(LearnMethod) then) =
      _$LearnMethodCopyWithImpl<$Res, LearnMethod>;
  @useResult
  $Res call({bool flashcard, bool spelling, bool test});
}

/// @nodoc
class _$LearnMethodCopyWithImpl<$Res, $Val extends LearnMethod>
    implements $LearnMethodCopyWith<$Res> {
  _$LearnMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = null,
    Object? spelling = null,
    Object? test = null,
  }) {
    return _then(_value.copyWith(
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as bool,
      spelling: null == spelling
          ? _value.spelling
          : spelling // ignore: cast_nullable_to_non_nullable
              as bool,
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearnMethodImplCopyWith<$Res>
    implements $LearnMethodCopyWith<$Res> {
  factory _$$LearnMethodImplCopyWith(
          _$LearnMethodImpl value, $Res Function(_$LearnMethodImpl) then) =
      __$$LearnMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool flashcard, bool spelling, bool test});
}

/// @nodoc
class __$$LearnMethodImplCopyWithImpl<$Res>
    extends _$LearnMethodCopyWithImpl<$Res, _$LearnMethodImpl>
    implements _$$LearnMethodImplCopyWith<$Res> {
  __$$LearnMethodImplCopyWithImpl(
      _$LearnMethodImpl _value, $Res Function(_$LearnMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = null,
    Object? spelling = null,
    Object? test = null,
  }) {
    return _then(_$LearnMethodImpl(
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as bool,
      spelling: null == spelling
          ? _value.spelling
          : spelling // ignore: cast_nullable_to_non_nullable
              as bool,
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearnMethodImpl implements _LearnMethod {
  const _$LearnMethodImpl(
      {required this.flashcard, required this.spelling, required this.test});

  factory _$LearnMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearnMethodImplFromJson(json);

  @override
  final bool flashcard;
  @override
  final bool spelling;
  @override
  final bool test;

  @override
  String toString() {
    return 'LearnMethod(flashcard: $flashcard, spelling: $spelling, test: $test)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearnMethodImpl &&
            (identical(other.flashcard, flashcard) ||
                other.flashcard == flashcard) &&
            (identical(other.spelling, spelling) ||
                other.spelling == spelling) &&
            (identical(other.test, test) || other.test == test));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flashcard, spelling, test);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearnMethodImplCopyWith<_$LearnMethodImpl> get copyWith =>
      __$$LearnMethodImplCopyWithImpl<_$LearnMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearnMethodImplToJson(
      this,
    );
  }
}

abstract class _LearnMethod implements LearnMethod {
  const factory _LearnMethod(
      {required final bool flashcard,
      required final bool spelling,
      required final bool test}) = _$LearnMethodImpl;

  factory _LearnMethod.fromJson(Map<String, dynamic> json) =
      _$LearnMethodImpl.fromJson;

  @override
  bool get flashcard;
  @override
  bool get spelling;
  @override
  bool get test;
  @override
  @JsonKey(ignore: true)
  _$$LearnMethodImplCopyWith<_$LearnMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

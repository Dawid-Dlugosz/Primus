// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TestWord {
  String get answerA => throw _privateConstructorUsedError;
  String get answerB => throw _privateConstructorUsedError;
  String get answerC => throw _privateConstructorUsedError;
  String get answerD => throw _privateConstructorUsedError;
  Word get word => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestWordCopyWith<TestWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestWordCopyWith<$Res> {
  factory $TestWordCopyWith(TestWord value, $Res Function(TestWord) then) =
      _$TestWordCopyWithImpl<$Res, TestWord>;
  @useResult
  $Res call(
      {String answerA,
      String answerB,
      String answerC,
      String answerD,
      Word word,
      String? answer});

  $WordCopyWith<$Res> get word;
}

/// @nodoc
class _$TestWordCopyWithImpl<$Res, $Val extends TestWord>
    implements $TestWordCopyWith<$Res> {
  _$TestWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerA = null,
    Object? answerB = null,
    Object? answerC = null,
    Object? answerD = null,
    Object? word = null,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      answerA: null == answerA
          ? _value.answerA
          : answerA // ignore: cast_nullable_to_non_nullable
              as String,
      answerB: null == answerB
          ? _value.answerB
          : answerB // ignore: cast_nullable_to_non_nullable
              as String,
      answerC: null == answerC
          ? _value.answerC
          : answerC // ignore: cast_nullable_to_non_nullable
              as String,
      answerD: null == answerD
          ? _value.answerD
          : answerD // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res> get word {
    return $WordCopyWith<$Res>(_value.word, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TestWordImplCopyWith<$Res>
    implements $TestWordCopyWith<$Res> {
  factory _$$TestWordImplCopyWith(
          _$TestWordImpl value, $Res Function(_$TestWordImpl) then) =
      __$$TestWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String answerA,
      String answerB,
      String answerC,
      String answerD,
      Word word,
      String? answer});

  @override
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class __$$TestWordImplCopyWithImpl<$Res>
    extends _$TestWordCopyWithImpl<$Res, _$TestWordImpl>
    implements _$$TestWordImplCopyWith<$Res> {
  __$$TestWordImplCopyWithImpl(
      _$TestWordImpl _value, $Res Function(_$TestWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerA = null,
    Object? answerB = null,
    Object? answerC = null,
    Object? answerD = null,
    Object? word = null,
    Object? answer = freezed,
  }) {
    return _then(_$TestWordImpl(
      answerA: null == answerA
          ? _value.answerA
          : answerA // ignore: cast_nullable_to_non_nullable
              as String,
      answerB: null == answerB
          ? _value.answerB
          : answerB // ignore: cast_nullable_to_non_nullable
              as String,
      answerC: null == answerC
          ? _value.answerC
          : answerC // ignore: cast_nullable_to_non_nullable
              as String,
      answerD: null == answerD
          ? _value.answerD
          : answerD // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TestWordImpl implements _TestWord {
  const _$TestWordImpl(
      {required this.answerA,
      required this.answerB,
      required this.answerC,
      required this.answerD,
      required this.word,
      this.answer});

  @override
  final String answerA;
  @override
  final String answerB;
  @override
  final String answerC;
  @override
  final String answerD;
  @override
  final Word word;
  @override
  final String? answer;

  @override
  String toString() {
    return 'TestWord(answerA: $answerA, answerB: $answerB, answerC: $answerC, answerD: $answerD, word: $word, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestWordImpl &&
            (identical(other.answerA, answerA) || other.answerA == answerA) &&
            (identical(other.answerB, answerB) || other.answerB == answerB) &&
            (identical(other.answerC, answerC) || other.answerC == answerC) &&
            (identical(other.answerD, answerD) || other.answerD == answerD) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, answerA, answerB, answerC, answerD, word, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestWordImplCopyWith<_$TestWordImpl> get copyWith =>
      __$$TestWordImplCopyWithImpl<_$TestWordImpl>(this, _$identity);
}

abstract class _TestWord implements TestWord {
  const factory _TestWord(
      {required final String answerA,
      required final String answerB,
      required final String answerC,
      required final String answerD,
      required final Word word,
      final String? answer}) = _$TestWordImpl;

  @override
  String get answerA;
  @override
  String get answerB;
  @override
  String get answerC;
  @override
  String get answerD;
  @override
  Word get word;
  @override
  String? get answer;
  @override
  @JsonKey(ignore: true)
  _$$TestWordImplCopyWith<_$TestWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

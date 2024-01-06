// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spelling_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpellingWord {
  Word get word => throw _privateConstructorUsedError;
  bool get showHint => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;
  String? get enteredWord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpellingWordCopyWith<SpellingWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpellingWordCopyWith<$Res> {
  factory $SpellingWordCopyWith(
          SpellingWord value, $Res Function(SpellingWord) then) =
      _$SpellingWordCopyWithImpl<$Res, SpellingWord>;
  @useResult
  $Res call({Word word, bool showHint, bool correct, String? enteredWord});

  $WordCopyWith<$Res> get word;
}

/// @nodoc
class _$SpellingWordCopyWithImpl<$Res, $Val extends SpellingWord>
    implements $SpellingWordCopyWith<$Res> {
  _$SpellingWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? showHint = null,
    Object? correct = null,
    Object? enteredWord = freezed,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
      showHint: null == showHint
          ? _value.showHint
          : showHint // ignore: cast_nullable_to_non_nullable
              as bool,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      enteredWord: freezed == enteredWord
          ? _value.enteredWord
          : enteredWord // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SpellingWordImplCopyWith<$Res>
    implements $SpellingWordCopyWith<$Res> {
  factory _$$SpellingWordImplCopyWith(
          _$SpellingWordImpl value, $Res Function(_$SpellingWordImpl) then) =
      __$$SpellingWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Word word, bool showHint, bool correct, String? enteredWord});

  @override
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class __$$SpellingWordImplCopyWithImpl<$Res>
    extends _$SpellingWordCopyWithImpl<$Res, _$SpellingWordImpl>
    implements _$$SpellingWordImplCopyWith<$Res> {
  __$$SpellingWordImplCopyWithImpl(
      _$SpellingWordImpl _value, $Res Function(_$SpellingWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? showHint = null,
    Object? correct = null,
    Object? enteredWord = freezed,
  }) {
    return _then(_$SpellingWordImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
      showHint: null == showHint
          ? _value.showHint
          : showHint // ignore: cast_nullable_to_non_nullable
              as bool,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      enteredWord: freezed == enteredWord
          ? _value.enteredWord
          : enteredWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SpellingWordImpl extends _SpellingWord {
  const _$SpellingWordImpl(
      {required this.word,
      required this.showHint,
      required this.correct,
      this.enteredWord})
      : super._();

  @override
  final Word word;
  @override
  final bool showHint;
  @override
  final bool correct;
  @override
  final String? enteredWord;

  @override
  String toString() {
    return 'SpellingWord(word: $word, showHint: $showHint, correct: $correct, enteredWord: $enteredWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpellingWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.showHint, showHint) ||
                other.showHint == showHint) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.enteredWord, enteredWord) ||
                other.enteredWord == enteredWord));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, word, showHint, correct, enteredWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpellingWordImplCopyWith<_$SpellingWordImpl> get copyWith =>
      __$$SpellingWordImplCopyWithImpl<_$SpellingWordImpl>(this, _$identity);
}

abstract class _SpellingWord extends SpellingWord {
  const factory _SpellingWord(
      {required final Word word,
      required final bool showHint,
      required final bool correct,
      final String? enteredWord}) = _$SpellingWordImpl;
  const _SpellingWord._() : super._();

  @override
  Word get word;
  @override
  bool get showHint;
  @override
  bool get correct;
  @override
  String? get enteredWord;
  @override
  @JsonKey(ignore: true)
  _$$SpellingWordImplCopyWith<_$SpellingWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

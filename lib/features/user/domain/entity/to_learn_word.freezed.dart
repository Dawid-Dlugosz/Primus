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
  LearnMethod get learnMethod => throw _privateConstructorUsedError;
  Word get word => throw _privateConstructorUsedError;

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
  $Res call({LearnMethod learnMethod, Word word});

  $LearnMethodCopyWith<$Res> get learnMethod;
  $WordCopyWith<$Res> get word;
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
    Object? learnMethod = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      learnMethod: null == learnMethod
          ? _value.learnMethod
          : learnMethod // ignore: cast_nullable_to_non_nullable
              as LearnMethod,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LearnMethodCopyWith<$Res> get learnMethod {
    return $LearnMethodCopyWith<$Res>(_value.learnMethod, (value) {
      return _then(_value.copyWith(learnMethod: value) as $Val);
    });
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
abstract class _$$ToLearnWordImplCopyWith<$Res>
    implements $ToLearnWordCopyWith<$Res> {
  factory _$$ToLearnWordImplCopyWith(
          _$ToLearnWordImpl value, $Res Function(_$ToLearnWordImpl) then) =
      __$$ToLearnWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LearnMethod learnMethod, Word word});

  @override
  $LearnMethodCopyWith<$Res> get learnMethod;
  @override
  $WordCopyWith<$Res> get word;
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
    Object? learnMethod = null,
    Object? word = null,
  }) {
    return _then(_$ToLearnWordImpl(
      learnMethod: null == learnMethod
          ? _value.learnMethod
          : learnMethod // ignore: cast_nullable_to_non_nullable
              as LearnMethod,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ToLearnWordImpl extends _ToLearnWord {
  const _$ToLearnWordImpl({required this.learnMethod, required this.word})
      : super._();

  factory _$ToLearnWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToLearnWordImplFromJson(json);

  @override
  final LearnMethod learnMethod;
  @override
  final Word word;

  @override
  String toString() {
    return 'ToLearnWord(learnMethod: $learnMethod, word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToLearnWordImpl &&
            (identical(other.learnMethod, learnMethod) ||
                other.learnMethod == learnMethod) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, learnMethod, word);

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

abstract class _ToLearnWord extends ToLearnWord {
  const factory _ToLearnWord(
      {required final LearnMethod learnMethod,
      required final Word word}) = _$ToLearnWordImpl;
  const _ToLearnWord._() : super._();

  factory _ToLearnWord.fromJson(Map<String, dynamic> json) =
      _$ToLearnWordImpl.fromJson;

  @override
  LearnMethod get learnMethod;
  @override
  Word get word;
  @override
  @JsonKey(ignore: true)
  _$$ToLearnWordImplCopyWith<_$ToLearnWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlashCard _$FlashCardFromJson(Map<String, dynamic> json) {
  return _FlashCard.fromJson(json);
}

/// @nodoc
mixin _$FlashCard {
  String get id => throw _privateConstructorUsedError;
  String get languageSet => throw _privateConstructorUsedError;
  String get nameSet => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashCardCopyWith<FlashCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashCardCopyWith<$Res> {
  factory $FlashCardCopyWith(FlashCard value, $Res Function(FlashCard) then) =
      _$FlashCardCopyWithImpl<$Res, FlashCard>;
  @useResult
  $Res call(
      {String id,
      String languageSet,
      String nameSet,
      int timeStamp,
      List<Word> words});
}

/// @nodoc
class _$FlashCardCopyWithImpl<$Res, $Val extends FlashCard>
    implements $FlashCardCopyWith<$Res> {
  _$FlashCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? languageSet = null,
    Object? nameSet = null,
    Object? timeStamp = null,
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      languageSet: null == languageSet
          ? _value.languageSet
          : languageSet // ignore: cast_nullable_to_non_nullable
              as String,
      nameSet: null == nameSet
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashCardImplCopyWith<$Res>
    implements $FlashCardCopyWith<$Res> {
  factory _$$FlashCardImplCopyWith(
          _$FlashCardImpl value, $Res Function(_$FlashCardImpl) then) =
      __$$FlashCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String languageSet,
      String nameSet,
      int timeStamp,
      List<Word> words});
}

/// @nodoc
class __$$FlashCardImplCopyWithImpl<$Res>
    extends _$FlashCardCopyWithImpl<$Res, _$FlashCardImpl>
    implements _$$FlashCardImplCopyWith<$Res> {
  __$$FlashCardImplCopyWithImpl(
      _$FlashCardImpl _value, $Res Function(_$FlashCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? languageSet = null,
    Object? nameSet = null,
    Object? timeStamp = null,
    Object? words = null,
  }) {
    return _then(_$FlashCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      languageSet: null == languageSet
          ? _value.languageSet
          : languageSet // ignore: cast_nullable_to_non_nullable
              as String,
      nameSet: null == nameSet
          ? _value.nameSet
          : nameSet // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$FlashCardImpl implements _FlashCard {
  const _$FlashCardImpl(
      {required this.id,
      required this.languageSet,
      required this.nameSet,
      required this.timeStamp,
      required final List<Word> words})
      : _words = words;

  factory _$FlashCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashCardImplFromJson(json);

  @override
  final String id;
  @override
  final String languageSet;
  @override
  final String nameSet;
  @override
  final int timeStamp;
  final List<Word> _words;
  @override
  List<Word> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'FlashCard(id: $id, languageSet: $languageSet, nameSet: $nameSet, timeStamp: $timeStamp, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.languageSet, languageSet) ||
                other.languageSet == languageSet) &&
            (identical(other.nameSet, nameSet) || other.nameSet == nameSet) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, languageSet, nameSet,
      timeStamp, const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashCardImplCopyWith<_$FlashCardImpl> get copyWith =>
      __$$FlashCardImplCopyWithImpl<_$FlashCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashCardImplToJson(
      this,
    );
  }
}

abstract class _FlashCard implements FlashCard {
  const factory _FlashCard(
      {required final String id,
      required final String languageSet,
      required final String nameSet,
      required final int timeStamp,
      required final List<Word> words}) = _$FlashCardImpl;

  factory _FlashCard.fromJson(Map<String, dynamic> json) =
      _$FlashCardImpl.fromJson;

  @override
  String get id;
  @override
  String get languageSet;
  @override
  String get nameSet;
  @override
  int get timeStamp;
  @override
  List<Word> get words;
  @override
  @JsonKey(ignore: true)
  _$$FlashCardImplCopyWith<_$FlashCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

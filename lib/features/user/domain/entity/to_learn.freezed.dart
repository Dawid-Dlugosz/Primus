// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_learn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToLearn _$ToLearnFromJson(Map<String, dynamic> json) {
  return _ToLearn.fromJson(json);
}

/// @nodoc
mixin _$ToLearn {
  String get flashcardId => throw _privateConstructorUsedError;
  List<ToLearnWord> get words => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToLearnCopyWith<ToLearn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToLearnCopyWith<$Res> {
  factory $ToLearnCopyWith(ToLearn value, $Res Function(ToLearn) then) =
      _$ToLearnCopyWithImpl<$Res, ToLearn>;
  @useResult
  $Res call({String flashcardId, List<ToLearnWord> words, int timeStamp});
}

/// @nodoc
class _$ToLearnCopyWithImpl<$Res, $Val extends ToLearn>
    implements $ToLearnCopyWith<$Res> {
  _$ToLearnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcardId = null,
    Object? words = null,
    Object? timeStamp = null,
  }) {
    return _then(_value.copyWith(
      flashcardId: null == flashcardId
          ? _value.flashcardId
          : flashcardId // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<ToLearnWord>,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToLearnImplCopyWith<$Res> implements $ToLearnCopyWith<$Res> {
  factory _$$ToLearnImplCopyWith(
          _$ToLearnImpl value, $Res Function(_$ToLearnImpl) then) =
      __$$ToLearnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flashcardId, List<ToLearnWord> words, int timeStamp});
}

/// @nodoc
class __$$ToLearnImplCopyWithImpl<$Res>
    extends _$ToLearnCopyWithImpl<$Res, _$ToLearnImpl>
    implements _$$ToLearnImplCopyWith<$Res> {
  __$$ToLearnImplCopyWithImpl(
      _$ToLearnImpl _value, $Res Function(_$ToLearnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcardId = null,
    Object? words = null,
    Object? timeStamp = null,
  }) {
    return _then(_$ToLearnImpl(
      flashcardId: null == flashcardId
          ? _value.flashcardId
          : flashcardId // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<ToLearnWord>,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ToLearnImpl implements _ToLearn {
  const _$ToLearnImpl(
      {required this.flashcardId,
      required final List<ToLearnWord> words,
      required this.timeStamp})
      : _words = words;

  factory _$ToLearnImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToLearnImplFromJson(json);

  @override
  final String flashcardId;
  final List<ToLearnWord> _words;
  @override
  List<ToLearnWord> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  final int timeStamp;

  @override
  String toString() {
    return 'ToLearn(flashcardId: $flashcardId, words: $words, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToLearnImpl &&
            (identical(other.flashcardId, flashcardId) ||
                other.flashcardId == flashcardId) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flashcardId,
      const DeepCollectionEquality().hash(_words), timeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToLearnImplCopyWith<_$ToLearnImpl> get copyWith =>
      __$$ToLearnImplCopyWithImpl<_$ToLearnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToLearnImplToJson(
      this,
    );
  }
}

abstract class _ToLearn implements ToLearn {
  const factory _ToLearn(
      {required final String flashcardId,
      required final List<ToLearnWord> words,
      required final int timeStamp}) = _$ToLearnImpl;

  factory _ToLearn.fromJson(Map<String, dynamic> json) = _$ToLearnImpl.fromJson;

  @override
  String get flashcardId;
  @override
  List<ToLearnWord> get words;
  @override
  int get timeStamp;
  @override
  @JsonKey(ignore: true)
  _$$ToLearnImplCopyWith<_$ToLearnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

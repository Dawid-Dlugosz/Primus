// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlashcardSet _$FlashcardSetFromJson(Map<String, dynamic> json) {
  return _FlashcardSet.fromJson(json);
}

/// @nodoc
mixin _$FlashcardSet {
  FlashCard get flashCard => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashcardSetCopyWith<FlashcardSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardSetCopyWith<$Res> {
  factory $FlashcardSetCopyWith(
          FlashcardSet value, $Res Function(FlashcardSet) then) =
      _$FlashcardSetCopyWithImpl<$Res, FlashcardSet>;
  @useResult
  $Res call({FlashCard flashCard, String ownerId});

  $FlashCardCopyWith<$Res> get flashCard;
}

/// @nodoc
class _$FlashcardSetCopyWithImpl<$Res, $Val extends FlashcardSet>
    implements $FlashcardSetCopyWith<$Res> {
  _$FlashcardSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashCard = null,
    Object? ownerId = null,
  }) {
    return _then(_value.copyWith(
      flashCard: null == flashCard
          ? _value.flashCard
          : flashCard // ignore: cast_nullable_to_non_nullable
              as FlashCard,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FlashCardCopyWith<$Res> get flashCard {
    return $FlashCardCopyWith<$Res>(_value.flashCard, (value) {
      return _then(_value.copyWith(flashCard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlashcardSetImplCopyWith<$Res>
    implements $FlashcardSetCopyWith<$Res> {
  factory _$$FlashcardSetImplCopyWith(
          _$FlashcardSetImpl value, $Res Function(_$FlashcardSetImpl) then) =
      __$$FlashcardSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FlashCard flashCard, String ownerId});

  @override
  $FlashCardCopyWith<$Res> get flashCard;
}

/// @nodoc
class __$$FlashcardSetImplCopyWithImpl<$Res>
    extends _$FlashcardSetCopyWithImpl<$Res, _$FlashcardSetImpl>
    implements _$$FlashcardSetImplCopyWith<$Res> {
  __$$FlashcardSetImplCopyWithImpl(
      _$FlashcardSetImpl _value, $Res Function(_$FlashcardSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashCard = null,
    Object? ownerId = null,
  }) {
    return _then(_$FlashcardSetImpl(
      flashCard: null == flashCard
          ? _value.flashCard
          : flashCard // ignore: cast_nullable_to_non_nullable
              as FlashCard,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$FlashcardSetImpl implements _FlashcardSet {
  const _$FlashcardSetImpl({required this.flashCard, required this.ownerId});

  factory _$FlashcardSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardSetImplFromJson(json);

  @override
  final FlashCard flashCard;
  @override
  final String ownerId;

  @override
  String toString() {
    return 'FlashcardSet(flashCard: $flashCard, ownerId: $ownerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardSetImpl &&
            (identical(other.flashCard, flashCard) ||
                other.flashCard == flashCard) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flashCard, ownerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardSetImplCopyWith<_$FlashcardSetImpl> get copyWith =>
      __$$FlashcardSetImplCopyWithImpl<_$FlashcardSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardSetImplToJson(
      this,
    );
  }
}

abstract class _FlashcardSet implements FlashcardSet {
  const factory _FlashcardSet(
      {required final FlashCard flashCard,
      required final String ownerId}) = _$FlashcardSetImpl;

  factory _FlashcardSet.fromJson(Map<String, dynamic> json) =
      _$FlashcardSetImpl.fromJson;

  @override
  FlashCard get flashCard;
  @override
  String get ownerId;
  @override
  @JsonKey(ignore: true)
  _$$FlashcardSetImplCopyWith<_$FlashcardSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

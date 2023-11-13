// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flash_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashWord {
  TextFormField get wordField => throw _privateConstructorUsedError;
  TextFormField get definitionField => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlashWordCopyWith<FlashWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashWordCopyWith<$Res> {
  factory $FlashWordCopyWith(FlashWord value, $Res Function(FlashWord) then) =
      _$FlashWordCopyWithImpl<$Res, FlashWord>;
  @useResult
  $Res call({TextFormField wordField, TextFormField definitionField});
}

/// @nodoc
class _$FlashWordCopyWithImpl<$Res, $Val extends FlashWord>
    implements $FlashWordCopyWith<$Res> {
  _$FlashWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordField = null,
    Object? definitionField = null,
  }) {
    return _then(_value.copyWith(
      wordField: null == wordField
          ? _value.wordField
          : wordField // ignore: cast_nullable_to_non_nullable
              as TextFormField,
      definitionField: null == definitionField
          ? _value.definitionField
          : definitionField // ignore: cast_nullable_to_non_nullable
              as TextFormField,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashWordImplCopyWith<$Res>
    implements $FlashWordCopyWith<$Res> {
  factory _$$FlashWordImplCopyWith(
          _$FlashWordImpl value, $Res Function(_$FlashWordImpl) then) =
      __$$FlashWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TextFormField wordField, TextFormField definitionField});
}

/// @nodoc
class __$$FlashWordImplCopyWithImpl<$Res>
    extends _$FlashWordCopyWithImpl<$Res, _$FlashWordImpl>
    implements _$$FlashWordImplCopyWith<$Res> {
  __$$FlashWordImplCopyWithImpl(
      _$FlashWordImpl _value, $Res Function(_$FlashWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordField = null,
    Object? definitionField = null,
  }) {
    return _then(_$FlashWordImpl(
      wordField: null == wordField
          ? _value.wordField
          : wordField // ignore: cast_nullable_to_non_nullable
              as TextFormField,
      definitionField: null == definitionField
          ? _value.definitionField
          : definitionField // ignore: cast_nullable_to_non_nullable
              as TextFormField,
    ));
  }
}

/// @nodoc

class _$FlashWordImpl implements _FlashWord {
  const _$FlashWordImpl(
      {required this.wordField, required this.definitionField});

  @override
  final TextFormField wordField;
  @override
  final TextFormField definitionField;

  @override
  String toString() {
    return 'FlashWord(wordField: $wordField, definitionField: $definitionField)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashWordImpl &&
            (identical(other.wordField, wordField) ||
                other.wordField == wordField) &&
            (identical(other.definitionField, definitionField) ||
                other.definitionField == definitionField));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wordField, definitionField);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashWordImplCopyWith<_$FlashWordImpl> get copyWith =>
      __$$FlashWordImplCopyWithImpl<_$FlashWordImpl>(this, _$identity);
}

abstract class _FlashWord implements FlashWord {
  const factory _FlashWord(
      {required final TextFormField wordField,
      required final TextFormField definitionField}) = _$FlashWordImpl;

  @override
  TextFormField get wordField;
  @override
  TextFormField get definitionField;
  @override
  @JsonKey(ignore: true)
  _$$FlashWordImplCopyWith<_$FlashWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

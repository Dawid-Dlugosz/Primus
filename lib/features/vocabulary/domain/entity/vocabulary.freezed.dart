// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Vocabulary {
  List<Word> get know => throw _privateConstructorUsedError;
  List<Word> get unknow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VocabularyCopyWith<Vocabulary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyCopyWith<$Res> {
  factory $VocabularyCopyWith(
          Vocabulary value, $Res Function(Vocabulary) then) =
      _$VocabularyCopyWithImpl<$Res, Vocabulary>;
  @useResult
  $Res call({List<Word> know, List<Word> unknow});
}

/// @nodoc
class _$VocabularyCopyWithImpl<$Res, $Val extends Vocabulary>
    implements $VocabularyCopyWith<$Res> {
  _$VocabularyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? know = null,
    Object? unknow = null,
  }) {
    return _then(_value.copyWith(
      know: null == know
          ? _value.know
          : know // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      unknow: null == unknow
          ? _value.unknow
          : unknow // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyImplCopyWith<$Res>
    implements $VocabularyCopyWith<$Res> {
  factory _$$VocabularyImplCopyWith(
          _$VocabularyImpl value, $Res Function(_$VocabularyImpl) then) =
      __$$VocabularyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Word> know, List<Word> unknow});
}

/// @nodoc
class __$$VocabularyImplCopyWithImpl<$Res>
    extends _$VocabularyCopyWithImpl<$Res, _$VocabularyImpl>
    implements _$$VocabularyImplCopyWith<$Res> {
  __$$VocabularyImplCopyWithImpl(
      _$VocabularyImpl _value, $Res Function(_$VocabularyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? know = null,
    Object? unknow = null,
  }) {
    return _then(_$VocabularyImpl(
      know: null == know
          ? _value._know
          : know // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      unknow: null == unknow
          ? _value._unknow
          : unknow // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc

class _$VocabularyImpl implements _Vocabulary {
  _$VocabularyImpl(
      {required final List<Word> know, required final List<Word> unknow})
      : _know = know,
        _unknow = unknow;

  final List<Word> _know;
  @override
  List<Word> get know {
    if (_know is EqualUnmodifiableListView) return _know;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_know);
  }

  final List<Word> _unknow;
  @override
  List<Word> get unknow {
    if (_unknow is EqualUnmodifiableListView) return _unknow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unknow);
  }

  @override
  String toString() {
    return 'Vocabulary(know: $know, unknow: $unknow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyImpl &&
            const DeepCollectionEquality().equals(other._know, _know) &&
            const DeepCollectionEquality().equals(other._unknow, _unknow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_know),
      const DeepCollectionEquality().hash(_unknow));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyImplCopyWith<_$VocabularyImpl> get copyWith =>
      __$$VocabularyImplCopyWithImpl<_$VocabularyImpl>(this, _$identity);
}

abstract class _Vocabulary implements Vocabulary {
  factory _Vocabulary(
      {required final List<Word> know,
      required final List<Word> unknow}) = _$VocabularyImpl;

  @override
  List<Word> get know;
  @override
  List<Word> get unknow;
  @override
  @JsonKey(ignore: true)
  _$$VocabularyImplCopyWith<_$VocabularyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

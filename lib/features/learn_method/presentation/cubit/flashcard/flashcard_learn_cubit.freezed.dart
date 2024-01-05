// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_learn_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FlashcardLearnState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool learnAgain, String language,
            List<ToLearnWord> know, List<ToLearnWord> unknow, ToLearn toLearn)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool learnAgain, String language, List<ToLearnWord> know,
            List<ToLearnWord> unknow, ToLearn toLearn)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool learnAgain, String language, List<ToLearnWord> know,
            List<ToLearnWord> unknow, ToLearn toLearn)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardLearnStateCopyWith<$Res> {
  factory $FlashcardLearnStateCopyWith(
          FlashcardLearnState value, $Res Function(FlashcardLearnState) then) =
      _$FlashcardLearnStateCopyWithImpl<$Res, FlashcardLearnState>;
}

/// @nodoc
class _$FlashcardLearnStateCopyWithImpl<$Res, $Val extends FlashcardLearnState>
    implements $FlashcardLearnStateCopyWith<$Res> {
  _$FlashcardLearnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FlashcardLearnStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FlashcardLearnState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool learnAgain, String language,
            List<ToLearnWord> know, List<ToLearnWord> unknow, ToLearn toLearn)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool learnAgain, String language, List<ToLearnWord> know,
            List<ToLearnWord> unknow, ToLearn toLearn)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool learnAgain, String language, List<ToLearnWord> know,
            List<ToLearnWord> unknow, ToLearn toLearn)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FlashcardLearnState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool learnAgain,
      String language,
      List<ToLearnWord> know,
      List<ToLearnWord> unknow,
      ToLearn toLearn});

  $ToLearnCopyWith<$Res> get toLearn;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$FlashcardLearnStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learnAgain = null,
    Object? language = null,
    Object? know = null,
    Object? unknow = null,
    Object? toLearn = null,
  }) {
    return _then(_$LoadedImpl(
      learnAgain: null == learnAgain
          ? _value.learnAgain
          : learnAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      know: null == know
          ? _value._know
          : know // ignore: cast_nullable_to_non_nullable
              as List<ToLearnWord>,
      unknow: null == unknow
          ? _value._unknow
          : unknow // ignore: cast_nullable_to_non_nullable
              as List<ToLearnWord>,
      toLearn: null == toLearn
          ? _value.toLearn
          : toLearn // ignore: cast_nullable_to_non_nullable
              as ToLearn,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ToLearnCopyWith<$Res> get toLearn {
    return $ToLearnCopyWith<$Res>(_value.toLearn, (value) {
      return _then(_value.copyWith(toLearn: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required this.learnAgain,
      required this.language,
      required final List<ToLearnWord> know,
      required final List<ToLearnWord> unknow,
      required this.toLearn})
      : _know = know,
        _unknow = unknow;

  @override
  final bool learnAgain;
  @override
  final String language;
  final List<ToLearnWord> _know;
  @override
  List<ToLearnWord> get know {
    if (_know is EqualUnmodifiableListView) return _know;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_know);
  }

  final List<ToLearnWord> _unknow;
  @override
  List<ToLearnWord> get unknow {
    if (_unknow is EqualUnmodifiableListView) return _unknow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unknow);
  }

  @override
  final ToLearn toLearn;

  @override
  String toString() {
    return 'FlashcardLearnState.loaded(learnAgain: $learnAgain, language: $language, know: $know, unknow: $unknow, toLearn: $toLearn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.learnAgain, learnAgain) ||
                other.learnAgain == learnAgain) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._know, _know) &&
            const DeepCollectionEquality().equals(other._unknow, _unknow) &&
            (identical(other.toLearn, toLearn) || other.toLearn == toLearn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      learnAgain,
      language,
      const DeepCollectionEquality().hash(_know),
      const DeepCollectionEquality().hash(_unknow),
      toLearn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool learnAgain, String language,
            List<ToLearnWord> know, List<ToLearnWord> unknow, ToLearn toLearn)
        loaded,
  }) {
    return loaded(learnAgain, language, know, unknow, toLearn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool learnAgain, String language, List<ToLearnWord> know,
            List<ToLearnWord> unknow, ToLearn toLearn)?
        loaded,
  }) {
    return loaded?.call(learnAgain, language, know, unknow, toLearn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool learnAgain, String language, List<ToLearnWord> know,
            List<ToLearnWord> unknow, ToLearn toLearn)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(learnAgain, language, know, unknow, toLearn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements FlashcardLearnState {
  const factory _Loaded(
      {required final bool learnAgain,
      required final String language,
      required final List<ToLearnWord> know,
      required final List<ToLearnWord> unknow,
      required final ToLearn toLearn}) = _$LoadedImpl;

  bool get learnAgain;
  String get language;
  List<ToLearnWord> get know;
  List<ToLearnWord> get unknow;
  ToLearn get toLearn;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

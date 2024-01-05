// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spelling_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SpellingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SpellingWord> know,
            List<SpellingWord> unknow, bool wrongDefinition, ToLearn toLearn)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<SpellingWord> know, List<SpellingWord> unknow,
            bool wrongDefinition, ToLearn toLearn)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SpellingWord> know, List<SpellingWord> unknow,
            bool wrongDefinition, ToLearn toLearn)?
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
abstract class $SpellingStateCopyWith<$Res> {
  factory $SpellingStateCopyWith(
          SpellingState value, $Res Function(SpellingState) then) =
      _$SpellingStateCopyWithImpl<$Res, SpellingState>;
}

/// @nodoc
class _$SpellingStateCopyWithImpl<$Res, $Val extends SpellingState>
    implements $SpellingStateCopyWith<$Res> {
  _$SpellingStateCopyWithImpl(this._value, this._then);

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
    extends _$SpellingStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SpellingState.initial()';
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
    required TResult Function(List<SpellingWord> know,
            List<SpellingWord> unknow, bool wrongDefinition, ToLearn toLearn)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<SpellingWord> know, List<SpellingWord> unknow,
            bool wrongDefinition, ToLearn toLearn)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SpellingWord> know, List<SpellingWord> unknow,
            bool wrongDefinition, ToLearn toLearn)?
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

abstract class _Initial implements SpellingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<SpellingWord> know,
      List<SpellingWord> unknow,
      bool wrongDefinition,
      ToLearn toLearn});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SpellingStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? know = null,
    Object? unknow = null,
    Object? wrongDefinition = null,
    Object? toLearn = freezed,
  }) {
    return _then(_$LoadedImpl(
      know: null == know
          ? _value._know
          : know // ignore: cast_nullable_to_non_nullable
              as List<SpellingWord>,
      unknow: null == unknow
          ? _value._unknow
          : unknow // ignore: cast_nullable_to_non_nullable
              as List<SpellingWord>,
      wrongDefinition: null == wrongDefinition
          ? _value.wrongDefinition
          : wrongDefinition // ignore: cast_nullable_to_non_nullable
              as bool,
      toLearn: freezed == toLearn
          ? _value.toLearn
          : toLearn // ignore: cast_nullable_to_non_nullable
              as ToLearn,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<SpellingWord> know,
      required final List<SpellingWord> unknow,
      required this.wrongDefinition,
      required this.toLearn})
      : _know = know,
        _unknow = unknow;

  final List<SpellingWord> _know;
  @override
  List<SpellingWord> get know {
    if (_know is EqualUnmodifiableListView) return _know;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_know);
  }

  final List<SpellingWord> _unknow;
  @override
  List<SpellingWord> get unknow {
    if (_unknow is EqualUnmodifiableListView) return _unknow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unknow);
  }

  @override
  final bool wrongDefinition;
  @override
  final ToLearn toLearn;

  @override
  String toString() {
    return 'SpellingState.loaded(know: $know, unknow: $unknow, wrongDefinition: $wrongDefinition, toLearn: $toLearn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._know, _know) &&
            const DeepCollectionEquality().equals(other._unknow, _unknow) &&
            (identical(other.wrongDefinition, wrongDefinition) ||
                other.wrongDefinition == wrongDefinition) &&
            const DeepCollectionEquality().equals(other.toLearn, toLearn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_know),
      const DeepCollectionEquality().hash(_unknow),
      wrongDefinition,
      const DeepCollectionEquality().hash(toLearn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<SpellingWord> know,
            List<SpellingWord> unknow, bool wrongDefinition, ToLearn toLearn)
        loaded,
  }) {
    return loaded(know, unknow, wrongDefinition, toLearn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<SpellingWord> know, List<SpellingWord> unknow,
            bool wrongDefinition, ToLearn toLearn)?
        loaded,
  }) {
    return loaded?.call(know, unknow, wrongDefinition, toLearn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<SpellingWord> know, List<SpellingWord> unknow,
            bool wrongDefinition, ToLearn toLearn)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(know, unknow, wrongDefinition, toLearn);
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

abstract class _Loaded implements SpellingState {
  const factory _Loaded(
      {required final List<SpellingWord> know,
      required final List<SpellingWord> unknow,
      required final bool wrongDefinition,
      required final ToLearn toLearn}) = _$LoadedImpl;

  List<SpellingWord> get know;
  List<SpellingWord> get unknow;
  bool get wrongDefinition;
  ToLearn get toLearn;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

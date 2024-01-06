// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_choice_test_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleChoiceTestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)?
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
abstract class $SingleChoiceTestStateCopyWith<$Res> {
  factory $SingleChoiceTestStateCopyWith(SingleChoiceTestState value,
          $Res Function(SingleChoiceTestState) then) =
      _$SingleChoiceTestStateCopyWithImpl<$Res, SingleChoiceTestState>;
}

/// @nodoc
class _$SingleChoiceTestStateCopyWithImpl<$Res,
        $Val extends SingleChoiceTestState>
    implements $SingleChoiceTestStateCopyWith<$Res> {
  _$SingleChoiceTestStateCopyWithImpl(this._value, this._then);

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
    extends _$SingleChoiceTestStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SingleChoiceTestState.initial()';
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
    required TResult Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)?
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

abstract class _Initial implements SingleChoiceTestState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ToLearnWord> know,
      List<ToLearnWord> unknow,
      ToLearn toLearn,
      List<TestWord> testWords,
      bool showAgain});

  $ToLearnCopyWith<$Res> get toLearn;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SingleChoiceTestStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? know = null,
    Object? unknow = null,
    Object? toLearn = null,
    Object? testWords = null,
    Object? showAgain = null,
  }) {
    return _then(_$LoadedImpl(
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
      testWords: null == testWords
          ? _value._testWords
          : testWords // ignore: cast_nullable_to_non_nullable
              as List<TestWord>,
      showAgain: null == showAgain
          ? _value.showAgain
          : showAgain // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {required final List<ToLearnWord> know,
      required final List<ToLearnWord> unknow,
      required this.toLearn,
      required final List<TestWord> testWords,
      required this.showAgain})
      : _know = know,
        _unknow = unknow,
        _testWords = testWords;

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
  final List<TestWord> _testWords;
  @override
  List<TestWord> get testWords {
    if (_testWords is EqualUnmodifiableListView) return _testWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_testWords);
  }

  @override
  final bool showAgain;

  @override
  String toString() {
    return 'SingleChoiceTestState.loaded(know: $know, unknow: $unknow, toLearn: $toLearn, testWords: $testWords, showAgain: $showAgain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._know, _know) &&
            const DeepCollectionEquality().equals(other._unknow, _unknow) &&
            (identical(other.toLearn, toLearn) || other.toLearn == toLearn) &&
            const DeepCollectionEquality()
                .equals(other._testWords, _testWords) &&
            (identical(other.showAgain, showAgain) ||
                other.showAgain == showAgain));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_know),
      const DeepCollectionEquality().hash(_unknow),
      toLearn,
      const DeepCollectionEquality().hash(_testWords),
      showAgain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)
        loaded,
  }) {
    return loaded(know, unknow, toLearn, testWords, showAgain);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)?
        loaded,
  }) {
    return loaded?.call(know, unknow, toLearn, testWords, showAgain);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ToLearnWord> know, List<ToLearnWord> unknow,
            ToLearn toLearn, List<TestWord> testWords, bool showAgain)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(know, unknow, toLearn, testWords, showAgain);
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

abstract class _Loaded implements SingleChoiceTestState {
  const factory _Loaded(
      {required final List<ToLearnWord> know,
      required final List<ToLearnWord> unknow,
      required final ToLearn toLearn,
      required final List<TestWord> testWords,
      required final bool showAgain}) = _$LoadedImpl;

  List<ToLearnWord> get know;
  List<ToLearnWord> get unknow;
  ToLearn get toLearn;
  List<TestWord> get testWords;
  bool get showAgain;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

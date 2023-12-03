// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get nickname => throw _privateConstructorUsedError;
  List<String> get ownFlashcard => throw _privateConstructorUsedError;
  List<ToLearn> get toLearn => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String nickname,
      List<String> ownFlashcard,
      List<ToLearn> toLearn,
      String uid});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? ownFlashcard = null,
    Object? toLearn = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      ownFlashcard: null == ownFlashcard
          ? _value.ownFlashcard
          : ownFlashcard // ignore: cast_nullable_to_non_nullable
              as List<String>,
      toLearn: null == toLearn
          ? _value.toLearn
          : toLearn // ignore: cast_nullable_to_non_nullable
              as List<ToLearn>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      List<String> ownFlashcard,
      List<ToLearn> toLearn,
      String uid});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? ownFlashcard = null,
    Object? toLearn = null,
    Object? uid = null,
  }) {
    return _then(_$UserImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      ownFlashcard: null == ownFlashcard
          ? _value._ownFlashcard
          : ownFlashcard // ignore: cast_nullable_to_non_nullable
              as List<String>,
      toLearn: null == toLearn
          ? _value._toLearn
          : toLearn // ignore: cast_nullable_to_non_nullable
              as List<ToLearn>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.nickname,
      required final List<String> ownFlashcard,
      required final List<ToLearn> toLearn,
      required this.uid})
      : _ownFlashcard = ownFlashcard,
        _toLearn = toLearn;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String nickname;
  final List<String> _ownFlashcard;
  @override
  List<String> get ownFlashcard {
    if (_ownFlashcard is EqualUnmodifiableListView) return _ownFlashcard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ownFlashcard);
  }

  final List<ToLearn> _toLearn;
  @override
  List<ToLearn> get toLearn {
    if (_toLearn is EqualUnmodifiableListView) return _toLearn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toLearn);
  }

  @override
  final String uid;

  @override
  String toString() {
    return 'User(nickname: $nickname, ownFlashcard: $ownFlashcard, toLearn: $toLearn, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality()
                .equals(other._ownFlashcard, _ownFlashcard) &&
            const DeepCollectionEquality().equals(other._toLearn, _toLearn) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickname,
      const DeepCollectionEquality().hash(_ownFlashcard),
      const DeepCollectionEquality().hash(_toLearn),
      uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String nickname,
      required final List<String> ownFlashcard,
      required final List<ToLearn> toLearn,
      required final String uid}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get nickname;
  @override
  List<String> get ownFlashcard;
  @override
  List<ToLearn> get toLearn;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

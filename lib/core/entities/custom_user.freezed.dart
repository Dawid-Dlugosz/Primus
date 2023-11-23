// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) {
  return _CustomUser.fromJson(json);
}

/// @nodoc
mixin _$CustomUser {
  String get nickName => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  List<String>? get ownFlashcard => throw _privateConstructorUsedError;
  List<ToLearn>? get toLearn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomUserCopyWith<CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomUserCopyWith<$Res> {
  factory $CustomUserCopyWith(
          CustomUser value, $Res Function(CustomUser) then) =
      _$CustomUserCopyWithImpl<$Res, CustomUser>;
  @useResult
  $Res call(
      {String nickName,
      String uid,
      List<String>? ownFlashcard,
      List<ToLearn>? toLearn});
}

/// @nodoc
class _$CustomUserCopyWithImpl<$Res, $Val extends CustomUser>
    implements $CustomUserCopyWith<$Res> {
  _$CustomUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? uid = null,
    Object? ownFlashcard = freezed,
    Object? toLearn = freezed,
  }) {
    return _then(_value.copyWith(
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ownFlashcard: freezed == ownFlashcard
          ? _value.ownFlashcard
          : ownFlashcard // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      toLearn: freezed == toLearn
          ? _value.toLearn
          : toLearn // ignore: cast_nullable_to_non_nullable
              as List<ToLearn>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomUserImplCopyWith<$Res>
    implements $CustomUserCopyWith<$Res> {
  factory _$$CustomUserImplCopyWith(
          _$CustomUserImpl value, $Res Function(_$CustomUserImpl) then) =
      __$$CustomUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickName,
      String uid,
      List<String>? ownFlashcard,
      List<ToLearn>? toLearn});
}

/// @nodoc
class __$$CustomUserImplCopyWithImpl<$Res>
    extends _$CustomUserCopyWithImpl<$Res, _$CustomUserImpl>
    implements _$$CustomUserImplCopyWith<$Res> {
  __$$CustomUserImplCopyWithImpl(
      _$CustomUserImpl _value, $Res Function(_$CustomUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? uid = null,
    Object? ownFlashcard = freezed,
    Object? toLearn = freezed,
  }) {
    return _then(_$CustomUserImpl(
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ownFlashcard: freezed == ownFlashcard
          ? _value._ownFlashcard
          : ownFlashcard // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      toLearn: freezed == toLearn
          ? _value._toLearn
          : toLearn // ignore: cast_nullable_to_non_nullable
              as List<ToLearn>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomUserImpl implements _CustomUser {
  const _$CustomUserImpl(
      {required this.nickName,
      required this.uid,
      required final List<String>? ownFlashcard,
      required final List<ToLearn>? toLearn})
      : _ownFlashcard = ownFlashcard,
        _toLearn = toLearn;

  factory _$CustomUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomUserImplFromJson(json);

  @override
  final String nickName;
  @override
  final String uid;
  final List<String>? _ownFlashcard;
  @override
  List<String>? get ownFlashcard {
    final value = _ownFlashcard;
    if (value == null) return null;
    if (_ownFlashcard is EqualUnmodifiableListView) return _ownFlashcard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ToLearn>? _toLearn;
  @override
  List<ToLearn>? get toLearn {
    final value = _toLearn;
    if (value == null) return null;
    if (_toLearn is EqualUnmodifiableListView) return _toLearn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomUser(nickName: $nickName, uid: $uid, ownFlashcard: $ownFlashcard, toLearn: $toLearn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomUserImpl &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other._ownFlashcard, _ownFlashcard) &&
            const DeepCollectionEquality().equals(other._toLearn, _toLearn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nickName,
      uid,
      const DeepCollectionEquality().hash(_ownFlashcard),
      const DeepCollectionEquality().hash(_toLearn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomUserImplCopyWith<_$CustomUserImpl> get copyWith =>
      __$$CustomUserImplCopyWithImpl<_$CustomUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomUserImplToJson(
      this,
    );
  }
}

abstract class _CustomUser implements CustomUser {
  const factory _CustomUser(
      {required final String nickName,
      required final String uid,
      required final List<String>? ownFlashcard,
      required final List<ToLearn>? toLearn}) = _$CustomUserImpl;

  factory _CustomUser.fromJson(Map<String, dynamic> json) =
      _$CustomUserImpl.fromJson;

  @override
  String get nickName;
  @override
  String get uid;
  @override
  List<String>? get ownFlashcard;
  @override
  List<ToLearn>? get toLearn;
  @override
  @JsonKey(ignore: true)
  _$$CustomUserImplCopyWith<_$CustomUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

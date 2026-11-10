// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecurityState {

 PageState get sessionsStatus; List<DeviceSession> get sessions; bool get isChangingPassword;/// The session being signed out, or [allOthers].
 String? get revokingId; int get revokedCount; PageCommand? get pageCommand;
/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityStateCopyWith<SecurityState> get copyWith => _$SecurityStateCopyWithImpl<SecurityState>(this as SecurityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityState&&(identical(other.sessionsStatus, sessionsStatus) || other.sessionsStatus == sessionsStatus)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.isChangingPassword, isChangingPassword) || other.isChangingPassword == isChangingPassword)&&(identical(other.revokingId, revokingId) || other.revokingId == revokingId)&&(identical(other.revokedCount, revokedCount) || other.revokedCount == revokedCount)&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,sessionsStatus,const DeepCollectionEquality().hash(sessions),isChangingPassword,revokingId,revokedCount,pageCommand);

@override
String toString() {
  return 'SecurityState(sessionsStatus: $sessionsStatus, sessions: $sessions, isChangingPassword: $isChangingPassword, revokingId: $revokingId, revokedCount: $revokedCount, pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class $SecurityStateCopyWith<$Res>  {
  factory $SecurityStateCopyWith(SecurityState value, $Res Function(SecurityState) _then) = _$SecurityStateCopyWithImpl;
@useResult
$Res call({
 PageState sessionsStatus, List<DeviceSession> sessions, bool isChangingPassword, String? revokingId, int revokedCount, PageCommand? pageCommand
});




}
/// @nodoc
class _$SecurityStateCopyWithImpl<$Res>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._self, this._then);

  final SecurityState _self;
  final $Res Function(SecurityState) _then;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionsStatus = null,Object? sessions = null,Object? isChangingPassword = null,Object? revokingId = freezed,Object? revokedCount = null,Object? pageCommand = freezed,}) {
  return _then(_self.copyWith(
sessionsStatus: null == sessionsStatus ? _self.sessionsStatus : sessionsStatus // ignore: cast_nullable_to_non_nullable
as PageState,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<DeviceSession>,isChangingPassword: null == isChangingPassword ? _self.isChangingPassword : isChangingPassword // ignore: cast_nullable_to_non_nullable
as bool,revokingId: freezed == revokingId ? _self.revokingId : revokingId // ignore: cast_nullable_to_non_nullable
as String?,revokedCount: null == revokedCount ? _self.revokedCount : revokedCount // ignore: cast_nullable_to_non_nullable
as int,pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityState].
extension SecurityStatePatterns on SecurityState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityState value)  $default,){
final _that = this;
switch (_that) {
case _SecurityState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityState value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState sessionsStatus,  List<DeviceSession> sessions,  bool isChangingPassword,  String? revokingId,  int revokedCount,  PageCommand? pageCommand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that.sessionsStatus,_that.sessions,_that.isChangingPassword,_that.revokingId,_that.revokedCount,_that.pageCommand);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState sessionsStatus,  List<DeviceSession> sessions,  bool isChangingPassword,  String? revokingId,  int revokedCount,  PageCommand? pageCommand)  $default,) {final _that = this;
switch (_that) {
case _SecurityState():
return $default(_that.sessionsStatus,_that.sessions,_that.isChangingPassword,_that.revokingId,_that.revokedCount,_that.pageCommand);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState sessionsStatus,  List<DeviceSession> sessions,  bool isChangingPassword,  String? revokingId,  int revokedCount,  PageCommand? pageCommand)?  $default,) {final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that.sessionsStatus,_that.sessions,_that.isChangingPassword,_that.revokingId,_that.revokedCount,_that.pageCommand);case _:
  return null;

}
}

}

/// @nodoc


class _SecurityState implements SecurityState {
  const _SecurityState({this.sessionsStatus = PageState.init, final  List<DeviceSession> sessions = const <DeviceSession>[], this.isChangingPassword = false, this.revokingId, this.revokedCount = 0, this.pageCommand}): _sessions = sessions;
  

@override@JsonKey() final  PageState sessionsStatus;
 final  List<DeviceSession> _sessions;
@override@JsonKey() List<DeviceSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override@JsonKey() final  bool isChangingPassword;
/// The session being signed out, or [allOthers].
@override final  String? revokingId;
@override@JsonKey() final  int revokedCount;
@override final  PageCommand? pageCommand;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityStateCopyWith<_SecurityState> get copyWith => __$SecurityStateCopyWithImpl<_SecurityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityState&&(identical(other.sessionsStatus, sessionsStatus) || other.sessionsStatus == sessionsStatus)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.isChangingPassword, isChangingPassword) || other.isChangingPassword == isChangingPassword)&&(identical(other.revokingId, revokingId) || other.revokingId == revokingId)&&(identical(other.revokedCount, revokedCount) || other.revokedCount == revokedCount)&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,sessionsStatus,const DeepCollectionEquality().hash(_sessions),isChangingPassword,revokingId,revokedCount,pageCommand);

@override
String toString() {
  return 'SecurityState(sessionsStatus: $sessionsStatus, sessions: $sessions, isChangingPassword: $isChangingPassword, revokingId: $revokingId, revokedCount: $revokedCount, pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class _$SecurityStateCopyWith<$Res> implements $SecurityStateCopyWith<$Res> {
  factory _$SecurityStateCopyWith(_SecurityState value, $Res Function(_SecurityState) _then) = __$SecurityStateCopyWithImpl;
@override @useResult
$Res call({
 PageState sessionsStatus, List<DeviceSession> sessions, bool isChangingPassword, String? revokingId, int revokedCount, PageCommand? pageCommand
});




}
/// @nodoc
class __$SecurityStateCopyWithImpl<$Res>
    implements _$SecurityStateCopyWith<$Res> {
  __$SecurityStateCopyWithImpl(this._self, this._then);

  final _SecurityState _self;
  final $Res Function(_SecurityState) _then;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionsStatus = null,Object? sessions = null,Object? isChangingPassword = null,Object? revokingId = freezed,Object? revokedCount = null,Object? pageCommand = freezed,}) {
  return _then(_SecurityState(
sessionsStatus: null == sessionsStatus ? _self.sessionsStatus : sessionsStatus // ignore: cast_nullable_to_non_nullable
as PageState,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<DeviceSession>,isChangingPassword: null == isChangingPassword ? _self.isChangingPassword : isChangingPassword // ignore: cast_nullable_to_non_nullable
as bool,revokingId: freezed == revokingId ? _self.revokingId : revokingId // ignore: cast_nullable_to_non_nullable
as String?,revokedCount: null == revokedCount ? _self.revokedCount : revokedCount // ignore: cast_nullable_to_non_nullable
as int,pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,
  ));
}


}

// dart format on

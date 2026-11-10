// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OnInit value)?  onInit,TResult Function( _OnChangeDarkMode value)?  onChangeDarkMode,TResult Function( _OnChangeLanguage value)?  onChangeLanguage,TResult Function( _OnLogout value)?  onLogout,TResult Function( _OnUpdateName value)?  onUpdateName,TResult Function( _OnChangeAvatar value)?  onChangeAvatar,TResult Function( _OnRemoveAvatar value)?  onRemoveAvatar,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnInit() when onInit != null:
return onInit(_that);case _OnChangeDarkMode() when onChangeDarkMode != null:
return onChangeDarkMode(_that);case _OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that);case _OnLogout() when onLogout != null:
return onLogout(_that);case _OnUpdateName() when onUpdateName != null:
return onUpdateName(_that);case _OnChangeAvatar() when onChangeAvatar != null:
return onChangeAvatar(_that);case _OnRemoveAvatar() when onRemoveAvatar != null:
return onRemoveAvatar(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OnInit value)  onInit,required TResult Function( _OnChangeDarkMode value)  onChangeDarkMode,required TResult Function( _OnChangeLanguage value)  onChangeLanguage,required TResult Function( _OnLogout value)  onLogout,required TResult Function( _OnUpdateName value)  onUpdateName,required TResult Function( _OnChangeAvatar value)  onChangeAvatar,required TResult Function( _OnRemoveAvatar value)  onRemoveAvatar,}){
final _that = this;
switch (_that) {
case _OnInit():
return onInit(_that);case _OnChangeDarkMode():
return onChangeDarkMode(_that);case _OnChangeLanguage():
return onChangeLanguage(_that);case _OnLogout():
return onLogout(_that);case _OnUpdateName():
return onUpdateName(_that);case _OnChangeAvatar():
return onChangeAvatar(_that);case _OnRemoveAvatar():
return onRemoveAvatar(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OnInit value)?  onInit,TResult? Function( _OnChangeDarkMode value)?  onChangeDarkMode,TResult? Function( _OnChangeLanguage value)?  onChangeLanguage,TResult? Function( _OnLogout value)?  onLogout,TResult? Function( _OnUpdateName value)?  onUpdateName,TResult? Function( _OnChangeAvatar value)?  onChangeAvatar,TResult? Function( _OnRemoveAvatar value)?  onRemoveAvatar,}){
final _that = this;
switch (_that) {
case _OnInit() when onInit != null:
return onInit(_that);case _OnChangeDarkMode() when onChangeDarkMode != null:
return onChangeDarkMode(_that);case _OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that);case _OnLogout() when onLogout != null:
return onLogout(_that);case _OnUpdateName() when onUpdateName != null:
return onUpdateName(_that);case _OnChangeAvatar() when onChangeAvatar != null:
return onChangeAvatar(_that);case _OnRemoveAvatar() when onRemoveAvatar != null:
return onRemoveAvatar(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInit,TResult Function()?  onChangeDarkMode,TResult Function( Language language)?  onChangeLanguage,TResult Function()?  onLogout,TResult Function( String displayName)?  onUpdateName,TResult Function( File image)?  onChangeAvatar,TResult Function()?  onRemoveAvatar,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnInit() when onInit != null:
return onInit();case _OnChangeDarkMode() when onChangeDarkMode != null:
return onChangeDarkMode();case _OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that.language);case _OnLogout() when onLogout != null:
return onLogout();case _OnUpdateName() when onUpdateName != null:
return onUpdateName(_that.displayName);case _OnChangeAvatar() when onChangeAvatar != null:
return onChangeAvatar(_that.image);case _OnRemoveAvatar() when onRemoveAvatar != null:
return onRemoveAvatar();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInit,required TResult Function()  onChangeDarkMode,required TResult Function( Language language)  onChangeLanguage,required TResult Function()  onLogout,required TResult Function( String displayName)  onUpdateName,required TResult Function( File image)  onChangeAvatar,required TResult Function()  onRemoveAvatar,}) {final _that = this;
switch (_that) {
case _OnInit():
return onInit();case _OnChangeDarkMode():
return onChangeDarkMode();case _OnChangeLanguage():
return onChangeLanguage(_that.language);case _OnLogout():
return onLogout();case _OnUpdateName():
return onUpdateName(_that.displayName);case _OnChangeAvatar():
return onChangeAvatar(_that.image);case _OnRemoveAvatar():
return onRemoveAvatar();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInit,TResult? Function()?  onChangeDarkMode,TResult? Function( Language language)?  onChangeLanguage,TResult? Function()?  onLogout,TResult? Function( String displayName)?  onUpdateName,TResult? Function( File image)?  onChangeAvatar,TResult? Function()?  onRemoveAvatar,}) {final _that = this;
switch (_that) {
case _OnInit() when onInit != null:
return onInit();case _OnChangeDarkMode() when onChangeDarkMode != null:
return onChangeDarkMode();case _OnChangeLanguage() when onChangeLanguage != null:
return onChangeLanguage(_that.language);case _OnLogout() when onLogout != null:
return onLogout();case _OnUpdateName() when onUpdateName != null:
return onUpdateName(_that.displayName);case _OnChangeAvatar() when onChangeAvatar != null:
return onChangeAvatar(_that.image);case _OnRemoveAvatar() when onRemoveAvatar != null:
return onRemoveAvatar();case _:
  return null;

}
}

}

/// @nodoc


class _OnInit implements ProfileEvent {
  const _OnInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onInit()';
}


}




/// @nodoc


class _OnChangeDarkMode implements ProfileEvent {
  const _OnChangeDarkMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangeDarkMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onChangeDarkMode()';
}


}




/// @nodoc


class _OnChangeLanguage implements ProfileEvent {
  const _OnChangeLanguage(this.language);
  

 final  Language language;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnChangeLanguageCopyWith<_OnChangeLanguage> get copyWith => __$OnChangeLanguageCopyWithImpl<_OnChangeLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangeLanguage&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'ProfileEvent.onChangeLanguage(language: $language)';
}


}

/// @nodoc
abstract mixin class _$OnChangeLanguageCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$OnChangeLanguageCopyWith(_OnChangeLanguage value, $Res Function(_OnChangeLanguage) _then) = __$OnChangeLanguageCopyWithImpl;
@useResult
$Res call({
 Language language
});




}
/// @nodoc
class __$OnChangeLanguageCopyWithImpl<$Res>
    implements _$OnChangeLanguageCopyWith<$Res> {
  __$OnChangeLanguageCopyWithImpl(this._self, this._then);

  final _OnChangeLanguage _self;
  final $Res Function(_OnChangeLanguage) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(_OnChangeLanguage(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,
  ));
}


}

/// @nodoc


class _OnLogout implements ProfileEvent {
  const _OnLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onLogout()';
}


}




/// @nodoc


class _OnUpdateName implements ProfileEvent {
  const _OnUpdateName(this.displayName);
  

 final  String displayName;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnUpdateNameCopyWith<_OnUpdateName> get copyWith => __$OnUpdateNameCopyWithImpl<_OnUpdateName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnUpdateName&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,displayName);

@override
String toString() {
  return 'ProfileEvent.onUpdateName(displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$OnUpdateNameCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$OnUpdateNameCopyWith(_OnUpdateName value, $Res Function(_OnUpdateName) _then) = __$OnUpdateNameCopyWithImpl;
@useResult
$Res call({
 String displayName
});




}
/// @nodoc
class __$OnUpdateNameCopyWithImpl<$Res>
    implements _$OnUpdateNameCopyWith<$Res> {
  __$OnUpdateNameCopyWithImpl(this._self, this._then);

  final _OnUpdateName _self;
  final $Res Function(_OnUpdateName) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? displayName = null,}) {
  return _then(_OnUpdateName(
null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnChangeAvatar implements ProfileEvent {
  const _OnChangeAvatar(this.image);
  

 final  File image;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnChangeAvatarCopyWith<_OnChangeAvatar> get copyWith => __$OnChangeAvatarCopyWithImpl<_OnChangeAvatar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangeAvatar&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,image);

@override
String toString() {
  return 'ProfileEvent.onChangeAvatar(image: $image)';
}


}

/// @nodoc
abstract mixin class _$OnChangeAvatarCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$OnChangeAvatarCopyWith(_OnChangeAvatar value, $Res Function(_OnChangeAvatar) _then) = __$OnChangeAvatarCopyWithImpl;
@useResult
$Res call({
 File image
});




}
/// @nodoc
class __$OnChangeAvatarCopyWithImpl<$Res>
    implements _$OnChangeAvatarCopyWith<$Res> {
  __$OnChangeAvatarCopyWithImpl(this._self, this._then);

  final _OnChangeAvatar _self;
  final $Res Function(_OnChangeAvatar) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,}) {
  return _then(_OnChangeAvatar(
null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class _OnRemoveAvatar implements ProfileEvent {
  const _OnRemoveAvatar();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnRemoveAvatar);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.onRemoveAvatar()';
}


}




/// @nodoc
mixin _$ProfileState {

 bool get isDarkMode; String? get languageName; UserModel? get user; PageCommand? get pageCommand;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.languageName, languageName) || other.languageName == languageName)&&(identical(other.user, user) || other.user == user)&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,isDarkMode,languageName,user,pageCommand);

@override
String toString() {
  return 'ProfileState(isDarkMode: $isDarkMode, languageName: $languageName, user: $user, pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 bool isDarkMode, String? languageName, UserModel? user, PageCommand? pageCommand
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDarkMode = null,Object? languageName = freezed,Object? user = freezed,Object? pageCommand = freezed,}) {
  return _then(_self.copyWith(
isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,languageName: freezed == languageName ? _self.languageName : languageName // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDarkMode,  String? languageName,  UserModel? user,  PageCommand? pageCommand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.isDarkMode,_that.languageName,_that.user,_that.pageCommand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDarkMode,  String? languageName,  UserModel? user,  PageCommand? pageCommand)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.isDarkMode,_that.languageName,_that.user,_that.pageCommand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDarkMode,  String? languageName,  UserModel? user,  PageCommand? pageCommand)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.isDarkMode,_that.languageName,_that.user,_that.pageCommand);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.isDarkMode = false, this.languageName, this.user, this.pageCommand});
  

@override@JsonKey() final  bool isDarkMode;
@override final  String? languageName;
@override final  UserModel? user;
@override final  PageCommand? pageCommand;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.languageName, languageName) || other.languageName == languageName)&&(identical(other.user, user) || other.user == user)&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,isDarkMode,languageName,user,pageCommand);

@override
String toString() {
  return 'ProfileState(isDarkMode: $isDarkMode, languageName: $languageName, user: $user, pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 bool isDarkMode, String? languageName, UserModel? user, PageCommand? pageCommand
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDarkMode = null,Object? languageName = freezed,Object? user = freezed,Object? pageCommand = freezed,}) {
  return _then(_ProfileState(
isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,languageName: freezed == languageName ? _self.languageName : languageName // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on

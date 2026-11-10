// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String get email; String get handle; String get displayName; String get locale; bool get emailConfirmed; List<String> get roles; ImageUrls? get avatar;/// Not returned by the API yet.
 DateTime? get createdAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.emailConfirmed, emailConfirmed) || other.emailConfirmed == emailConfirmed)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,handle,displayName,locale,emailConfirmed,const DeepCollectionEquality().hash(roles),avatar,createdAt);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, handle: $handle, displayName: $displayName, locale: $locale, emailConfirmed: $emailConfirmed, roles: $roles, avatar: $avatar, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String handle, String displayName, String locale, bool emailConfirmed, List<String> roles, ImageUrls? avatar, DateTime? createdAt
});


$ImageUrlsCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? handle = null,Object? displayName = null,Object? locale = null,Object? emailConfirmed = null,Object? roles = null,Object? avatar = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,emailConfirmed: null == emailConfirmed ? _self.emailConfirmed : emailConfirmed // ignore: cast_nullable_to_non_nullable
as bool,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ImageUrls?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageUrlsCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ImageUrlsCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String handle,  String displayName,  String locale,  bool emailConfirmed,  List<String> roles,  ImageUrls? avatar,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.handle,_that.displayName,_that.locale,_that.emailConfirmed,_that.roles,_that.avatar,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String handle,  String displayName,  String locale,  bool emailConfirmed,  List<String> roles,  ImageUrls? avatar,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.email,_that.handle,_that.displayName,_that.locale,_that.emailConfirmed,_that.roles,_that.avatar,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String handle,  String displayName,  String locale,  bool emailConfirmed,  List<String> roles,  ImageUrls? avatar,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.email,_that.handle,_that.displayName,_that.locale,_that.emailConfirmed,_that.roles,_that.avatar,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.email, required this.handle, required this.displayName, this.locale = 'vi', this.emailConfirmed = false, final  List<String> roles = const <String>[], this.avatar, this.createdAt}): _roles = roles,super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String handle;
@override final  String displayName;
@override@JsonKey() final  String locale;
@override@JsonKey() final  bool emailConfirmed;
 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  ImageUrls? avatar;
/// Not returned by the API yet.
@override final  DateTime? createdAt;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.emailConfirmed, emailConfirmed) || other.emailConfirmed == emailConfirmed)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,handle,displayName,locale,emailConfirmed,const DeepCollectionEquality().hash(_roles),avatar,createdAt);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, handle: $handle, displayName: $displayName, locale: $locale, emailConfirmed: $emailConfirmed, roles: $roles, avatar: $avatar, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String handle, String displayName, String locale, bool emailConfirmed, List<String> roles, ImageUrls? avatar, DateTime? createdAt
});


@override $ImageUrlsCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? handle = null,Object? displayName = null,Object? locale = null,Object? emailConfirmed = null,Object? roles = null,Object? avatar = freezed,Object? createdAt = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,emailConfirmed: null == emailConfirmed ? _self.emailConfirmed : emailConfirmed // ignore: cast_nullable_to_non_nullable
as bool,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ImageUrls?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageUrlsCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ImageUrlsCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// @nodoc
mixin _$ImageUrls {

 String get small; String get large;
/// Create a copy of ImageUrls
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageUrlsCopyWith<ImageUrls> get copyWith => _$ImageUrlsCopyWithImpl<ImageUrls>(this as ImageUrls, _$identity);

  /// Serializes this ImageUrls to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageUrls&&(identical(other.small, small) || other.small == small)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,small,large);

@override
String toString() {
  return 'ImageUrls(small: $small, large: $large)';
}


}

/// @nodoc
abstract mixin class $ImageUrlsCopyWith<$Res>  {
  factory $ImageUrlsCopyWith(ImageUrls value, $Res Function(ImageUrls) _then) = _$ImageUrlsCopyWithImpl;
@useResult
$Res call({
 String small, String large
});




}
/// @nodoc
class _$ImageUrlsCopyWithImpl<$Res>
    implements $ImageUrlsCopyWith<$Res> {
  _$ImageUrlsCopyWithImpl(this._self, this._then);

  final ImageUrls _self;
  final $Res Function(ImageUrls) _then;

/// Create a copy of ImageUrls
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? small = null,Object? large = null,}) {
  return _then(_self.copyWith(
small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageUrls].
extension ImageUrlsPatterns on ImageUrls {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageUrls value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageUrls() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageUrls value)  $default,){
final _that = this;
switch (_that) {
case _ImageUrls():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageUrls value)?  $default,){
final _that = this;
switch (_that) {
case _ImageUrls() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String small,  String large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageUrls() when $default != null:
return $default(_that.small,_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String small,  String large)  $default,) {final _that = this;
switch (_that) {
case _ImageUrls():
return $default(_that.small,_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String small,  String large)?  $default,) {final _that = this;
switch (_that) {
case _ImageUrls() when $default != null:
return $default(_that.small,_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageUrls implements ImageUrls {
  const _ImageUrls({required this.small, required this.large});
  factory _ImageUrls.fromJson(Map<String, dynamic> json) => _$ImageUrlsFromJson(json);

@override final  String small;
@override final  String large;

/// Create a copy of ImageUrls
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUrlsCopyWith<_ImageUrls> get copyWith => __$ImageUrlsCopyWithImpl<_ImageUrls>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageUrlsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageUrls&&(identical(other.small, small) || other.small == small)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,small,large);

@override
String toString() {
  return 'ImageUrls(small: $small, large: $large)';
}


}

/// @nodoc
abstract mixin class _$ImageUrlsCopyWith<$Res> implements $ImageUrlsCopyWith<$Res> {
  factory _$ImageUrlsCopyWith(_ImageUrls value, $Res Function(_ImageUrls) _then) = __$ImageUrlsCopyWithImpl;
@override @useResult
$Res call({
 String small, String large
});




}
/// @nodoc
class __$ImageUrlsCopyWithImpl<$Res>
    implements _$ImageUrlsCopyWith<$Res> {
  __$ImageUrlsCopyWithImpl(this._self, this._then);

  final _ImageUrls _self;
  final $Res Function(_ImageUrls) _then;

/// Create a copy of ImageUrls
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? small = null,Object? large = null,}) {
  return _then(_ImageUrls(
small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

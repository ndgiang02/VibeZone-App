// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupEvent()';
}


}

/// @nodoc
class $SignupEventCopyWith<$Res>  {
$SignupEventCopyWith(SignupEvent _, $Res Function(SignupEvent) __);
}


/// Adds pattern-matching-related methods to [SignupEvent].
extension SignupEventPatterns on SignupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OnChangeName value)?  onChangeName,TResult Function( _OnChangeEmail value)?  onChangeEmail,TResult Function( _OnChangePassword value)?  onChangePassword,TResult Function( _OnChangeConfirmPassword value)?  onChangeConfirmPassword,TResult Function( _OnToggleAgree value)?  onToggleAgree,TResult Function( _OnSubmit value)?  onSubmit,TResult Function( _OnClearPage value)?  onClearPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnChangeName() when onChangeName != null:
return onChangeName(_that);case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that);case _OnChangePassword() when onChangePassword != null:
return onChangePassword(_that);case _OnChangeConfirmPassword() when onChangeConfirmPassword != null:
return onChangeConfirmPassword(_that);case _OnToggleAgree() when onToggleAgree != null:
return onToggleAgree(_that);case _OnSubmit() when onSubmit != null:
return onSubmit(_that);case _OnClearPage() when onClearPage != null:
return onClearPage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OnChangeName value)  onChangeName,required TResult Function( _OnChangeEmail value)  onChangeEmail,required TResult Function( _OnChangePassword value)  onChangePassword,required TResult Function( _OnChangeConfirmPassword value)  onChangeConfirmPassword,required TResult Function( _OnToggleAgree value)  onToggleAgree,required TResult Function( _OnSubmit value)  onSubmit,required TResult Function( _OnClearPage value)  onClearPage,}){
final _that = this;
switch (_that) {
case _OnChangeName():
return onChangeName(_that);case _OnChangeEmail():
return onChangeEmail(_that);case _OnChangePassword():
return onChangePassword(_that);case _OnChangeConfirmPassword():
return onChangeConfirmPassword(_that);case _OnToggleAgree():
return onToggleAgree(_that);case _OnSubmit():
return onSubmit(_that);case _OnClearPage():
return onClearPage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OnChangeName value)?  onChangeName,TResult? Function( _OnChangeEmail value)?  onChangeEmail,TResult? Function( _OnChangePassword value)?  onChangePassword,TResult? Function( _OnChangeConfirmPassword value)?  onChangeConfirmPassword,TResult? Function( _OnToggleAgree value)?  onToggleAgree,TResult? Function( _OnSubmit value)?  onSubmit,TResult? Function( _OnClearPage value)?  onClearPage,}){
final _that = this;
switch (_that) {
case _OnChangeName() when onChangeName != null:
return onChangeName(_that);case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that);case _OnChangePassword() when onChangePassword != null:
return onChangePassword(_that);case _OnChangeConfirmPassword() when onChangeConfirmPassword != null:
return onChangeConfirmPassword(_that);case _OnToggleAgree() when onToggleAgree != null:
return onToggleAgree(_that);case _OnSubmit() when onSubmit != null:
return onSubmit(_that);case _OnClearPage() when onClearPage != null:
return onClearPage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  onChangeName,TResult Function( String value)?  onChangeEmail,TResult Function( String value)?  onChangePassword,TResult Function( String value)?  onChangeConfirmPassword,TResult Function( bool value)?  onToggleAgree,TResult Function( BuildContext ctx)?  onSubmit,TResult Function()?  onClearPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnChangeName() when onChangeName != null:
return onChangeName(_that.value);case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that.value);case _OnChangePassword() when onChangePassword != null:
return onChangePassword(_that.value);case _OnChangeConfirmPassword() when onChangeConfirmPassword != null:
return onChangeConfirmPassword(_that.value);case _OnToggleAgree() when onToggleAgree != null:
return onToggleAgree(_that.value);case _OnSubmit() when onSubmit != null:
return onSubmit(_that.ctx);case _OnClearPage() when onClearPage != null:
return onClearPage();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  onChangeName,required TResult Function( String value)  onChangeEmail,required TResult Function( String value)  onChangePassword,required TResult Function( String value)  onChangeConfirmPassword,required TResult Function( bool value)  onToggleAgree,required TResult Function( BuildContext ctx)  onSubmit,required TResult Function()  onClearPage,}) {final _that = this;
switch (_that) {
case _OnChangeName():
return onChangeName(_that.value);case _OnChangeEmail():
return onChangeEmail(_that.value);case _OnChangePassword():
return onChangePassword(_that.value);case _OnChangeConfirmPassword():
return onChangeConfirmPassword(_that.value);case _OnToggleAgree():
return onToggleAgree(_that.value);case _OnSubmit():
return onSubmit(_that.ctx);case _OnClearPage():
return onClearPage();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  onChangeName,TResult? Function( String value)?  onChangeEmail,TResult? Function( String value)?  onChangePassword,TResult? Function( String value)?  onChangeConfirmPassword,TResult? Function( bool value)?  onToggleAgree,TResult? Function( BuildContext ctx)?  onSubmit,TResult? Function()?  onClearPage,}) {final _that = this;
switch (_that) {
case _OnChangeName() when onChangeName != null:
return onChangeName(_that.value);case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that.value);case _OnChangePassword() when onChangePassword != null:
return onChangePassword(_that.value);case _OnChangeConfirmPassword() when onChangeConfirmPassword != null:
return onChangeConfirmPassword(_that.value);case _OnToggleAgree() when onToggleAgree != null:
return onToggleAgree(_that.value);case _OnSubmit() when onSubmit != null:
return onSubmit(_that.ctx);case _OnClearPage() when onClearPage != null:
return onClearPage();case _:
  return null;

}
}

}

/// @nodoc


class _OnChangeName implements SignupEvent {
  const _OnChangeName(this.value);
  

 final  String value;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnChangeNameCopyWith<_OnChangeName> get copyWith => __$OnChangeNameCopyWithImpl<_OnChangeName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangeName&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SignupEvent.onChangeName(value: $value)';
}


}

/// @nodoc
abstract mixin class _$OnChangeNameCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$OnChangeNameCopyWith(_OnChangeName value, $Res Function(_OnChangeName) _then) = __$OnChangeNameCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$OnChangeNameCopyWithImpl<$Res>
    implements _$OnChangeNameCopyWith<$Res> {
  __$OnChangeNameCopyWithImpl(this._self, this._then);

  final _OnChangeName _self;
  final $Res Function(_OnChangeName) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_OnChangeName(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnChangeEmail implements SignupEvent {
  const _OnChangeEmail(this.value);
  

 final  String value;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnChangeEmailCopyWith<_OnChangeEmail> get copyWith => __$OnChangeEmailCopyWithImpl<_OnChangeEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangeEmail&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SignupEvent.onChangeEmail(value: $value)';
}


}

/// @nodoc
abstract mixin class _$OnChangeEmailCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$OnChangeEmailCopyWith(_OnChangeEmail value, $Res Function(_OnChangeEmail) _then) = __$OnChangeEmailCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$OnChangeEmailCopyWithImpl<$Res>
    implements _$OnChangeEmailCopyWith<$Res> {
  __$OnChangeEmailCopyWithImpl(this._self, this._then);

  final _OnChangeEmail _self;
  final $Res Function(_OnChangeEmail) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_OnChangeEmail(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnChangePassword implements SignupEvent {
  const _OnChangePassword(this.value);
  

 final  String value;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnChangePasswordCopyWith<_OnChangePassword> get copyWith => __$OnChangePasswordCopyWithImpl<_OnChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangePassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SignupEvent.onChangePassword(value: $value)';
}


}

/// @nodoc
abstract mixin class _$OnChangePasswordCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$OnChangePasswordCopyWith(_OnChangePassword value, $Res Function(_OnChangePassword) _then) = __$OnChangePasswordCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$OnChangePasswordCopyWithImpl<$Res>
    implements _$OnChangePasswordCopyWith<$Res> {
  __$OnChangePasswordCopyWithImpl(this._self, this._then);

  final _OnChangePassword _self;
  final $Res Function(_OnChangePassword) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_OnChangePassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnChangeConfirmPassword implements SignupEvent {
  const _OnChangeConfirmPassword(this.value);
  

 final  String value;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnChangeConfirmPasswordCopyWith<_OnChangeConfirmPassword> get copyWith => __$OnChangeConfirmPasswordCopyWithImpl<_OnChangeConfirmPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnChangeConfirmPassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SignupEvent.onChangeConfirmPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class _$OnChangeConfirmPasswordCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$OnChangeConfirmPasswordCopyWith(_OnChangeConfirmPassword value, $Res Function(_OnChangeConfirmPassword) _then) = __$OnChangeConfirmPasswordCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$OnChangeConfirmPasswordCopyWithImpl<$Res>
    implements _$OnChangeConfirmPasswordCopyWith<$Res> {
  __$OnChangeConfirmPasswordCopyWithImpl(this._self, this._then);

  final _OnChangeConfirmPassword _self;
  final $Res Function(_OnChangeConfirmPassword) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_OnChangeConfirmPassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnToggleAgree implements SignupEvent {
  const _OnToggleAgree(this.value);
  

 final  bool value;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnToggleAgreeCopyWith<_OnToggleAgree> get copyWith => __$OnToggleAgreeCopyWithImpl<_OnToggleAgree>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnToggleAgree&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SignupEvent.onToggleAgree(value: $value)';
}


}

/// @nodoc
abstract mixin class _$OnToggleAgreeCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$OnToggleAgreeCopyWith(_OnToggleAgree value, $Res Function(_OnToggleAgree) _then) = __$OnToggleAgreeCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class __$OnToggleAgreeCopyWithImpl<$Res>
    implements _$OnToggleAgreeCopyWith<$Res> {
  __$OnToggleAgreeCopyWithImpl(this._self, this._then);

  final _OnToggleAgree _self;
  final $Res Function(_OnToggleAgree) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_OnToggleAgree(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _OnSubmit implements SignupEvent {
  const _OnSubmit(this.ctx);
  

 final  BuildContext ctx;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnSubmitCopyWith<_OnSubmit> get copyWith => __$OnSubmitCopyWithImpl<_OnSubmit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnSubmit&&(identical(other.ctx, ctx) || other.ctx == ctx));
}


@override
int get hashCode => Object.hash(runtimeType,ctx);

@override
String toString() {
  return 'SignupEvent.onSubmit(ctx: $ctx)';
}


}

/// @nodoc
abstract mixin class _$OnSubmitCopyWith<$Res> implements $SignupEventCopyWith<$Res> {
  factory _$OnSubmitCopyWith(_OnSubmit value, $Res Function(_OnSubmit) _then) = __$OnSubmitCopyWithImpl;
@useResult
$Res call({
 BuildContext ctx
});




}
/// @nodoc
class __$OnSubmitCopyWithImpl<$Res>
    implements _$OnSubmitCopyWith<$Res> {
  __$OnSubmitCopyWithImpl(this._self, this._then);

  final _OnSubmit _self;
  final $Res Function(_OnSubmit) _then;

/// Create a copy of SignupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ctx = null,}) {
  return _then(_OnSubmit(
null == ctx ? _self.ctx : ctx // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class _OnClearPage implements SignupEvent {
  const _OnClearPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnClearPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupEvent.onClearPage()';
}


}




/// @nodoc
mixin _$SignupState {

 PageCommand? get pageCommand; PageState get status; String get name; String get email; String get password; String get confirmPassword; bool get isAgree; String? get errName; String? get errEmail; String? get errPassword; String? get errConfirmPassword;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isAgree, isAgree) || other.isAgree == isAgree)&&(identical(other.errName, errName) || other.errName == errName)&&(identical(other.errEmail, errEmail) || other.errEmail == errEmail)&&(identical(other.errPassword, errPassword) || other.errPassword == errPassword)&&(identical(other.errConfirmPassword, errConfirmPassword) || other.errConfirmPassword == errConfirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand,status,name,email,password,confirmPassword,isAgree,errName,errEmail,errPassword,errConfirmPassword);

@override
String toString() {
  return 'SignupState(pageCommand: $pageCommand, status: $status, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, isAgree: $isAgree, errName: $errName, errEmail: $errEmail, errPassword: $errPassword, errConfirmPassword: $errConfirmPassword)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 PageCommand? pageCommand, PageState status, String name, String email, String password, String confirmPassword, bool isAgree, String? errName, String? errEmail, String? errPassword, String? errConfirmPassword
});




}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageCommand = freezed,Object? status = null,Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isAgree = null,Object? errName = freezed,Object? errEmail = freezed,Object? errPassword = freezed,Object? errConfirmPassword = freezed,}) {
  return _then(_self.copyWith(
pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isAgree: null == isAgree ? _self.isAgree : isAgree // ignore: cast_nullable_to_non_nullable
as bool,errName: freezed == errName ? _self.errName : errName // ignore: cast_nullable_to_non_nullable
as String?,errEmail: freezed == errEmail ? _self.errEmail : errEmail // ignore: cast_nullable_to_non_nullable
as String?,errPassword: freezed == errPassword ? _self.errPassword : errPassword // ignore: cast_nullable_to_non_nullable
as String?,errConfirmPassword: freezed == errConfirmPassword ? _self.errConfirmPassword : errConfirmPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupState value)  $default,){
final _that = this;
switch (_that) {
case _SignupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageCommand? pageCommand,  PageState status,  String name,  String email,  String password,  String confirmPassword,  bool isAgree,  String? errName,  String? errEmail,  String? errPassword,  String? errConfirmPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.pageCommand,_that.status,_that.name,_that.email,_that.password,_that.confirmPassword,_that.isAgree,_that.errName,_that.errEmail,_that.errPassword,_that.errConfirmPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageCommand? pageCommand,  PageState status,  String name,  String email,  String password,  String confirmPassword,  bool isAgree,  String? errName,  String? errEmail,  String? errPassword,  String? errConfirmPassword)  $default,) {final _that = this;
switch (_that) {
case _SignupState():
return $default(_that.pageCommand,_that.status,_that.name,_that.email,_that.password,_that.confirmPassword,_that.isAgree,_that.errName,_that.errEmail,_that.errPassword,_that.errConfirmPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageCommand? pageCommand,  PageState status,  String name,  String email,  String password,  String confirmPassword,  bool isAgree,  String? errName,  String? errEmail,  String? errPassword,  String? errConfirmPassword)?  $default,) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.pageCommand,_that.status,_that.name,_that.email,_that.password,_that.confirmPassword,_that.isAgree,_that.errName,_that.errEmail,_that.errPassword,_that.errConfirmPassword);case _:
  return null;

}
}

}

/// @nodoc


class _SignupState extends SignupState {
  const _SignupState({this.pageCommand, this.status = PageState.init, this.name = '', this.email = '', this.password = '', this.confirmPassword = '', this.isAgree = false, this.errName, this.errEmail, this.errPassword, this.errConfirmPassword}): super._();
  

@override final  PageCommand? pageCommand;
@override@JsonKey() final  PageState status;
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String confirmPassword;
@override@JsonKey() final  bool isAgree;
@override final  String? errName;
@override final  String? errEmail;
@override final  String? errPassword;
@override final  String? errConfirmPassword;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isAgree, isAgree) || other.isAgree == isAgree)&&(identical(other.errName, errName) || other.errName == errName)&&(identical(other.errEmail, errEmail) || other.errEmail == errEmail)&&(identical(other.errPassword, errPassword) || other.errPassword == errPassword)&&(identical(other.errConfirmPassword, errConfirmPassword) || other.errConfirmPassword == errConfirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand,status,name,email,password,confirmPassword,isAgree,errName,errEmail,errPassword,errConfirmPassword);

@override
String toString() {
  return 'SignupState(pageCommand: $pageCommand, status: $status, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, isAgree: $isAgree, errName: $errName, errEmail: $errEmail, errPassword: $errPassword, errConfirmPassword: $errConfirmPassword)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 PageCommand? pageCommand, PageState status, String name, String email, String password, String confirmPassword, bool isAgree, String? errName, String? errEmail, String? errPassword, String? errConfirmPassword
});




}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageCommand = freezed,Object? status = null,Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isAgree = null,Object? errName = freezed,Object? errEmail = freezed,Object? errPassword = freezed,Object? errConfirmPassword = freezed,}) {
  return _then(_SignupState(
pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isAgree: null == isAgree ? _self.isAgree : isAgree // ignore: cast_nullable_to_non_nullable
as bool,errName: freezed == errName ? _self.errName : errName // ignore: cast_nullable_to_non_nullable
as String?,errEmail: freezed == errEmail ? _self.errEmail : errEmail // ignore: cast_nullable_to_non_nullable
as String?,errPassword: freezed == errPassword ? _self.errPassword : errPassword // ignore: cast_nullable_to_non_nullable
as String?,errConfirmPassword: freezed == errConfirmPassword ? _self.errConfirmPassword : errConfirmPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

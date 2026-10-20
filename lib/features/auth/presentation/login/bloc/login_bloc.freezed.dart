// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnInitData value)?  onInitData,TResult Function( OnChangePassword value)?  onChangePassword,TResult Function( OnChangeEmail value)?  onChangeEmail,TResult Function( OnSelectedRemember value)?  onSelectedRemember,TResult Function( OnNavigate value)?  onNavigate,TResult Function( OnLogin value)?  onLogin,TResult Function( OnSignInGoogle value)?  onSignInGoogle,TResult Function( OnSignInFacebook value)?  onSignInFacebook,TResult Function( OnSignInApple value)?  onSignInApple,TResult Function( OnForgotPassword value)?  onForgotPassword,TResult Function( OnClearPage value)?  onClearPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnInitData() when onInitData != null:
return onInitData(_that);case OnChangePassword() when onChangePassword != null:
return onChangePassword(_that);case OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that);case OnSelectedRemember() when onSelectedRemember != null:
return onSelectedRemember(_that);case OnNavigate() when onNavigate != null:
return onNavigate(_that);case OnLogin() when onLogin != null:
return onLogin(_that);case OnSignInGoogle() when onSignInGoogle != null:
return onSignInGoogle(_that);case OnSignInFacebook() when onSignInFacebook != null:
return onSignInFacebook(_that);case OnSignInApple() when onSignInApple != null:
return onSignInApple(_that);case OnForgotPassword() when onForgotPassword != null:
return onForgotPassword(_that);case OnClearPage() when onClearPage != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnInitData value)  onInitData,required TResult Function( OnChangePassword value)  onChangePassword,required TResult Function( OnChangeEmail value)  onChangeEmail,required TResult Function( OnSelectedRemember value)  onSelectedRemember,required TResult Function( OnNavigate value)  onNavigate,required TResult Function( OnLogin value)  onLogin,required TResult Function( OnSignInGoogle value)  onSignInGoogle,required TResult Function( OnSignInFacebook value)  onSignInFacebook,required TResult Function( OnSignInApple value)  onSignInApple,required TResult Function( OnForgotPassword value)  onForgotPassword,required TResult Function( OnClearPage value)  onClearPage,}){
final _that = this;
switch (_that) {
case OnInitData():
return onInitData(_that);case OnChangePassword():
return onChangePassword(_that);case OnChangeEmail():
return onChangeEmail(_that);case OnSelectedRemember():
return onSelectedRemember(_that);case OnNavigate():
return onNavigate(_that);case OnLogin():
return onLogin(_that);case OnSignInGoogle():
return onSignInGoogle(_that);case OnSignInFacebook():
return onSignInFacebook(_that);case OnSignInApple():
return onSignInApple(_that);case OnForgotPassword():
return onForgotPassword(_that);case OnClearPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnInitData value)?  onInitData,TResult? Function( OnChangePassword value)?  onChangePassword,TResult? Function( OnChangeEmail value)?  onChangeEmail,TResult? Function( OnSelectedRemember value)?  onSelectedRemember,TResult? Function( OnNavigate value)?  onNavigate,TResult? Function( OnLogin value)?  onLogin,TResult? Function( OnSignInGoogle value)?  onSignInGoogle,TResult? Function( OnSignInFacebook value)?  onSignInFacebook,TResult? Function( OnSignInApple value)?  onSignInApple,TResult? Function( OnForgotPassword value)?  onForgotPassword,TResult? Function( OnClearPage value)?  onClearPage,}){
final _that = this;
switch (_that) {
case OnInitData() when onInitData != null:
return onInitData(_that);case OnChangePassword() when onChangePassword != null:
return onChangePassword(_that);case OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that);case OnSelectedRemember() when onSelectedRemember != null:
return onSelectedRemember(_that);case OnNavigate() when onNavigate != null:
return onNavigate(_that);case OnLogin() when onLogin != null:
return onLogin(_that);case OnSignInGoogle() when onSignInGoogle != null:
return onSignInGoogle(_that);case OnSignInFacebook() when onSignInFacebook != null:
return onSignInFacebook(_that);case OnSignInApple() when onSignInApple != null:
return onSignInApple(_that);case OnForgotPassword() when onForgotPassword != null:
return onForgotPassword(_that);case OnClearPage() when onClearPage != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitData,TResult Function( String value)?  onChangePassword,TResult Function( String value)?  onChangeEmail,TResult Function( bool value)?  onSelectedRemember,TResult Function( PageCommand pageCommand)?  onNavigate,TResult Function( BuildContext ctx)?  onLogin,TResult Function()?  onSignInGoogle,TResult Function()?  onSignInFacebook,TResult Function()?  onSignInApple,TResult Function()?  onForgotPassword,TResult Function()?  onClearPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnInitData() when onInitData != null:
return onInitData();case OnChangePassword() when onChangePassword != null:
return onChangePassword(_that.value);case OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that.value);case OnSelectedRemember() when onSelectedRemember != null:
return onSelectedRemember(_that.value);case OnNavigate() when onNavigate != null:
return onNavigate(_that.pageCommand);case OnLogin() when onLogin != null:
return onLogin(_that.ctx);case OnSignInGoogle() when onSignInGoogle != null:
return onSignInGoogle();case OnSignInFacebook() when onSignInFacebook != null:
return onSignInFacebook();case OnSignInApple() when onSignInApple != null:
return onSignInApple();case OnForgotPassword() when onForgotPassword != null:
return onForgotPassword();case OnClearPage() when onClearPage != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitData,required TResult Function( String value)  onChangePassword,required TResult Function( String value)  onChangeEmail,required TResult Function( bool value)  onSelectedRemember,required TResult Function( PageCommand pageCommand)  onNavigate,required TResult Function( BuildContext ctx)  onLogin,required TResult Function()  onSignInGoogle,required TResult Function()  onSignInFacebook,required TResult Function()  onSignInApple,required TResult Function()  onForgotPassword,required TResult Function()  onClearPage,}) {final _that = this;
switch (_that) {
case OnInitData():
return onInitData();case OnChangePassword():
return onChangePassword(_that.value);case OnChangeEmail():
return onChangeEmail(_that.value);case OnSelectedRemember():
return onSelectedRemember(_that.value);case OnNavigate():
return onNavigate(_that.pageCommand);case OnLogin():
return onLogin(_that.ctx);case OnSignInGoogle():
return onSignInGoogle();case OnSignInFacebook():
return onSignInFacebook();case OnSignInApple():
return onSignInApple();case OnForgotPassword():
return onForgotPassword();case OnClearPage():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitData,TResult? Function( String value)?  onChangePassword,TResult? Function( String value)?  onChangeEmail,TResult? Function( bool value)?  onSelectedRemember,TResult? Function( PageCommand pageCommand)?  onNavigate,TResult? Function( BuildContext ctx)?  onLogin,TResult? Function()?  onSignInGoogle,TResult? Function()?  onSignInFacebook,TResult? Function()?  onSignInApple,TResult? Function()?  onForgotPassword,TResult? Function()?  onClearPage,}) {final _that = this;
switch (_that) {
case OnInitData() when onInitData != null:
return onInitData();case OnChangePassword() when onChangePassword != null:
return onChangePassword(_that.value);case OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that.value);case OnSelectedRemember() when onSelectedRemember != null:
return onSelectedRemember(_that.value);case OnNavigate() when onNavigate != null:
return onNavigate(_that.pageCommand);case OnLogin() when onLogin != null:
return onLogin(_that.ctx);case OnSignInGoogle() when onSignInGoogle != null:
return onSignInGoogle();case OnSignInFacebook() when onSignInFacebook != null:
return onSignInFacebook();case OnSignInApple() when onSignInApple != null:
return onSignInApple();case OnForgotPassword() when onForgotPassword != null:
return onForgotPassword();case OnClearPage() when onClearPage != null:
return onClearPage();case _:
  return null;

}
}

}

/// @nodoc


class OnInitData implements LoginEvent {
  const OnInitData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnInitData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onInitData()';
}


}




/// @nodoc


class OnChangePassword implements LoginEvent {
  const OnChangePassword(this.value);
  

 final  String value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangePasswordCopyWith<OnChangePassword> get copyWith => _$OnChangePasswordCopyWithImpl<OnChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangePassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.onChangePassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnChangePasswordCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $OnChangePasswordCopyWith(OnChangePassword value, $Res Function(OnChangePassword) _then) = _$OnChangePasswordCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnChangePasswordCopyWithImpl<$Res>
    implements $OnChangePasswordCopyWith<$Res> {
  _$OnChangePasswordCopyWithImpl(this._self, this._then);

  final OnChangePassword _self;
  final $Res Function(OnChangePassword) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnChangePassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnChangeEmail implements LoginEvent {
  const OnChangeEmail(this.value);
  

 final  String value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeEmailCopyWith<OnChangeEmail> get copyWith => _$OnChangeEmailCopyWithImpl<OnChangeEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeEmail&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.onChangeEmail(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnChangeEmailCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $OnChangeEmailCopyWith(OnChangeEmail value, $Res Function(OnChangeEmail) _then) = _$OnChangeEmailCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnChangeEmailCopyWithImpl<$Res>
    implements $OnChangeEmailCopyWith<$Res> {
  _$OnChangeEmailCopyWithImpl(this._self, this._then);

  final OnChangeEmail _self;
  final $Res Function(OnChangeEmail) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnChangeEmail(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnSelectedRemember implements LoginEvent {
  const OnSelectedRemember(this.value);
  

 final  bool value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSelectedRememberCopyWith<OnSelectedRemember> get copyWith => _$OnSelectedRememberCopyWithImpl<OnSelectedRemember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSelectedRemember&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.onSelectedRemember(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnSelectedRememberCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $OnSelectedRememberCopyWith(OnSelectedRemember value, $Res Function(OnSelectedRemember) _then) = _$OnSelectedRememberCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$OnSelectedRememberCopyWithImpl<$Res>
    implements $OnSelectedRememberCopyWith<$Res> {
  _$OnSelectedRememberCopyWithImpl(this._self, this._then);

  final OnSelectedRemember _self;
  final $Res Function(OnSelectedRemember) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnSelectedRemember(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OnNavigate implements LoginEvent {
  const OnNavigate(this.pageCommand);
  

 final  PageCommand pageCommand;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnNavigateCopyWith<OnNavigate> get copyWith => _$OnNavigateCopyWithImpl<OnNavigate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnNavigate&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand);

@override
String toString() {
  return 'LoginEvent.onNavigate(pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class $OnNavigateCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $OnNavigateCopyWith(OnNavigate value, $Res Function(OnNavigate) _then) = _$OnNavigateCopyWithImpl;
@useResult
$Res call({
 PageCommand pageCommand
});




}
/// @nodoc
class _$OnNavigateCopyWithImpl<$Res>
    implements $OnNavigateCopyWith<$Res> {
  _$OnNavigateCopyWithImpl(this._self, this._then);

  final OnNavigate _self;
  final $Res Function(OnNavigate) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pageCommand = null,}) {
  return _then(OnNavigate(
null == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand,
  ));
}


}

/// @nodoc


class OnLogin implements LoginEvent {
  const OnLogin(this.ctx);
  

 final  BuildContext ctx;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoginCopyWith<OnLogin> get copyWith => _$OnLoginCopyWithImpl<OnLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLogin&&(identical(other.ctx, ctx) || other.ctx == ctx));
}


@override
int get hashCode => Object.hash(runtimeType,ctx);

@override
String toString() {
  return 'LoginEvent.onLogin(ctx: $ctx)';
}


}

/// @nodoc
abstract mixin class $OnLoginCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $OnLoginCopyWith(OnLogin value, $Res Function(OnLogin) _then) = _$OnLoginCopyWithImpl;
@useResult
$Res call({
 BuildContext ctx
});




}
/// @nodoc
class _$OnLoginCopyWithImpl<$Res>
    implements $OnLoginCopyWith<$Res> {
  _$OnLoginCopyWithImpl(this._self, this._then);

  final OnLogin _self;
  final $Res Function(OnLogin) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ctx = null,}) {
  return _then(OnLogin(
null == ctx ? _self.ctx : ctx // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class OnSignInGoogle implements LoginEvent {
  const OnSignInGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSignInGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onSignInGoogle()';
}


}




/// @nodoc


class OnSignInFacebook implements LoginEvent {
  const OnSignInFacebook();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSignInFacebook);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onSignInFacebook()';
}


}




/// @nodoc


class OnSignInApple implements LoginEvent {
  const OnSignInApple();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSignInApple);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onSignInApple()';
}


}




/// @nodoc


class OnForgotPassword implements LoginEvent {
  const OnForgotPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnForgotPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onForgotPassword()';
}


}




/// @nodoc


class OnClearPage implements LoginEvent {
  const OnClearPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnClearPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.onClearPage()';
}


}




/// @nodoc
mixin _$LoginState {

 PageCommand? get pageCommand; PageState get status; bool get isRememberMe; bool get isEnable; String? get email; String? get password; String? get errEmail; String? get errPassword;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand)&&(identical(other.status, status) || other.status == status)&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe)&&(identical(other.isEnable, isEnable) || other.isEnable == isEnable)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.errEmail, errEmail) || other.errEmail == errEmail)&&(identical(other.errPassword, errPassword) || other.errPassword == errPassword));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand,status,isRememberMe,isEnable,email,password,errEmail,errPassword);

@override
String toString() {
  return 'LoginState(pageCommand: $pageCommand, status: $status, isRememberMe: $isRememberMe, isEnable: $isEnable, email: $email, password: $password, errEmail: $errEmail, errPassword: $errPassword)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 PageCommand? pageCommand, PageState status, bool isRememberMe, bool isEnable, String? email, String? password, String? errEmail, String? errPassword
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageCommand = freezed,Object? status = null,Object? isRememberMe = null,Object? isEnable = null,Object? email = freezed,Object? password = freezed,Object? errEmail = freezed,Object? errPassword = freezed,}) {
  return _then(_self.copyWith(
pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,isEnable: null == isEnable ? _self.isEnable : isEnable // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,errEmail: freezed == errEmail ? _self.errEmail : errEmail // ignore: cast_nullable_to_non_nullable
as String?,errPassword: freezed == errPassword ? _self.errPassword : errPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageCommand? pageCommand,  PageState status,  bool isRememberMe,  bool isEnable,  String? email,  String? password,  String? errEmail,  String? errPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.pageCommand,_that.status,_that.isRememberMe,_that.isEnable,_that.email,_that.password,_that.errEmail,_that.errPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageCommand? pageCommand,  PageState status,  bool isRememberMe,  bool isEnable,  String? email,  String? password,  String? errEmail,  String? errPassword)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.pageCommand,_that.status,_that.isRememberMe,_that.isEnable,_that.email,_that.password,_that.errEmail,_that.errPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageCommand? pageCommand,  PageState status,  bool isRememberMe,  bool isEnable,  String? email,  String? password,  String? errEmail,  String? errPassword)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.pageCommand,_that.status,_that.isRememberMe,_that.isEnable,_that.email,_that.password,_that.errEmail,_that.errPassword);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState extends LoginState {
  const _LoginState({this.pageCommand, this.status = PageState.init, this.isRememberMe = false, this.isEnable = false, this.email, this.password, this.errEmail, this.errPassword}): super._();
  

@override final  PageCommand? pageCommand;
@override@JsonKey() final  PageState status;
@override@JsonKey() final  bool isRememberMe;
@override@JsonKey() final  bool isEnable;
@override final  String? email;
@override final  String? password;
@override final  String? errEmail;
@override final  String? errPassword;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand)&&(identical(other.status, status) || other.status == status)&&(identical(other.isRememberMe, isRememberMe) || other.isRememberMe == isRememberMe)&&(identical(other.isEnable, isEnable) || other.isEnable == isEnable)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.errEmail, errEmail) || other.errEmail == errEmail)&&(identical(other.errPassword, errPassword) || other.errPassword == errPassword));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand,status,isRememberMe,isEnable,email,password,errEmail,errPassword);

@override
String toString() {
  return 'LoginState(pageCommand: $pageCommand, status: $status, isRememberMe: $isRememberMe, isEnable: $isEnable, email: $email, password: $password, errEmail: $errEmail, errPassword: $errPassword)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 PageCommand? pageCommand, PageState status, bool isRememberMe, bool isEnable, String? email, String? password, String? errEmail, String? errPassword
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageCommand = freezed,Object? status = null,Object? isRememberMe = null,Object? isEnable = null,Object? email = freezed,Object? password = freezed,Object? errEmail = freezed,Object? errPassword = freezed,}) {
  return _then(_LoginState(
pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,isRememberMe: null == isRememberMe ? _self.isRememberMe : isRememberMe // ignore: cast_nullable_to_non_nullable
as bool,isEnable: null == isEnable ? _self.isEnable : isEnable // ignore: cast_nullable_to_non_nullable
as bool,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,errEmail: freezed == errEmail ? _self.errEmail : errEmail // ignore: cast_nullable_to_non_nullable
as String?,errPassword: freezed == errPassword ? _self.errPassword : errPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

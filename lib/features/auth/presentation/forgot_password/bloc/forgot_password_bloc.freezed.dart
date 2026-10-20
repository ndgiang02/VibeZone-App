// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent()';
}


}

/// @nodoc
class $ForgotPasswordEventCopyWith<$Res>  {
$ForgotPasswordEventCopyWith(ForgotPasswordEvent _, $Res Function(ForgotPasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordEvent].
extension ForgotPasswordEventPatterns on ForgotPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OnChangeEmail value)?  onChangeEmail,TResult Function( _OnSubmit value)?  onSubmit,TResult Function( _OnResend value)?  onResend,TResult Function( _OnClearPage value)?  onClearPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that);case _OnSubmit() when onSubmit != null:
return onSubmit(_that);case _OnResend() when onResend != null:
return onResend(_that);case _OnClearPage() when onClearPage != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OnChangeEmail value)  onChangeEmail,required TResult Function( _OnSubmit value)  onSubmit,required TResult Function( _OnResend value)  onResend,required TResult Function( _OnClearPage value)  onClearPage,}){
final _that = this;
switch (_that) {
case _OnChangeEmail():
return onChangeEmail(_that);case _OnSubmit():
return onSubmit(_that);case _OnResend():
return onResend(_that);case _OnClearPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OnChangeEmail value)?  onChangeEmail,TResult? Function( _OnSubmit value)?  onSubmit,TResult? Function( _OnResend value)?  onResend,TResult? Function( _OnClearPage value)?  onClearPage,}){
final _that = this;
switch (_that) {
case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that);case _OnSubmit() when onSubmit != null:
return onSubmit(_that);case _OnResend() when onResend != null:
return onResend(_that);case _OnClearPage() when onClearPage != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  onChangeEmail,TResult Function( BuildContext ctx)?  onSubmit,TResult Function()?  onResend,TResult Function()?  onClearPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that.value);case _OnSubmit() when onSubmit != null:
return onSubmit(_that.ctx);case _OnResend() when onResend != null:
return onResend();case _OnClearPage() when onClearPage != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  onChangeEmail,required TResult Function( BuildContext ctx)  onSubmit,required TResult Function()  onResend,required TResult Function()  onClearPage,}) {final _that = this;
switch (_that) {
case _OnChangeEmail():
return onChangeEmail(_that.value);case _OnSubmit():
return onSubmit(_that.ctx);case _OnResend():
return onResend();case _OnClearPage():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  onChangeEmail,TResult? Function( BuildContext ctx)?  onSubmit,TResult? Function()?  onResend,TResult? Function()?  onClearPage,}) {final _that = this;
switch (_that) {
case _OnChangeEmail() when onChangeEmail != null:
return onChangeEmail(_that.value);case _OnSubmit() when onSubmit != null:
return onSubmit(_that.ctx);case _OnResend() when onResend != null:
return onResend();case _OnClearPage() when onClearPage != null:
return onClearPage();case _:
  return null;

}
}

}

/// @nodoc


class _OnChangeEmail implements ForgotPasswordEvent {
  const _OnChangeEmail(this.value);
  

 final  String value;

/// Create a copy of ForgotPasswordEvent
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
  return 'ForgotPasswordEvent.onChangeEmail(value: $value)';
}


}

/// @nodoc
abstract mixin class _$OnChangeEmailCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
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

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_OnChangeEmail(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnSubmit implements ForgotPasswordEvent {
  const _OnSubmit(this.ctx);
  

 final  BuildContext ctx;

/// Create a copy of ForgotPasswordEvent
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
  return 'ForgotPasswordEvent.onSubmit(ctx: $ctx)';
}


}

/// @nodoc
abstract mixin class _$OnSubmitCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
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

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ctx = null,}) {
  return _then(_OnSubmit(
null == ctx ? _self.ctx : ctx // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class _OnResend implements ForgotPasswordEvent {
  const _OnResend();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnResend);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent.onResend()';
}


}




/// @nodoc


class _OnClearPage implements ForgotPasswordEvent {
  const _OnClearPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnClearPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordEvent.onClearPage()';
}


}




/// @nodoc
mixin _$ForgotPasswordState {

 PageCommand? get pageCommand; PageState get status; String get email; bool get isSent; String? get errEmail;
/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith => _$ForgotPasswordStateCopyWithImpl<ForgotPasswordState>(this as ForgotPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand)&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.isSent, isSent) || other.isSent == isSent)&&(identical(other.errEmail, errEmail) || other.errEmail == errEmail));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand,status,email,isSent,errEmail);

@override
String toString() {
  return 'ForgotPasswordState(pageCommand: $pageCommand, status: $status, email: $email, isSent: $isSent, errEmail: $errEmail)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordStateCopyWith<$Res>  {
  factory $ForgotPasswordStateCopyWith(ForgotPasswordState value, $Res Function(ForgotPasswordState) _then) = _$ForgotPasswordStateCopyWithImpl;
@useResult
$Res call({
 PageCommand? pageCommand, PageState status, String email, bool isSent, String? errEmail
});




}
/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordState _self;
  final $Res Function(ForgotPasswordState) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageCommand = freezed,Object? status = null,Object? email = null,Object? isSent = null,Object? errEmail = freezed,}) {
  return _then(_self.copyWith(
pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isSent: null == isSent ? _self.isSent : isSent // ignore: cast_nullable_to_non_nullable
as bool,errEmail: freezed == errEmail ? _self.errEmail : errEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageCommand? pageCommand,  PageState status,  String email,  bool isSent,  String? errEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that.pageCommand,_that.status,_that.email,_that.isSent,_that.errEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageCommand? pageCommand,  PageState status,  String email,  bool isSent,  String? errEmail)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordState():
return $default(_that.pageCommand,_that.status,_that.email,_that.isSent,_that.errEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageCommand? pageCommand,  PageState status,  String email,  bool isSent,  String? errEmail)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that.pageCommand,_that.status,_that.email,_that.isSent,_that.errEmail);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordState extends ForgotPasswordState {
  const _ForgotPasswordState({this.pageCommand, this.status = PageState.init, this.email = '', this.isSent = false, this.errEmail}): super._();
  

@override final  PageCommand? pageCommand;
@override@JsonKey() final  PageState status;
@override@JsonKey() final  String email;
@override@JsonKey() final  bool isSent;
@override final  String? errEmail;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordStateCopyWith<_ForgotPasswordState> get copyWith => __$ForgotPasswordStateCopyWithImpl<_ForgotPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordState&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand)&&(identical(other.status, status) || other.status == status)&&(identical(other.email, email) || other.email == email)&&(identical(other.isSent, isSent) || other.isSent == isSent)&&(identical(other.errEmail, errEmail) || other.errEmail == errEmail));
}


@override
int get hashCode => Object.hash(runtimeType,pageCommand,status,email,isSent,errEmail);

@override
String toString() {
  return 'ForgotPasswordState(pageCommand: $pageCommand, status: $status, email: $email, isSent: $isSent, errEmail: $errEmail)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordStateCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$ForgotPasswordStateCopyWith(_ForgotPasswordState value, $Res Function(_ForgotPasswordState) _then) = __$ForgotPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 PageCommand? pageCommand, PageState status, String email, bool isSent, String? errEmail
});




}
/// @nodoc
class __$ForgotPasswordStateCopyWithImpl<$Res>
    implements _$ForgotPasswordStateCopyWith<$Res> {
  __$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordState _self;
  final $Res Function(_ForgotPasswordState) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageCommand = freezed,Object? status = null,Object? email = null,Object? isSent = null,Object? errEmail = freezed,}) {
  return _then(_ForgotPasswordState(
pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isSent: null == isSent ? _self.isSent : isSent // ignore: cast_nullable_to_non_nullable
as bool,errEmail: freezed == errEmail ? _self.errEmail : errEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

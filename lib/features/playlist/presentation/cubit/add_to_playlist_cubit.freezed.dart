// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_playlist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddToPlaylistState {

 PageState get status; List<MyPlaylist> get playlists;/// Playlists with a request in flight.
 Set<String> get busyIds; bool get isCreating;/// Error code of the last failed request.
 String? get error;
/// Create a copy of AddToPlaylistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToPlaylistStateCopyWith<AddToPlaylistState> get copyWith => _$AddToPlaylistStateCopyWithImpl<AddToPlaylistState>(this as AddToPlaylistState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToPlaylistState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.playlists, playlists)&&const DeepCollectionEquality().equals(other.busyIds, busyIds)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(playlists),const DeepCollectionEquality().hash(busyIds),isCreating,error);

@override
String toString() {
  return 'AddToPlaylistState(status: $status, playlists: $playlists, busyIds: $busyIds, isCreating: $isCreating, error: $error)';
}


}

/// @nodoc
abstract mixin class $AddToPlaylistStateCopyWith<$Res>  {
  factory $AddToPlaylistStateCopyWith(AddToPlaylistState value, $Res Function(AddToPlaylistState) _then) = _$AddToPlaylistStateCopyWithImpl;
@useResult
$Res call({
 PageState status, List<MyPlaylist> playlists, Set<String> busyIds, bool isCreating, String? error
});




}
/// @nodoc
class _$AddToPlaylistStateCopyWithImpl<$Res>
    implements $AddToPlaylistStateCopyWith<$Res> {
  _$AddToPlaylistStateCopyWithImpl(this._self, this._then);

  final AddToPlaylistState _self;
  final $Res Function(AddToPlaylistState) _then;

/// Create a copy of AddToPlaylistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? playlists = null,Object? busyIds = null,Object? isCreating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,playlists: null == playlists ? _self.playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<MyPlaylist>,busyIds: null == busyIds ? _self.busyIds : busyIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddToPlaylistState].
extension AddToPlaylistStatePatterns on AddToPlaylistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddToPlaylistState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddToPlaylistState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddToPlaylistState value)  $default,){
final _that = this;
switch (_that) {
case _AddToPlaylistState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddToPlaylistState value)?  $default,){
final _that = this;
switch (_that) {
case _AddToPlaylistState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState status,  List<MyPlaylist> playlists,  Set<String> busyIds,  bool isCreating,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddToPlaylistState() when $default != null:
return $default(_that.status,_that.playlists,_that.busyIds,_that.isCreating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState status,  List<MyPlaylist> playlists,  Set<String> busyIds,  bool isCreating,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AddToPlaylistState():
return $default(_that.status,_that.playlists,_that.busyIds,_that.isCreating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState status,  List<MyPlaylist> playlists,  Set<String> busyIds,  bool isCreating,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AddToPlaylistState() when $default != null:
return $default(_that.status,_that.playlists,_that.busyIds,_that.isCreating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AddToPlaylistState implements AddToPlaylistState {
  const _AddToPlaylistState({this.status = PageState.init, final  List<MyPlaylist> playlists = const <MyPlaylist>[], final  Set<String> busyIds = const <String>{}, this.isCreating = false, this.error}): _playlists = playlists,_busyIds = busyIds;
  

@override@JsonKey() final  PageState status;
 final  List<MyPlaylist> _playlists;
@override@JsonKey() List<MyPlaylist> get playlists {
  if (_playlists is EqualUnmodifiableListView) return _playlists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlists);
}

/// Playlists with a request in flight.
 final  Set<String> _busyIds;
/// Playlists with a request in flight.
@override@JsonKey() Set<String> get busyIds {
  if (_busyIds is EqualUnmodifiableSetView) return _busyIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_busyIds);
}

@override@JsonKey() final  bool isCreating;
/// Error code of the last failed request.
@override final  String? error;

/// Create a copy of AddToPlaylistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddToPlaylistStateCopyWith<_AddToPlaylistState> get copyWith => __$AddToPlaylistStateCopyWithImpl<_AddToPlaylistState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddToPlaylistState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._playlists, _playlists)&&const DeepCollectionEquality().equals(other._busyIds, _busyIds)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_playlists),const DeepCollectionEquality().hash(_busyIds),isCreating,error);

@override
String toString() {
  return 'AddToPlaylistState(status: $status, playlists: $playlists, busyIds: $busyIds, isCreating: $isCreating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AddToPlaylistStateCopyWith<$Res> implements $AddToPlaylistStateCopyWith<$Res> {
  factory _$AddToPlaylistStateCopyWith(_AddToPlaylistState value, $Res Function(_AddToPlaylistState) _then) = __$AddToPlaylistStateCopyWithImpl;
@override @useResult
$Res call({
 PageState status, List<MyPlaylist> playlists, Set<String> busyIds, bool isCreating, String? error
});




}
/// @nodoc
class __$AddToPlaylistStateCopyWithImpl<$Res>
    implements _$AddToPlaylistStateCopyWith<$Res> {
  __$AddToPlaylistStateCopyWithImpl(this._self, this._then);

  final _AddToPlaylistState _self;
  final $Res Function(_AddToPlaylistState) _then;

/// Create a copy of AddToPlaylistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? playlists = null,Object? busyIds = null,Object? isCreating = null,Object? error = freezed,}) {
  return _then(_AddToPlaylistState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,playlists: null == playlists ? _self._playlists : playlists // ignore: cast_nullable_to_non_nullable
as List<MyPlaylist>,busyIds: null == busyIds ? _self._busyIds : busyIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

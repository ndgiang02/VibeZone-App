// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrendingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingEvent()';
}


}

/// @nodoc
class $TrendingEventCopyWith<$Res>  {
$TrendingEventCopyWith(TrendingEvent _, $Res Function(TrendingEvent) __);
}


/// Adds pattern-matching-related methods to [TrendingEvent].
extension TrendingEventPatterns on TrendingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refreshed value)?  refreshed,TResult Function( _LoadMore value)?  loadMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refreshed value)  refreshed,required TResult Function( _LoadMore value)  loadMore,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refreshed():
return refreshed(_that);case _LoadMore():
return loadMore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refreshed value)?  refreshed,TResult? Function( _LoadMore value)?  loadMore,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function()?  loadMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _LoadMore() when loadMore != null:
return loadMore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function()  loadMore,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Refreshed():
return refreshed();case _LoadMore():
return loadMore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function()?  loadMore,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _LoadMore() when loadMore != null:
return loadMore();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TrendingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingEvent.started()';
}


}




/// @nodoc


class _Refreshed implements TrendingEvent {
  const _Refreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingEvent.refreshed()';
}


}




/// @nodoc


class _LoadMore implements TrendingEvent {
  const _LoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrendingEvent.loadMore()';
}


}




/// @nodoc
mixin _$TrendingState {

 PageState get status; List<TrendingSong> get songs;/// Last page loaded (1-based); 0 before the first one.
 int get page; bool get hasMore;
/// Create a copy of TrendingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingStateCopyWith<TrendingState> get copyWith => _$TrendingStateCopyWithImpl<TrendingState>(this as TrendingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.songs, songs)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(songs),page,hasMore);

@override
String toString() {
  return 'TrendingState(status: $status, songs: $songs, page: $page, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $TrendingStateCopyWith<$Res>  {
  factory $TrendingStateCopyWith(TrendingState value, $Res Function(TrendingState) _then) = _$TrendingStateCopyWithImpl;
@useResult
$Res call({
 PageState status, List<TrendingSong> songs, int page, bool hasMore
});




}
/// @nodoc
class _$TrendingStateCopyWithImpl<$Res>
    implements $TrendingStateCopyWith<$Res> {
  _$TrendingStateCopyWithImpl(this._self, this._then);

  final TrendingState _self;
  final $Res Function(TrendingState) _then;

/// Create a copy of TrendingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? songs = null,Object? page = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<TrendingSong>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendingState].
extension TrendingStatePatterns on TrendingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendingState value)  $default,){
final _that = this;
switch (_that) {
case _TrendingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendingState value)?  $default,){
final _that = this;
switch (_that) {
case _TrendingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState status,  List<TrendingSong> songs,  int page,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendingState() when $default != null:
return $default(_that.status,_that.songs,_that.page,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState status,  List<TrendingSong> songs,  int page,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _TrendingState():
return $default(_that.status,_that.songs,_that.page,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState status,  List<TrendingSong> songs,  int page,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _TrendingState() when $default != null:
return $default(_that.status,_that.songs,_that.page,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _TrendingState extends TrendingState {
  const _TrendingState({this.status = PageState.init, final  List<TrendingSong> songs = const <TrendingSong>[], this.page = 0, this.hasMore = false}): _songs = songs,super._();
  

@override@JsonKey() final  PageState status;
 final  List<TrendingSong> _songs;
@override@JsonKey() List<TrendingSong> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

/// Last page loaded (1-based); 0 before the first one.
@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;

/// Create a copy of TrendingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingStateCopyWith<_TrendingState> get copyWith => __$TrendingStateCopyWithImpl<_TrendingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._songs, _songs)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_songs),page,hasMore);

@override
String toString() {
  return 'TrendingState(status: $status, songs: $songs, page: $page, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$TrendingStateCopyWith<$Res> implements $TrendingStateCopyWith<$Res> {
  factory _$TrendingStateCopyWith(_TrendingState value, $Res Function(_TrendingState) _then) = __$TrendingStateCopyWithImpl;
@override @useResult
$Res call({
 PageState status, List<TrendingSong> songs, int page, bool hasMore
});




}
/// @nodoc
class __$TrendingStateCopyWithImpl<$Res>
    implements _$TrendingStateCopyWith<$Res> {
  __$TrendingStateCopyWithImpl(this._self, this._then);

  final _TrendingState _self;
  final $Res Function(_TrendingState) _then;

/// Create a copy of TrendingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? songs = null,Object? page = null,Object? hasMore = null,}) {
  return _then(_TrendingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<TrendingSong>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

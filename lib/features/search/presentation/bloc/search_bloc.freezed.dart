// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _QueryChanged value)?  queryChanged,TResult Function( _Submitted value)?  submitted,TResult Function( _RemoveRecent value)?  removeRecent,TResult Function( _ClearRecent value)?  clearRecent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _Submitted() when submitted != null:
return submitted(_that);case _RemoveRecent() when removeRecent != null:
return removeRecent(_that);case _ClearRecent() when clearRecent != null:
return clearRecent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _QueryChanged value)  queryChanged,required TResult Function( _Submitted value)  submitted,required TResult Function( _RemoveRecent value)  removeRecent,required TResult Function( _ClearRecent value)  clearRecent,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _QueryChanged():
return queryChanged(_that);case _Submitted():
return submitted(_that);case _RemoveRecent():
return removeRecent(_that);case _ClearRecent():
return clearRecent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _QueryChanged value)?  queryChanged,TResult? Function( _Submitted value)?  submitted,TResult? Function( _RemoveRecent value)?  removeRecent,TResult? Function( _ClearRecent value)?  clearRecent,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _Submitted() when submitted != null:
return submitted(_that);case _RemoveRecent() when removeRecent != null:
return removeRecent(_that);case _ClearRecent() when clearRecent != null:
return clearRecent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String query)?  queryChanged,TResult Function( String query)?  submitted,TResult Function( String query)?  removeRecent,TResult Function()?  clearRecent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _Submitted() when submitted != null:
return submitted(_that.query);case _RemoveRecent() when removeRecent != null:
return removeRecent(_that.query);case _ClearRecent() when clearRecent != null:
return clearRecent();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String query)  queryChanged,required TResult Function( String query)  submitted,required TResult Function( String query)  removeRecent,required TResult Function()  clearRecent,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _QueryChanged():
return queryChanged(_that.query);case _Submitted():
return submitted(_that.query);case _RemoveRecent():
return removeRecent(_that.query);case _ClearRecent():
return clearRecent();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String query)?  queryChanged,TResult? Function( String query)?  submitted,TResult? Function( String query)?  removeRecent,TResult? Function()?  clearRecent,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _Submitted() when submitted != null:
return submitted(_that.query);case _RemoveRecent() when removeRecent != null:
return removeRecent(_that.query);case _ClearRecent() when clearRecent != null:
return clearRecent();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SearchEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.started()';
}


}




/// @nodoc


class _QueryChanged implements SearchEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryChangedCopyWith<_QueryChanged> get copyWith => __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(_QueryChanged value, $Res Function(_QueryChanged) _then) = __$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Submitted implements SearchEvent {
  const _Submitted(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittedCopyWith<_Submitted> get copyWith => __$SubmittedCopyWithImpl<_Submitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.submitted(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SubmittedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$SubmittedCopyWith(_Submitted value, $Res Function(_Submitted) _then) = __$SubmittedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SubmittedCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(this._self, this._then);

  final _Submitted _self;
  final $Res Function(_Submitted) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_Submitted(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveRecent implements SearchEvent {
  const _RemoveRecent(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveRecentCopyWith<_RemoveRecent> get copyWith => __$RemoveRecentCopyWithImpl<_RemoveRecent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveRecent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.removeRecent(query: $query)';
}


}

/// @nodoc
abstract mixin class _$RemoveRecentCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$RemoveRecentCopyWith(_RemoveRecent value, $Res Function(_RemoveRecent) _then) = __$RemoveRecentCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$RemoveRecentCopyWithImpl<$Res>
    implements _$RemoveRecentCopyWith<$Res> {
  __$RemoveRecentCopyWithImpl(this._self, this._then);

  final _RemoveRecent _self;
  final $Res Function(_RemoveRecent) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_RemoveRecent(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClearRecent implements SearchEvent {
  const _ClearRecent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearRecent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.clearRecent()';
}


}




/// @nodoc
mixin _$SearchState {

 PageState get status; String get query; List<Song> get results; List<String> get genres; List<String> get recentSearches; String? get errorMessage;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.results, results)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.recentSearches, recentSearches)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(results),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(recentSearches),errorMessage);

@override
String toString() {
  return 'SearchState(status: $status, query: $query, results: $results, genres: $genres, recentSearches: $recentSearches, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 PageState status, String query, List<Song> results, List<String> genres, List<String> recentSearches, String? errorMessage
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? query = null,Object? results = null,Object? genres = null,Object? recentSearches = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Song>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,recentSearches: null == recentSearches ? _self.recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState status,  String query,  List<Song> results,  List<String> genres,  List<String> recentSearches,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.results,_that.genres,_that.recentSearches,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState status,  String query,  List<Song> results,  List<String> genres,  List<String> recentSearches,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.query,_that.results,_that.genres,_that.recentSearches,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState status,  String query,  List<Song> results,  List<String> genres,  List<String> recentSearches,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.results,_that.genres,_that.recentSearches,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends SearchState {
  const _SearchState({this.status = PageState.init, this.query = '', final  List<Song> results = const <Song>[], final  List<String> genres = const <String>[], final  List<String> recentSearches = const <String>[], this.errorMessage}): _results = results,_genres = genres,_recentSearches = recentSearches,super._();
  

@override@JsonKey() final  PageState status;
@override@JsonKey() final  String query;
 final  List<Song> _results;
@override@JsonKey() List<Song> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<String> _genres;
@override@JsonKey() List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<String> _recentSearches;
@override@JsonKey() List<String> get recentSearches {
  if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSearches);
}

@override final  String? errorMessage;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._results, _results)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._recentSearches, _recentSearches)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_recentSearches),errorMessage);

@override
String toString() {
  return 'SearchState(status: $status, query: $query, results: $results, genres: $genres, recentSearches: $recentSearches, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 PageState status, String query, List<Song> results, List<String> genres, List<String> recentSearches, String? errorMessage
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? query = null,Object? results = null,Object? genres = null,Object? recentSearches = null,Object? errorMessage = freezed,}) {
  return _then(_SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Song>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,recentSearches: null == recentSearches ? _self._recentSearches : recentSearches // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

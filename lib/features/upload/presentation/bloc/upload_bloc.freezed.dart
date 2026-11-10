// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadEvent()';
}


}

/// @nodoc
class $UploadEventCopyWith<$Res>  {
$UploadEventCopyWith(UploadEvent _, $Res Function(UploadEvent) __);
}


/// Adds pattern-matching-related methods to [UploadEvent].
extension UploadEventPatterns on UploadEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BecomeArtist value)?  becomeArtist,TResult Function( _TitleChanged value)?  titleChanged,TResult Function( _DescriptionChanged value)?  descriptionChanged,TResult Function( _GenreSelected value)?  genreSelected,TResult Function( _VisibilityChanged value)?  visibilityChanged,TResult Function( _AudioPicked value)?  audioPicked,TResult Function( _ArtworkPicked value)?  artworkPicked,TResult Function( _Submit value)?  submit,TResult Function( _Reset value)?  reset,TResult Function( _OnClearPage value)?  onClearPage,TResult Function( _Progress value)?  progress,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BecomeArtist() when becomeArtist != null:
return becomeArtist(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _GenreSelected() when genreSelected != null:
return genreSelected(_that);case _VisibilityChanged() when visibilityChanged != null:
return visibilityChanged(_that);case _AudioPicked() when audioPicked != null:
return audioPicked(_that);case _ArtworkPicked() when artworkPicked != null:
return artworkPicked(_that);case _Submit() when submit != null:
return submit(_that);case _Reset() when reset != null:
return reset(_that);case _OnClearPage() when onClearPage != null:
return onClearPage(_that);case _Progress() when progress != null:
return progress(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BecomeArtist value)  becomeArtist,required TResult Function( _TitleChanged value)  titleChanged,required TResult Function( _DescriptionChanged value)  descriptionChanged,required TResult Function( _GenreSelected value)  genreSelected,required TResult Function( _VisibilityChanged value)  visibilityChanged,required TResult Function( _AudioPicked value)  audioPicked,required TResult Function( _ArtworkPicked value)  artworkPicked,required TResult Function( _Submit value)  submit,required TResult Function( _Reset value)  reset,required TResult Function( _OnClearPage value)  onClearPage,required TResult Function( _Progress value)  progress,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BecomeArtist():
return becomeArtist(_that);case _TitleChanged():
return titleChanged(_that);case _DescriptionChanged():
return descriptionChanged(_that);case _GenreSelected():
return genreSelected(_that);case _VisibilityChanged():
return visibilityChanged(_that);case _AudioPicked():
return audioPicked(_that);case _ArtworkPicked():
return artworkPicked(_that);case _Submit():
return submit(_that);case _Reset():
return reset(_that);case _OnClearPage():
return onClearPage(_that);case _Progress():
return progress(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BecomeArtist value)?  becomeArtist,TResult? Function( _TitleChanged value)?  titleChanged,TResult? Function( _DescriptionChanged value)?  descriptionChanged,TResult? Function( _GenreSelected value)?  genreSelected,TResult? Function( _VisibilityChanged value)?  visibilityChanged,TResult? Function( _AudioPicked value)?  audioPicked,TResult? Function( _ArtworkPicked value)?  artworkPicked,TResult? Function( _Submit value)?  submit,TResult? Function( _Reset value)?  reset,TResult? Function( _OnClearPage value)?  onClearPage,TResult? Function( _Progress value)?  progress,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BecomeArtist() when becomeArtist != null:
return becomeArtist(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that);case _GenreSelected() when genreSelected != null:
return genreSelected(_that);case _VisibilityChanged() when visibilityChanged != null:
return visibilityChanged(_that);case _AudioPicked() when audioPicked != null:
return audioPicked(_that);case _ArtworkPicked() when artworkPicked != null:
return artworkPicked(_that);case _Submit() when submit != null:
return submit(_that);case _Reset() when reset != null:
return reset(_that);case _OnClearPage() when onClearPage != null:
return onClearPage(_that);case _Progress() when progress != null:
return progress(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String name,  String slug)?  becomeArtist,TResult Function( String title)?  titleChanged,TResult Function( String description)?  descriptionChanged,TResult Function( Genre? genre)?  genreSelected,TResult Function( TrackVisibility visibility)?  visibilityChanged,TResult Function( String path)?  audioPicked,TResult Function( String? path)?  artworkPicked,TResult Function()?  submit,TResult Function()?  reset,TResult Function()?  onClearPage,TResult Function( int sent,  int total)?  progress,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BecomeArtist() when becomeArtist != null:
return becomeArtist(_that.name,_that.slug);case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _GenreSelected() when genreSelected != null:
return genreSelected(_that.genre);case _VisibilityChanged() when visibilityChanged != null:
return visibilityChanged(_that.visibility);case _AudioPicked() when audioPicked != null:
return audioPicked(_that.path);case _ArtworkPicked() when artworkPicked != null:
return artworkPicked(_that.path);case _Submit() when submit != null:
return submit();case _Reset() when reset != null:
return reset();case _OnClearPage() when onClearPage != null:
return onClearPage();case _Progress() when progress != null:
return progress(_that.sent,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String name,  String slug)  becomeArtist,required TResult Function( String title)  titleChanged,required TResult Function( String description)  descriptionChanged,required TResult Function( Genre? genre)  genreSelected,required TResult Function( TrackVisibility visibility)  visibilityChanged,required TResult Function( String path)  audioPicked,required TResult Function( String? path)  artworkPicked,required TResult Function()  submit,required TResult Function()  reset,required TResult Function()  onClearPage,required TResult Function( int sent,  int total)  progress,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BecomeArtist():
return becomeArtist(_that.name,_that.slug);case _TitleChanged():
return titleChanged(_that.title);case _DescriptionChanged():
return descriptionChanged(_that.description);case _GenreSelected():
return genreSelected(_that.genre);case _VisibilityChanged():
return visibilityChanged(_that.visibility);case _AudioPicked():
return audioPicked(_that.path);case _ArtworkPicked():
return artworkPicked(_that.path);case _Submit():
return submit();case _Reset():
return reset();case _OnClearPage():
return onClearPage();case _Progress():
return progress(_that.sent,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String name,  String slug)?  becomeArtist,TResult? Function( String title)?  titleChanged,TResult? Function( String description)?  descriptionChanged,TResult? Function( Genre? genre)?  genreSelected,TResult? Function( TrackVisibility visibility)?  visibilityChanged,TResult? Function( String path)?  audioPicked,TResult? Function( String? path)?  artworkPicked,TResult? Function()?  submit,TResult? Function()?  reset,TResult? Function()?  onClearPage,TResult? Function( int sent,  int total)?  progress,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BecomeArtist() when becomeArtist != null:
return becomeArtist(_that.name,_that.slug);case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _DescriptionChanged() when descriptionChanged != null:
return descriptionChanged(_that.description);case _GenreSelected() when genreSelected != null:
return genreSelected(_that.genre);case _VisibilityChanged() when visibilityChanged != null:
return visibilityChanged(_that.visibility);case _AudioPicked() when audioPicked != null:
return audioPicked(_that.path);case _ArtworkPicked() when artworkPicked != null:
return artworkPicked(_that.path);case _Submit() when submit != null:
return submit();case _Reset() when reset != null:
return reset();case _OnClearPage() when onClearPage != null:
return onClearPage();case _Progress() when progress != null:
return progress(_that.sent,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UploadEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadEvent.started()';
}


}




/// @nodoc


class _BecomeArtist implements UploadEvent {
  const _BecomeArtist({required this.name, required this.slug});
  

 final  String name;
 final  String slug;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BecomeArtistCopyWith<_BecomeArtist> get copyWith => __$BecomeArtistCopyWithImpl<_BecomeArtist>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BecomeArtist&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}


@override
int get hashCode => Object.hash(runtimeType,name,slug);

@override
String toString() {
  return 'UploadEvent.becomeArtist(name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$BecomeArtistCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$BecomeArtistCopyWith(_BecomeArtist value, $Res Function(_BecomeArtist) _then) = __$BecomeArtistCopyWithImpl;
@useResult
$Res call({
 String name, String slug
});




}
/// @nodoc
class __$BecomeArtistCopyWithImpl<$Res>
    implements _$BecomeArtistCopyWith<$Res> {
  __$BecomeArtistCopyWithImpl(this._self, this._then);

  final _BecomeArtist _self;
  final $Res Function(_BecomeArtist) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = null,}) {
  return _then(_BecomeArtist(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TitleChanged implements UploadEvent {
  const _TitleChanged(this.title);
  

 final  String title;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleChangedCopyWith<_TitleChanged> get copyWith => __$TitleChangedCopyWithImpl<_TitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleChanged&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'UploadEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$TitleChangedCopyWith(_TitleChanged value, $Res Function(_TitleChanged) _then) = __$TitleChangedCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$TitleChangedCopyWithImpl<$Res>
    implements _$TitleChangedCopyWith<$Res> {
  __$TitleChangedCopyWithImpl(this._self, this._then);

  final _TitleChanged _self;
  final $Res Function(_TitleChanged) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_TitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DescriptionChanged implements UploadEvent {
  const _DescriptionChanged(this.description);
  

 final  String description;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionChangedCopyWith<_DescriptionChanged> get copyWith => __$DescriptionChangedCopyWithImpl<_DescriptionChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionChanged&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'UploadEvent.descriptionChanged(description: $description)';
}


}

/// @nodoc
abstract mixin class _$DescriptionChangedCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$DescriptionChangedCopyWith(_DescriptionChanged value, $Res Function(_DescriptionChanged) _then) = __$DescriptionChangedCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class __$DescriptionChangedCopyWithImpl<$Res>
    implements _$DescriptionChangedCopyWith<$Res> {
  __$DescriptionChangedCopyWithImpl(this._self, this._then);

  final _DescriptionChanged _self;
  final $Res Function(_DescriptionChanged) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(_DescriptionChanged(
null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GenreSelected implements UploadEvent {
  const _GenreSelected(this.genre);
  

 final  Genre? genre;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreSelectedCopyWith<_GenreSelected> get copyWith => __$GenreSelectedCopyWithImpl<_GenreSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenreSelected&&(identical(other.genre, genre) || other.genre == genre));
}


@override
int get hashCode => Object.hash(runtimeType,genre);

@override
String toString() {
  return 'UploadEvent.genreSelected(genre: $genre)';
}


}

/// @nodoc
abstract mixin class _$GenreSelectedCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$GenreSelectedCopyWith(_GenreSelected value, $Res Function(_GenreSelected) _then) = __$GenreSelectedCopyWithImpl;
@useResult
$Res call({
 Genre? genre
});




}
/// @nodoc
class __$GenreSelectedCopyWithImpl<$Res>
    implements _$GenreSelectedCopyWith<$Res> {
  __$GenreSelectedCopyWithImpl(this._self, this._then);

  final _GenreSelected _self;
  final $Res Function(_GenreSelected) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genre = freezed,}) {
  return _then(_GenreSelected(
freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre?,
  ));
}


}

/// @nodoc


class _VisibilityChanged implements UploadEvent {
  const _VisibilityChanged(this.visibility);
  

 final  TrackVisibility visibility;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisibilityChangedCopyWith<_VisibilityChanged> get copyWith => __$VisibilityChangedCopyWithImpl<_VisibilityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisibilityChanged&&(identical(other.visibility, visibility) || other.visibility == visibility));
}


@override
int get hashCode => Object.hash(runtimeType,visibility);

@override
String toString() {
  return 'UploadEvent.visibilityChanged(visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class _$VisibilityChangedCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$VisibilityChangedCopyWith(_VisibilityChanged value, $Res Function(_VisibilityChanged) _then) = __$VisibilityChangedCopyWithImpl;
@useResult
$Res call({
 TrackVisibility visibility
});




}
/// @nodoc
class __$VisibilityChangedCopyWithImpl<$Res>
    implements _$VisibilityChangedCopyWith<$Res> {
  __$VisibilityChangedCopyWithImpl(this._self, this._then);

  final _VisibilityChanged _self;
  final $Res Function(_VisibilityChanged) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? visibility = null,}) {
  return _then(_VisibilityChanged(
null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as TrackVisibility,
  ));
}


}

/// @nodoc


class _AudioPicked implements UploadEvent {
  const _AudioPicked(this.path);
  

 final  String path;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioPickedCopyWith<_AudioPicked> get copyWith => __$AudioPickedCopyWithImpl<_AudioPicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioPicked&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'UploadEvent.audioPicked(path: $path)';
}


}

/// @nodoc
abstract mixin class _$AudioPickedCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$AudioPickedCopyWith(_AudioPicked value, $Res Function(_AudioPicked) _then) = __$AudioPickedCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class __$AudioPickedCopyWithImpl<$Res>
    implements _$AudioPickedCopyWith<$Res> {
  __$AudioPickedCopyWithImpl(this._self, this._then);

  final _AudioPicked _self;
  final $Res Function(_AudioPicked) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_AudioPicked(
null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ArtworkPicked implements UploadEvent {
  const _ArtworkPicked(this.path);
  

 final  String? path;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArtworkPickedCopyWith<_ArtworkPicked> get copyWith => __$ArtworkPickedCopyWithImpl<_ArtworkPicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArtworkPicked&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'UploadEvent.artworkPicked(path: $path)';
}


}

/// @nodoc
abstract mixin class _$ArtworkPickedCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$ArtworkPickedCopyWith(_ArtworkPicked value, $Res Function(_ArtworkPicked) _then) = __$ArtworkPickedCopyWithImpl;
@useResult
$Res call({
 String? path
});




}
/// @nodoc
class __$ArtworkPickedCopyWithImpl<$Res>
    implements _$ArtworkPickedCopyWith<$Res> {
  __$ArtworkPickedCopyWithImpl(this._self, this._then);

  final _ArtworkPicked _self;
  final $Res Function(_ArtworkPicked) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = freezed,}) {
  return _then(_ArtworkPicked(
freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Submit implements UploadEvent {
  const _Submit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadEvent.submit()';
}


}




/// @nodoc


class _Reset implements UploadEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadEvent.reset()';
}


}




/// @nodoc


class _OnClearPage implements UploadEvent {
  const _OnClearPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnClearPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadEvent.onClearPage()';
}


}




/// @nodoc


class _Progress implements UploadEvent {
  const _Progress(this.sent, this.total);
  

 final  int sent;
 final  int total;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressCopyWith<_Progress> get copyWith => __$ProgressCopyWithImpl<_Progress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Progress&&(identical(other.sent, sent) || other.sent == sent)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,sent,total);

@override
String toString() {
  return 'UploadEvent.progress(sent: $sent, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ProgressCopyWith<$Res> implements $UploadEventCopyWith<$Res> {
  factory _$ProgressCopyWith(_Progress value, $Res Function(_Progress) _then) = __$ProgressCopyWithImpl;
@useResult
$Res call({
 int sent, int total
});




}
/// @nodoc
class __$ProgressCopyWithImpl<$Res>
    implements _$ProgressCopyWith<$Res> {
  __$ProgressCopyWithImpl(this._self, this._then);

  final _Progress _self;
  final $Res Function(_Progress) _then;

/// Create a copy of UploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sent = null,Object? total = null,}) {
  return _then(_Progress(
null == sent ? _self.sent : sent // ignore: cast_nullable_to_non_nullable
as int,null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$UploadState {

/// Loading the artist profile and genres.
 PageState get status;/// `null` until the user creates one.
 ArtistProfile? get artist; bool get isCreatingArtist; List<Genre> get genres; String get title; String get description; Genre? get genre; TrackVisibility get visibility; String? get audioPath; String? get artworkPath; UploadPhase get phase;/// 0..1 of the bytes sent.
 double get progress;/// Processing error code when [phase] is [UploadPhase.failed].
 String? get processingError; String? get errTitle; String? get errAudio; PageCommand? get pageCommand;
/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadStateCopyWith<UploadState> get copyWith => _$UploadStateCopyWithImpl<UploadState>(this as UploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadState&&(identical(other.status, status) || other.status == status)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.isCreatingArtist, isCreatingArtist) || other.isCreatingArtist == isCreatingArtist)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.artworkPath, artworkPath) || other.artworkPath == artworkPath)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.processingError, processingError) || other.processingError == processingError)&&(identical(other.errTitle, errTitle) || other.errTitle == errTitle)&&(identical(other.errAudio, errAudio) || other.errAudio == errAudio)&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,status,artist,isCreatingArtist,const DeepCollectionEquality().hash(genres),title,description,genre,visibility,audioPath,artworkPath,phase,progress,processingError,errTitle,errAudio,pageCommand);

@override
String toString() {
  return 'UploadState(status: $status, artist: $artist, isCreatingArtist: $isCreatingArtist, genres: $genres, title: $title, description: $description, genre: $genre, visibility: $visibility, audioPath: $audioPath, artworkPath: $artworkPath, phase: $phase, progress: $progress, processingError: $processingError, errTitle: $errTitle, errAudio: $errAudio, pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class $UploadStateCopyWith<$Res>  {
  factory $UploadStateCopyWith(UploadState value, $Res Function(UploadState) _then) = _$UploadStateCopyWithImpl;
@useResult
$Res call({
 PageState status, ArtistProfile? artist, bool isCreatingArtist, List<Genre> genres, String title, String description, Genre? genre, TrackVisibility visibility, String? audioPath, String? artworkPath, UploadPhase phase, double progress, String? processingError, String? errTitle, String? errAudio, PageCommand? pageCommand
});




}
/// @nodoc
class _$UploadStateCopyWithImpl<$Res>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._self, this._then);

  final UploadState _self;
  final $Res Function(UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? artist = freezed,Object? isCreatingArtist = null,Object? genres = null,Object? title = null,Object? description = null,Object? genre = freezed,Object? visibility = null,Object? audioPath = freezed,Object? artworkPath = freezed,Object? phase = null,Object? progress = null,Object? processingError = freezed,Object? errTitle = freezed,Object? errAudio = freezed,Object? pageCommand = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as ArtistProfile?,isCreatingArtist: null == isCreatingArtist ? _self.isCreatingArtist : isCreatingArtist // ignore: cast_nullable_to_non_nullable
as bool,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as TrackVisibility,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,artworkPath: freezed == artworkPath ? _self.artworkPath : artworkPath // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as UploadPhase,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,processingError: freezed == processingError ? _self.processingError : processingError // ignore: cast_nullable_to_non_nullable
as String?,errTitle: freezed == errTitle ? _self.errTitle : errTitle // ignore: cast_nullable_to_non_nullable
as String?,errAudio: freezed == errAudio ? _self.errAudio : errAudio // ignore: cast_nullable_to_non_nullable
as String?,pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadState].
extension UploadStatePatterns on UploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadState value)  $default,){
final _that = this;
switch (_that) {
case _UploadState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadState value)?  $default,){
final _that = this;
switch (_that) {
case _UploadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState status,  ArtistProfile? artist,  bool isCreatingArtist,  List<Genre> genres,  String title,  String description,  Genre? genre,  TrackVisibility visibility,  String? audioPath,  String? artworkPath,  UploadPhase phase,  double progress,  String? processingError,  String? errTitle,  String? errAudio,  PageCommand? pageCommand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that.status,_that.artist,_that.isCreatingArtist,_that.genres,_that.title,_that.description,_that.genre,_that.visibility,_that.audioPath,_that.artworkPath,_that.phase,_that.progress,_that.processingError,_that.errTitle,_that.errAudio,_that.pageCommand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState status,  ArtistProfile? artist,  bool isCreatingArtist,  List<Genre> genres,  String title,  String description,  Genre? genre,  TrackVisibility visibility,  String? audioPath,  String? artworkPath,  UploadPhase phase,  double progress,  String? processingError,  String? errTitle,  String? errAudio,  PageCommand? pageCommand)  $default,) {final _that = this;
switch (_that) {
case _UploadState():
return $default(_that.status,_that.artist,_that.isCreatingArtist,_that.genres,_that.title,_that.description,_that.genre,_that.visibility,_that.audioPath,_that.artworkPath,_that.phase,_that.progress,_that.processingError,_that.errTitle,_that.errAudio,_that.pageCommand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState status,  ArtistProfile? artist,  bool isCreatingArtist,  List<Genre> genres,  String title,  String description,  Genre? genre,  TrackVisibility visibility,  String? audioPath,  String? artworkPath,  UploadPhase phase,  double progress,  String? processingError,  String? errTitle,  String? errAudio,  PageCommand? pageCommand)?  $default,) {final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that.status,_that.artist,_that.isCreatingArtist,_that.genres,_that.title,_that.description,_that.genre,_that.visibility,_that.audioPath,_that.artworkPath,_that.phase,_that.progress,_that.processingError,_that.errTitle,_that.errAudio,_that.pageCommand);case _:
  return null;

}
}

}

/// @nodoc


class _UploadState extends UploadState {
  const _UploadState({this.status = PageState.init, this.artist, this.isCreatingArtist = false, final  List<Genre> genres = const <Genre>[], this.title = '', this.description = '', this.genre, this.visibility = TrackVisibility.public, this.audioPath, this.artworkPath, this.phase = UploadPhase.idle, this.progress = 0.0, this.processingError, this.errTitle, this.errAudio, this.pageCommand}): _genres = genres,super._();
  

/// Loading the artist profile and genres.
@override@JsonKey() final  PageState status;
/// `null` until the user creates one.
@override final  ArtistProfile? artist;
@override@JsonKey() final  bool isCreatingArtist;
 final  List<Genre> _genres;
@override@JsonKey() List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  Genre? genre;
@override@JsonKey() final  TrackVisibility visibility;
@override final  String? audioPath;
@override final  String? artworkPath;
@override@JsonKey() final  UploadPhase phase;
/// 0..1 of the bytes sent.
@override@JsonKey() final  double progress;
/// Processing error code when [phase] is [UploadPhase.failed].
@override final  String? processingError;
@override final  String? errTitle;
@override final  String? errAudio;
@override final  PageCommand? pageCommand;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadStateCopyWith<_UploadState> get copyWith => __$UploadStateCopyWithImpl<_UploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadState&&(identical(other.status, status) || other.status == status)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.isCreatingArtist, isCreatingArtist) || other.isCreatingArtist == isCreatingArtist)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.artworkPath, artworkPath) || other.artworkPath == artworkPath)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.processingError, processingError) || other.processingError == processingError)&&(identical(other.errTitle, errTitle) || other.errTitle == errTitle)&&(identical(other.errAudio, errAudio) || other.errAudio == errAudio)&&(identical(other.pageCommand, pageCommand) || other.pageCommand == pageCommand));
}


@override
int get hashCode => Object.hash(runtimeType,status,artist,isCreatingArtist,const DeepCollectionEquality().hash(_genres),title,description,genre,visibility,audioPath,artworkPath,phase,progress,processingError,errTitle,errAudio,pageCommand);

@override
String toString() {
  return 'UploadState(status: $status, artist: $artist, isCreatingArtist: $isCreatingArtist, genres: $genres, title: $title, description: $description, genre: $genre, visibility: $visibility, audioPath: $audioPath, artworkPath: $artworkPath, phase: $phase, progress: $progress, processingError: $processingError, errTitle: $errTitle, errAudio: $errAudio, pageCommand: $pageCommand)';
}


}

/// @nodoc
abstract mixin class _$UploadStateCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$UploadStateCopyWith(_UploadState value, $Res Function(_UploadState) _then) = __$UploadStateCopyWithImpl;
@override @useResult
$Res call({
 PageState status, ArtistProfile? artist, bool isCreatingArtist, List<Genre> genres, String title, String description, Genre? genre, TrackVisibility visibility, String? audioPath, String? artworkPath, UploadPhase phase, double progress, String? processingError, String? errTitle, String? errAudio, PageCommand? pageCommand
});




}
/// @nodoc
class __$UploadStateCopyWithImpl<$Res>
    implements _$UploadStateCopyWith<$Res> {
  __$UploadStateCopyWithImpl(this._self, this._then);

  final _UploadState _self;
  final $Res Function(_UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? artist = freezed,Object? isCreatingArtist = null,Object? genres = null,Object? title = null,Object? description = null,Object? genre = freezed,Object? visibility = null,Object? audioPath = freezed,Object? artworkPath = freezed,Object? phase = null,Object? progress = null,Object? processingError = freezed,Object? errTitle = freezed,Object? errAudio = freezed,Object? pageCommand = freezed,}) {
  return _then(_UploadState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as ArtistProfile?,isCreatingArtist: null == isCreatingArtist ? _self.isCreatingArtist : isCreatingArtist // ignore: cast_nullable_to_non_nullable
as bool,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as TrackVisibility,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,artworkPath: freezed == artworkPath ? _self.artworkPath : artworkPath // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as UploadPhase,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,processingError: freezed == processingError ? _self.processingError : processingError // ignore: cast_nullable_to_non_nullable
as String?,errTitle: freezed == errTitle ? _self.errTitle : errTitle // ignore: cast_nullable_to_non_nullable
as String?,errAudio: freezed == errAudio ? _self.errAudio : errAudio // ignore: cast_nullable_to_non_nullable
as String?,pageCommand: freezed == pageCommand ? _self.pageCommand : pageCommand // ignore: cast_nullable_to_non_nullable
as PageCommand?,
  ));
}


}

// dart format on

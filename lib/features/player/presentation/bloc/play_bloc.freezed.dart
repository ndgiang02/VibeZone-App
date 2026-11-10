// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent()';
}


}

/// @nodoc
class $PlayEventCopyWith<$Res>  {
$PlayEventCopyWith(PlayEvent _, $Res Function(PlayEvent) __);
}


/// Adds pattern-matching-related methods to [PlayEvent].
extension PlayEventPatterns on PlayEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PlayPause value)?  playPause,TResult Function( _Next value)?  next,TResult Function( _Previous value)?  previous,TResult Function( _Seek value)?  seek,TResult Function( _ToggleShuffle value)?  toggleShuffle,TResult Function( _ToggleRepeat value)?  toggleRepeat,TResult Function( _ToggleFavorite value)?  toggleFavorite,TResult Function( _PlaySong value)?  playSong,TResult Function( _Stop value)?  stop,TResult Function( _UpdatePosition value)?  updatePosition,TResult Function( _DurationChanged value)?  durationChanged,TResult Function( _PlayerStateChanged value)?  playerStateChanged,TResult Function( _PlaybackFailed value)?  playbackFailed,TResult Function( _WaveformLoaded value)?  waveformLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayPause() when playPause != null:
return playPause(_that);case _Next() when next != null:
return next(_that);case _Previous() when previous != null:
return previous(_that);case _Seek() when seek != null:
return seek(_that);case _ToggleShuffle() when toggleShuffle != null:
return toggleShuffle(_that);case _ToggleRepeat() when toggleRepeat != null:
return toggleRepeat(_that);case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case _PlaySong() when playSong != null:
return playSong(_that);case _Stop() when stop != null:
return stop(_that);case _UpdatePosition() when updatePosition != null:
return updatePosition(_that);case _DurationChanged() when durationChanged != null:
return durationChanged(_that);case _PlayerStateChanged() when playerStateChanged != null:
return playerStateChanged(_that);case _PlaybackFailed() when playbackFailed != null:
return playbackFailed(_that);case _WaveformLoaded() when waveformLoaded != null:
return waveformLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PlayPause value)  playPause,required TResult Function( _Next value)  next,required TResult Function( _Previous value)  previous,required TResult Function( _Seek value)  seek,required TResult Function( _ToggleShuffle value)  toggleShuffle,required TResult Function( _ToggleRepeat value)  toggleRepeat,required TResult Function( _ToggleFavorite value)  toggleFavorite,required TResult Function( _PlaySong value)  playSong,required TResult Function( _Stop value)  stop,required TResult Function( _UpdatePosition value)  updatePosition,required TResult Function( _DurationChanged value)  durationChanged,required TResult Function( _PlayerStateChanged value)  playerStateChanged,required TResult Function( _PlaybackFailed value)  playbackFailed,required TResult Function( _WaveformLoaded value)  waveformLoaded,}){
final _that = this;
switch (_that) {
case _PlayPause():
return playPause(_that);case _Next():
return next(_that);case _Previous():
return previous(_that);case _Seek():
return seek(_that);case _ToggleShuffle():
return toggleShuffle(_that);case _ToggleRepeat():
return toggleRepeat(_that);case _ToggleFavorite():
return toggleFavorite(_that);case _PlaySong():
return playSong(_that);case _Stop():
return stop(_that);case _UpdatePosition():
return updatePosition(_that);case _DurationChanged():
return durationChanged(_that);case _PlayerStateChanged():
return playerStateChanged(_that);case _PlaybackFailed():
return playbackFailed(_that);case _WaveformLoaded():
return waveformLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PlayPause value)?  playPause,TResult? Function( _Next value)?  next,TResult? Function( _Previous value)?  previous,TResult? Function( _Seek value)?  seek,TResult? Function( _ToggleShuffle value)?  toggleShuffle,TResult? Function( _ToggleRepeat value)?  toggleRepeat,TResult? Function( _ToggleFavorite value)?  toggleFavorite,TResult? Function( _PlaySong value)?  playSong,TResult? Function( _Stop value)?  stop,TResult? Function( _UpdatePosition value)?  updatePosition,TResult? Function( _DurationChanged value)?  durationChanged,TResult? Function( _PlayerStateChanged value)?  playerStateChanged,TResult? Function( _PlaybackFailed value)?  playbackFailed,TResult? Function( _WaveformLoaded value)?  waveformLoaded,}){
final _that = this;
switch (_that) {
case _PlayPause() when playPause != null:
return playPause(_that);case _Next() when next != null:
return next(_that);case _Previous() when previous != null:
return previous(_that);case _Seek() when seek != null:
return seek(_that);case _ToggleShuffle() when toggleShuffle != null:
return toggleShuffle(_that);case _ToggleRepeat() when toggleRepeat != null:
return toggleRepeat(_that);case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case _PlaySong() when playSong != null:
return playSong(_that);case _Stop() when stop != null:
return stop(_that);case _UpdatePosition() when updatePosition != null:
return updatePosition(_that);case _DurationChanged() when durationChanged != null:
return durationChanged(_that);case _PlayerStateChanged() when playerStateChanged != null:
return playerStateChanged(_that);case _PlaybackFailed() when playbackFailed != null:
return playbackFailed(_that);case _WaveformLoaded() when waveformLoaded != null:
return waveformLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  playPause,TResult Function()?  next,TResult Function()?  previous,TResult Function( double position)?  seek,TResult Function()?  toggleShuffle,TResult Function()?  toggleRepeat,TResult Function()?  toggleFavorite,TResult Function( Song song,  List<Song> queue)?  playSong,TResult Function()?  stop,TResult Function( double position)?  updatePosition,TResult Function( double duration)?  durationChanged,TResult Function( bool playing,  bool buffering,  bool completed)?  playerStateChanged,TResult Function()?  playbackFailed,TResult Function( String songId,  List<double> peaks)?  waveformLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayPause() when playPause != null:
return playPause();case _Next() when next != null:
return next();case _Previous() when previous != null:
return previous();case _Seek() when seek != null:
return seek(_that.position);case _ToggleShuffle() when toggleShuffle != null:
return toggleShuffle();case _ToggleRepeat() when toggleRepeat != null:
return toggleRepeat();case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite();case _PlaySong() when playSong != null:
return playSong(_that.song,_that.queue);case _Stop() when stop != null:
return stop();case _UpdatePosition() when updatePosition != null:
return updatePosition(_that.position);case _DurationChanged() when durationChanged != null:
return durationChanged(_that.duration);case _PlayerStateChanged() when playerStateChanged != null:
return playerStateChanged(_that.playing,_that.buffering,_that.completed);case _PlaybackFailed() when playbackFailed != null:
return playbackFailed();case _WaveformLoaded() when waveformLoaded != null:
return waveformLoaded(_that.songId,_that.peaks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  playPause,required TResult Function()  next,required TResult Function()  previous,required TResult Function( double position)  seek,required TResult Function()  toggleShuffle,required TResult Function()  toggleRepeat,required TResult Function()  toggleFavorite,required TResult Function( Song song,  List<Song> queue)  playSong,required TResult Function()  stop,required TResult Function( double position)  updatePosition,required TResult Function( double duration)  durationChanged,required TResult Function( bool playing,  bool buffering,  bool completed)  playerStateChanged,required TResult Function()  playbackFailed,required TResult Function( String songId,  List<double> peaks)  waveformLoaded,}) {final _that = this;
switch (_that) {
case _PlayPause():
return playPause();case _Next():
return next();case _Previous():
return previous();case _Seek():
return seek(_that.position);case _ToggleShuffle():
return toggleShuffle();case _ToggleRepeat():
return toggleRepeat();case _ToggleFavorite():
return toggleFavorite();case _PlaySong():
return playSong(_that.song,_that.queue);case _Stop():
return stop();case _UpdatePosition():
return updatePosition(_that.position);case _DurationChanged():
return durationChanged(_that.duration);case _PlayerStateChanged():
return playerStateChanged(_that.playing,_that.buffering,_that.completed);case _PlaybackFailed():
return playbackFailed();case _WaveformLoaded():
return waveformLoaded(_that.songId,_that.peaks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  playPause,TResult? Function()?  next,TResult? Function()?  previous,TResult? Function( double position)?  seek,TResult? Function()?  toggleShuffle,TResult? Function()?  toggleRepeat,TResult? Function()?  toggleFavorite,TResult? Function( Song song,  List<Song> queue)?  playSong,TResult? Function()?  stop,TResult? Function( double position)?  updatePosition,TResult? Function( double duration)?  durationChanged,TResult? Function( bool playing,  bool buffering,  bool completed)?  playerStateChanged,TResult? Function()?  playbackFailed,TResult? Function( String songId,  List<double> peaks)?  waveformLoaded,}) {final _that = this;
switch (_that) {
case _PlayPause() when playPause != null:
return playPause();case _Next() when next != null:
return next();case _Previous() when previous != null:
return previous();case _Seek() when seek != null:
return seek(_that.position);case _ToggleShuffle() when toggleShuffle != null:
return toggleShuffle();case _ToggleRepeat() when toggleRepeat != null:
return toggleRepeat();case _ToggleFavorite() when toggleFavorite != null:
return toggleFavorite();case _PlaySong() when playSong != null:
return playSong(_that.song,_that.queue);case _Stop() when stop != null:
return stop();case _UpdatePosition() when updatePosition != null:
return updatePosition(_that.position);case _DurationChanged() when durationChanged != null:
return durationChanged(_that.duration);case _PlayerStateChanged() when playerStateChanged != null:
return playerStateChanged(_that.playing,_that.buffering,_that.completed);case _PlaybackFailed() when playbackFailed != null:
return playbackFailed();case _WaveformLoaded() when waveformLoaded != null:
return waveformLoaded(_that.songId,_that.peaks);case _:
  return null;

}
}

}

/// @nodoc


class _PlayPause implements PlayEvent {
  const _PlayPause();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayPause);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.playPause()';
}


}




/// @nodoc


class _Next implements PlayEvent {
  const _Next();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Next);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.next()';
}


}




/// @nodoc


class _Previous implements PlayEvent {
  const _Previous();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Previous);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.previous()';
}


}




/// @nodoc


class _Seek implements PlayEvent {
  const _Seek(this.position);
  

 final  double position;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeekCopyWith<_Seek> get copyWith => __$SeekCopyWithImpl<_Seek>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seek&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'PlayEvent.seek(position: $position)';
}


}

/// @nodoc
abstract mixin class _$SeekCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory _$SeekCopyWith(_Seek value, $Res Function(_Seek) _then) = __$SeekCopyWithImpl;
@useResult
$Res call({
 double position
});




}
/// @nodoc
class __$SeekCopyWithImpl<$Res>
    implements _$SeekCopyWith<$Res> {
  __$SeekCopyWithImpl(this._self, this._then);

  final _Seek _self;
  final $Res Function(_Seek) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_Seek(
null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _ToggleShuffle implements PlayEvent {
  const _ToggleShuffle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleShuffle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.toggleShuffle()';
}


}




/// @nodoc


class _ToggleRepeat implements PlayEvent {
  const _ToggleRepeat();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleRepeat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.toggleRepeat()';
}


}




/// @nodoc


class _ToggleFavorite implements PlayEvent {
  const _ToggleFavorite();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleFavorite);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.toggleFavorite()';
}


}




/// @nodoc


class _PlaySong implements PlayEvent {
  const _PlaySong({required this.song, final  List<Song> queue = const <Song>[]}): _queue = queue;
  

 final  Song song;
 final  List<Song> _queue;
@JsonKey() List<Song> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}


/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaySongCopyWith<_PlaySong> get copyWith => __$PlaySongCopyWithImpl<_PlaySong>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaySong&&(identical(other.song, song) || other.song == song)&&const DeepCollectionEquality().equals(other._queue, _queue));
}


@override
int get hashCode => Object.hash(runtimeType,song,const DeepCollectionEquality().hash(_queue));

@override
String toString() {
  return 'PlayEvent.playSong(song: $song, queue: $queue)';
}


}

/// @nodoc
abstract mixin class _$PlaySongCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory _$PlaySongCopyWith(_PlaySong value, $Res Function(_PlaySong) _then) = __$PlaySongCopyWithImpl;
@useResult
$Res call({
 Song song, List<Song> queue
});




}
/// @nodoc
class __$PlaySongCopyWithImpl<$Res>
    implements _$PlaySongCopyWith<$Res> {
  __$PlaySongCopyWithImpl(this._self, this._then);

  final _PlaySong _self;
  final $Res Function(_PlaySong) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? song = null,Object? queue = null,}) {
  return _then(_PlaySong(
song: null == song ? _self.song : song // ignore: cast_nullable_to_non_nullable
as Song,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<Song>,
  ));
}


}

/// @nodoc


class _Stop implements PlayEvent {
  const _Stop();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stop);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.stop()';
}


}




/// @nodoc


class _UpdatePosition implements PlayEvent {
  const _UpdatePosition(this.position);
  

 final  double position;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePositionCopyWith<_UpdatePosition> get copyWith => __$UpdatePositionCopyWithImpl<_UpdatePosition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePosition&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,position);

@override
String toString() {
  return 'PlayEvent.updatePosition(position: $position)';
}


}

/// @nodoc
abstract mixin class _$UpdatePositionCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory _$UpdatePositionCopyWith(_UpdatePosition value, $Res Function(_UpdatePosition) _then) = __$UpdatePositionCopyWithImpl;
@useResult
$Res call({
 double position
});




}
/// @nodoc
class __$UpdatePositionCopyWithImpl<$Res>
    implements _$UpdatePositionCopyWith<$Res> {
  __$UpdatePositionCopyWithImpl(this._self, this._then);

  final _UpdatePosition _self;
  final $Res Function(_UpdatePosition) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? position = null,}) {
  return _then(_UpdatePosition(
null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _DurationChanged implements PlayEvent {
  const _DurationChanged(this.duration);
  

 final  double duration;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DurationChangedCopyWith<_DurationChanged> get copyWith => __$DurationChangedCopyWithImpl<_DurationChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DurationChanged&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,duration);

@override
String toString() {
  return 'PlayEvent.durationChanged(duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$DurationChangedCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory _$DurationChangedCopyWith(_DurationChanged value, $Res Function(_DurationChanged) _then) = __$DurationChangedCopyWithImpl;
@useResult
$Res call({
 double duration
});




}
/// @nodoc
class __$DurationChangedCopyWithImpl<$Res>
    implements _$DurationChangedCopyWith<$Res> {
  __$DurationChangedCopyWithImpl(this._self, this._then);

  final _DurationChanged _self;
  final $Res Function(_DurationChanged) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? duration = null,}) {
  return _then(_DurationChanged(
null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _PlayerStateChanged implements PlayEvent {
  const _PlayerStateChanged({required this.playing, required this.buffering, required this.completed});
  

 final  bool playing;
 final  bool buffering;
 final  bool completed;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStateChangedCopyWith<_PlayerStateChanged> get copyWith => __$PlayerStateChangedCopyWithImpl<_PlayerStateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerStateChanged&&(identical(other.playing, playing) || other.playing == playing)&&(identical(other.buffering, buffering) || other.buffering == buffering)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,playing,buffering,completed);

@override
String toString() {
  return 'PlayEvent.playerStateChanged(playing: $playing, buffering: $buffering, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$PlayerStateChangedCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory _$PlayerStateChangedCopyWith(_PlayerStateChanged value, $Res Function(_PlayerStateChanged) _then) = __$PlayerStateChangedCopyWithImpl;
@useResult
$Res call({
 bool playing, bool buffering, bool completed
});




}
/// @nodoc
class __$PlayerStateChangedCopyWithImpl<$Res>
    implements _$PlayerStateChangedCopyWith<$Res> {
  __$PlayerStateChangedCopyWithImpl(this._self, this._then);

  final _PlayerStateChanged _self;
  final $Res Function(_PlayerStateChanged) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? playing = null,Object? buffering = null,Object? completed = null,}) {
  return _then(_PlayerStateChanged(
playing: null == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as bool,buffering: null == buffering ? _self.buffering : buffering // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _PlaybackFailed implements PlayEvent {
  const _PlaybackFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayEvent.playbackFailed()';
}


}




/// @nodoc


class _WaveformLoaded implements PlayEvent {
  const _WaveformLoaded(this.songId, final  List<double> peaks): _peaks = peaks;
  

 final  String songId;
 final  List<double> _peaks;
 List<double> get peaks {
  if (_peaks is EqualUnmodifiableListView) return _peaks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_peaks);
}


/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaveformLoadedCopyWith<_WaveformLoaded> get copyWith => __$WaveformLoadedCopyWithImpl<_WaveformLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaveformLoaded&&(identical(other.songId, songId) || other.songId == songId)&&const DeepCollectionEquality().equals(other._peaks, _peaks));
}


@override
int get hashCode => Object.hash(runtimeType,songId,const DeepCollectionEquality().hash(_peaks));

@override
String toString() {
  return 'PlayEvent.waveformLoaded(songId: $songId, peaks: $peaks)';
}


}

/// @nodoc
abstract mixin class _$WaveformLoadedCopyWith<$Res> implements $PlayEventCopyWith<$Res> {
  factory _$WaveformLoadedCopyWith(_WaveformLoaded value, $Res Function(_WaveformLoaded) _then) = __$WaveformLoadedCopyWithImpl;
@useResult
$Res call({
 String songId, List<double> peaks
});




}
/// @nodoc
class __$WaveformLoadedCopyWithImpl<$Res>
    implements _$WaveformLoadedCopyWith<$Res> {
  __$WaveformLoadedCopyWithImpl(this._self, this._then);

  final _WaveformLoaded _self;
  final $Res Function(_WaveformLoaded) _then;

/// Create a copy of PlayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? songId = null,Object? peaks = null,}) {
  return _then(_WaveformLoaded(
null == songId ? _self.songId : songId // ignore: cast_nullable_to_non_nullable
as String,null == peaks ? _self._peaks : peaks // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

/// @nodoc
mixin _$PlayState {

 bool get isPlaying; bool get isLoading; double get currentPosition; double get totalDuration; bool get isShuffle; bool get isRepeat; bool get isFavorite; Song? get song; List<Song> get queue;/// Peaks of the current song's audio; empty until loaded or unavailable.
 List<double> get waveform; String? get error;
/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayStateCopyWith<PlayState> get copyWith => _$PlayStateCopyWithImpl<PlayState>(this as PlayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.isShuffle, isShuffle) || other.isShuffle == isShuffle)&&(identical(other.isRepeat, isRepeat) || other.isRepeat == isRepeat)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.song, song) || other.song == song)&&const DeepCollectionEquality().equals(other.queue, queue)&&const DeepCollectionEquality().equals(other.waveform, waveform)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,isLoading,currentPosition,totalDuration,isShuffle,isRepeat,isFavorite,song,const DeepCollectionEquality().hash(queue),const DeepCollectionEquality().hash(waveform),error);

@override
String toString() {
  return 'PlayState(isPlaying: $isPlaying, isLoading: $isLoading, currentPosition: $currentPosition, totalDuration: $totalDuration, isShuffle: $isShuffle, isRepeat: $isRepeat, isFavorite: $isFavorite, song: $song, queue: $queue, waveform: $waveform, error: $error)';
}


}

/// @nodoc
abstract mixin class $PlayStateCopyWith<$Res>  {
  factory $PlayStateCopyWith(PlayState value, $Res Function(PlayState) _then) = _$PlayStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, bool isLoading, double currentPosition, double totalDuration, bool isShuffle, bool isRepeat, bool isFavorite, Song? song, List<Song> queue, List<double> waveform, String? error
});




}
/// @nodoc
class _$PlayStateCopyWithImpl<$Res>
    implements $PlayStateCopyWith<$Res> {
  _$PlayStateCopyWithImpl(this._self, this._then);

  final PlayState _self;
  final $Res Function(PlayState) _then;

/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? isLoading = null,Object? currentPosition = null,Object? totalDuration = null,Object? isShuffle = null,Object? isRepeat = null,Object? isFavorite = null,Object? song = freezed,Object? queue = null,Object? waveform = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as double,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as double,isShuffle: null == isShuffle ? _self.isShuffle : isShuffle // ignore: cast_nullable_to_non_nullable
as bool,isRepeat: null == isRepeat ? _self.isRepeat : isRepeat // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,song: freezed == song ? _self.song : song // ignore: cast_nullable_to_non_nullable
as Song?,queue: null == queue ? _self.queue : queue // ignore: cast_nullable_to_non_nullable
as List<Song>,waveform: null == waveform ? _self.waveform : waveform // ignore: cast_nullable_to_non_nullable
as List<double>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayState].
extension PlayStatePatterns on PlayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayState value)  $default,){
final _that = this;
switch (_that) {
case _PlayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayState value)?  $default,){
final _that = this;
switch (_that) {
case _PlayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  bool isLoading,  double currentPosition,  double totalDuration,  bool isShuffle,  bool isRepeat,  bool isFavorite,  Song? song,  List<Song> queue,  List<double> waveform,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayState() when $default != null:
return $default(_that.isPlaying,_that.isLoading,_that.currentPosition,_that.totalDuration,_that.isShuffle,_that.isRepeat,_that.isFavorite,_that.song,_that.queue,_that.waveform,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  bool isLoading,  double currentPosition,  double totalDuration,  bool isShuffle,  bool isRepeat,  bool isFavorite,  Song? song,  List<Song> queue,  List<double> waveform,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PlayState():
return $default(_that.isPlaying,_that.isLoading,_that.currentPosition,_that.totalDuration,_that.isShuffle,_that.isRepeat,_that.isFavorite,_that.song,_that.queue,_that.waveform,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  bool isLoading,  double currentPosition,  double totalDuration,  bool isShuffle,  bool isRepeat,  bool isFavorite,  Song? song,  List<Song> queue,  List<double> waveform,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PlayState() when $default != null:
return $default(_that.isPlaying,_that.isLoading,_that.currentPosition,_that.totalDuration,_that.isShuffle,_that.isRepeat,_that.isFavorite,_that.song,_that.queue,_that.waveform,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PlayState extends PlayState {
  const _PlayState({this.isPlaying = false, this.isLoading = false, this.currentPosition = 0.0, this.totalDuration = 1.0, this.isShuffle = false, this.isRepeat = false, this.isFavorite = false, this.song, final  List<Song> queue = const <Song>[], final  List<double> waveform = const <double>[], this.error}): _queue = queue,_waveform = waveform,super._();
  

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  double currentPosition;
@override@JsonKey() final  double totalDuration;
@override@JsonKey() final  bool isShuffle;
@override@JsonKey() final  bool isRepeat;
@override@JsonKey() final  bool isFavorite;
@override final  Song? song;
 final  List<Song> _queue;
@override@JsonKey() List<Song> get queue {
  if (_queue is EqualUnmodifiableListView) return _queue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queue);
}

/// Peaks of the current song's audio; empty until loaded or unavailable.
 final  List<double> _waveform;
/// Peaks of the current song's audio; empty until loaded or unavailable.
@override@JsonKey() List<double> get waveform {
  if (_waveform is EqualUnmodifiableListView) return _waveform;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waveform);
}

@override final  String? error;

/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayStateCopyWith<_PlayState> get copyWith => __$PlayStateCopyWithImpl<_PlayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.isShuffle, isShuffle) || other.isShuffle == isShuffle)&&(identical(other.isRepeat, isRepeat) || other.isRepeat == isRepeat)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.song, song) || other.song == song)&&const DeepCollectionEquality().equals(other._queue, _queue)&&const DeepCollectionEquality().equals(other._waveform, _waveform)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,isLoading,currentPosition,totalDuration,isShuffle,isRepeat,isFavorite,song,const DeepCollectionEquality().hash(_queue),const DeepCollectionEquality().hash(_waveform),error);

@override
String toString() {
  return 'PlayState(isPlaying: $isPlaying, isLoading: $isLoading, currentPosition: $currentPosition, totalDuration: $totalDuration, isShuffle: $isShuffle, isRepeat: $isRepeat, isFavorite: $isFavorite, song: $song, queue: $queue, waveform: $waveform, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PlayStateCopyWith<$Res> implements $PlayStateCopyWith<$Res> {
  factory _$PlayStateCopyWith(_PlayState value, $Res Function(_PlayState) _then) = __$PlayStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, bool isLoading, double currentPosition, double totalDuration, bool isShuffle, bool isRepeat, bool isFavorite, Song? song, List<Song> queue, List<double> waveform, String? error
});




}
/// @nodoc
class __$PlayStateCopyWithImpl<$Res>
    implements _$PlayStateCopyWith<$Res> {
  __$PlayStateCopyWithImpl(this._self, this._then);

  final _PlayState _self;
  final $Res Function(_PlayState) _then;

/// Create a copy of PlayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? isLoading = null,Object? currentPosition = null,Object? totalDuration = null,Object? isShuffle = null,Object? isRepeat = null,Object? isFavorite = null,Object? song = freezed,Object? queue = null,Object? waveform = null,Object? error = freezed,}) {
  return _then(_PlayState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as double,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as double,isShuffle: null == isShuffle ? _self.isShuffle : isShuffle // ignore: cast_nullable_to_non_nullable
as bool,isRepeat: null == isRepeat ? _self.isRepeat : isRepeat // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,song: freezed == song ? _self.song : song // ignore: cast_nullable_to_non_nullable
as Song?,queue: null == queue ? _self._queue : queue // ignore: cast_nullable_to_non_nullable
as List<Song>,waveform: null == waveform ? _self._waveform : waveform // ignore: cast_nullable_to_non_nullable
as List<double>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

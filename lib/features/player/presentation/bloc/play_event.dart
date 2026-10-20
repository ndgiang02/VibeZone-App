part of 'play_bloc.dart';

@freezed
class PlayEvent with _$PlayEvent {
  const factory PlayEvent.playPause() = _PlayPause;
  const factory PlayEvent.next() = _Next;
  const factory PlayEvent.previous() = _Previous;
  const factory PlayEvent.seek(double position) = _Seek;
  const factory PlayEvent.toggleShuffle() = _ToggleShuffle;
  const factory PlayEvent.toggleRepeat() = _ToggleRepeat;
  const factory PlayEvent.toggleFavorite() = _ToggleFavorite;

  /// Starts [song]; [queue] is the list next/previous walk through.
  const factory PlayEvent.playSong({
    required Song song,
    @Default(<Song>[]) List<Song> queue,
  }) = _PlaySong;
  const factory PlayEvent.stop() = _Stop;
  const factory PlayEvent.updatePosition(double position) = _UpdatePosition;
}

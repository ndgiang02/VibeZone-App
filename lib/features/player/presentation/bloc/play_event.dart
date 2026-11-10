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

  // Reported by the audio player.
  const factory PlayEvent.updatePosition(double position) = _UpdatePosition;
  const factory PlayEvent.durationChanged(double duration) = _DurationChanged;
  const factory PlayEvent.playerStateChanged({
    required bool playing,
    required bool buffering,
    required bool completed,
  }) = _PlayerStateChanged;
  const factory PlayEvent.playbackFailed() = _PlaybackFailed;

  const factory PlayEvent.waveformLoaded(String songId, List<double> peaks) =
      _WaveformLoaded;
}

part of 'play_bloc.dart';

@freezed
abstract class PlayState with _$PlayState {
  const PlayState._();

  const factory PlayState({
    @Default(false) bool isPlaying,
    @Default(false) bool isLoading,
    @Default(0.0) double currentPosition,
    @Default(1.0) double totalDuration,
    @Default(false) bool isShuffle,
    @Default(false) bool isRepeat,
    @Default(false) bool isFavorite,
    Song? song,
    @Default(<Song>[]) List<Song> queue,

    /// Peaks of the current song's audio; empty until loaded or unavailable.
    @Default(<double>[]) List<double> waveform,
    String? error,
  }) = _PlayState;

  bool get hasSong => song != null;

  double get progress =>
      totalDuration > 0 ? (currentPosition / totalDuration).clamp(0.0, 1.0) : 0;
}

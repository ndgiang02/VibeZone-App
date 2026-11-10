import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/features/player/data/datasources/player_remote_data_source.dart';

part 'play_bloc.freezed.dart';
part 'play_event.dart';
part 'play_state.dart';

/// App-wide playback state, shared by the mini player and the full player.
/// Audio is streamed with just_audio from the URL the API hands out.
class PlayBloc extends Bloc<PlayEvent, PlayState> {
  final PlayerRemoteDataSource _remote;
  final AudioPlayer _player;
  final _subscriptions = <StreamSubscription<Object?>>[];
  final _random = Random();

  /// The loaded source is unusable (failed to load, or its token expired):
  /// the next play fetches a fresh stream URL.
  bool _needsReload = false;

  /// Song whose end was already handled; the player can report it twice.
  String? _completedSongId;

  PlayBloc(this._remote, {AudioPlayer? player})
    : _player = player ?? AudioPlayer(),
      super(const PlayState()) {
    on<_PlayPause>(_onPlayPause);
    on<_Next>(_onNext);
    on<_Previous>(_onPrevious);
    on<_Seek>(_onSeek);
    on<_ToggleShuffle>(_onToggleShuffle);
    on<_ToggleRepeat>(_onToggleRepeat);
    on<_ToggleFavorite>(_onToggleFavorite);
    on<_PlaySong>(_onPlaySong);
    on<_Stop>(_onStop);
    on<_UpdatePosition>(_onUpdatePosition);
    on<_DurationChanged>(_onDurationChanged);
    on<_PlayerStateChanged>(_onPlayerStateChanged);
    on<_PlaybackFailed>(_onPlaybackFailed);
    on<_WaveformLoaded>(_onWaveformLoaded);

    _subscriptions.addAll([
      _player.positionStream.listen(
        (position) =>
            add(PlayEvent.updatePosition(position.inMilliseconds / 1000)),
      ),
      _player.durationStream.listen((duration) {
        if (duration != null) {
          add(PlayEvent.durationChanged(duration.inMilliseconds / 1000));
        }
      }),
      _player.playerStateStream.listen(
        (s) => add(
          PlayEvent.playerStateChanged(
            playing: s.playing,
            buffering:
                s.processingState == ProcessingState.loading ||
                s.processingState == ProcessingState.buffering,
            completed: s.processingState == ProcessingState.completed,
          ),
        ),
      ),
      // Network errors and expired stream tokens surface here.
      _player.playbackEventStream.listen(
        (_) {},
        onError: (Object _, StackTrace _) =>
            add(const PlayEvent.playbackFailed()),
      ),
    ]);
  }

  Future<void> _onPlayPause(_PlayPause event, Emitter<PlayState> emit) async {
    final song = state.song;
    if (song == null) return;
    if (_player.playing) {
      await _player.pause();
    } else if (_needsReload) {
      await _load(song, emit, from: state.currentPosition);
    } else {
      // play() completes only when playback pauses or stops again.
      unawaited(_player.play());
    }
  }

  Future<void> _onNext(_Next event, Emitter<PlayState> emit) async {
    final queue = state.queue;
    if (queue.isEmpty) return;
    final index = _currentIndex;
    final nextIndex = state.isShuffle && queue.length > 1
        ? (index + 1 + _random.nextInt(queue.length - 1)) % queue.length
        : (index + 1) % queue.length;
    await _play(queue[nextIndex], emit);
  }

  Future<void> _onPrevious(_Previous event, Emitter<PlayState> emit) async {
    final queue = state.queue;
    if (queue.isEmpty) return;
    // Like most players: restart the song unless we're near its start.
    if (state.currentPosition > 3) {
      emit(state.copyWith(currentPosition: 0));
      await _player.seek(Duration.zero);
      return;
    }
    await _play(queue[(_currentIndex - 1 + queue.length) % queue.length], emit);
  }

  Future<void> _onSeek(_Seek event, Emitter<PlayState> emit) async {
    emit(state.copyWith(currentPosition: event.position));
    await _player.seek(Duration(milliseconds: (event.position * 1000).round()));
  }

  void _onToggleShuffle(_ToggleShuffle event, Emitter<PlayState> emit) {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }

  Future<void> _onToggleRepeat(
    _ToggleRepeat event,
    Emitter<PlayState> emit,
  ) async {
    final isRepeat = !state.isRepeat;
    emit(state.copyWith(isRepeat: isRepeat));
    await _player.setLoopMode(isRepeat ? LoopMode.one : LoopMode.off);
  }

  void _onToggleFavorite(_ToggleFavorite event, Emitter<PlayState> emit) {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }

  Future<void> _onPlaySong(_PlaySong event, Emitter<PlayState> emit) async {
    final queue = event.queue.isEmpty ? [event.song] : event.queue;
    emit(state.copyWith(queue: queue));
    await _play(event.song, emit);
  }

  Future<void> _onStop(_Stop event, Emitter<PlayState> emit) async {
    emit(PlayState(isShuffle: state.isShuffle, isRepeat: state.isRepeat));
    await _player.stop();
  }

  void _onUpdatePosition(_UpdatePosition event, Emitter<PlayState> emit) {
    if (!state.hasSong) return;
    emit(state.copyWith(currentPosition: event.position));
  }

  void _onDurationChanged(_DurationChanged event, Emitter<PlayState> emit) {
    if (!state.hasSong || event.duration <= 0) return;
    emit(state.copyWith(totalDuration: event.duration));
  }

  Future<void> _onPlayerStateChanged(
    _PlayerStateChanged event,
    Emitter<PlayState> emit,
  ) async {
    if (!state.hasSong) return;
    emit(state.copyWith(isPlaying: event.playing, isLoading: event.buffering));
    // With repeat on the loop mode replays the song, so this is never hit.
    if (event.completed && _completedSongId != state.song?.id) {
      _completedSongId = state.song?.id;
      await _onNext(const _Next(), emit);
    }
  }

  void _onPlaybackFailed(_PlaybackFailed event, Emitter<PlayState> emit) {
    _needsReload = true;
    emit(state.copyWith(isPlaying: false, isLoading: false));
  }

  void _onWaveformLoaded(_WaveformLoaded event, Emitter<PlayState> emit) {
    // Ignore a late response for a song that is no longer playing.
    if (event.songId != state.song?.id) return;
    emit(state.copyWith(waveform: event.peaks));
  }

  int get _currentIndex {
    final index = state.queue.indexWhere((song) => song.id == state.song?.id);
    return index < 0 ? 0 : index;
  }

  Future<void> _play(Song song, Emitter<PlayState> emit) async {
    emit(
      state.copyWith(
        song: song,
        totalDuration: song.duration.toDouble(),
        currentPosition: 0,
        isFavorite: false,
        isPlaying: true,
        waveform: const [],
        error: null,
      ),
    );
    _completedSongId = null;
    _loadWaveform(song.id);
    await _load(song, emit);
  }

  /// Fetches a fresh stream URL for [song] and starts it at [from] seconds.
  Future<void> _load(
    Song song,
    Emitter<PlayState> emit, {
    double from = 0,
  }) async {
    emit(state.copyWith(isLoading: true, isPlaying: true));
    try {
      final url = await _remote.getStreamUrl(song.id);
      if (state.song?.id != song.id) return;
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(url),
          // Shown on the lock screen and in the notification.
          tag: MediaItem(
            id: song.id,
            title: song.title,
            artist: song.artist,
            artUri: song.imageUrl.isEmpty ? null : Uri.tryParse(song.imageUrl),
            duration: song.duration > 0
                ? Duration(seconds: song.duration)
                : null,
          ),
        ),
        initialPosition: Duration(milliseconds: (from * 1000).round()),
      );
      if (state.song?.id != song.id) return;
      _needsReload = false;
      unawaited(_player.play());
    } catch (e) {
      // Switching song while loading interrupts the old load: not an error.
      if (state.song?.id != song.id) return;
      _needsReload = true;
      emit(
        state.copyWith(isPlaying: false, isLoading: false, error: e.toString()),
      );
    }
  }

  Future<void> _loadWaveform(String songId) async {
    try {
      final peaks = await _remote.getWaveform(songId);
      if (!isClosed) add(PlayEvent.waveformLoaded(songId, peaks));
    } catch (_) {
      // Still processing or not visible: the artwork is shown without waves.
    }
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    await _player.dispose();
    return super.close();
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/common/entities/song.dart';

part 'play_bloc.freezed.dart';
part 'play_event.dart';
part 'play_state.dart';

/// App-wide playback state, shared by the mini player and the full player.
class PlayBloc extends Bloc<PlayEvent, PlayState> {
  Timer? _positionTimer;
  final _random = Random();

  PlayBloc() : super(const PlayState()) {
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
  }

  void _onPlayPause(_PlayPause event, Emitter<PlayState> emit) {
    if (!state.hasSong) return;
    final isPlaying = !state.isPlaying;
    emit(state.copyWith(isPlaying: isPlaying));
    isPlaying ? _startPositionTimer() : _stopPositionTimer();
  }

  void _onNext(_Next event, Emitter<PlayState> emit) {
    final queue = state.queue;
    if (queue.isEmpty) return;
    final index = _currentIndex;
    final nextIndex = state.isShuffle && queue.length > 1
        ? (index + 1 + _random.nextInt(queue.length - 1)) % queue.length
        : (index + 1) % queue.length;
    _playAt(nextIndex, emit);
  }

  void _onPrevious(_Previous event, Emitter<PlayState> emit) {
    final queue = state.queue;
    if (queue.isEmpty) return;
    // Like most players: restart the song unless we're near its start.
    if (state.currentPosition > 3) {
      emit(state.copyWith(currentPosition: 0));
      return;
    }
    _playAt((_currentIndex - 1 + queue.length) % queue.length, emit);
  }

  void _onSeek(_Seek event, Emitter<PlayState> emit) {
    emit(state.copyWith(currentPosition: event.position));
  }

  void _onToggleShuffle(_ToggleShuffle event, Emitter<PlayState> emit) {
    emit(state.copyWith(isShuffle: !state.isShuffle));
  }

  void _onToggleRepeat(_ToggleRepeat event, Emitter<PlayState> emit) {
    emit(state.copyWith(isRepeat: !state.isRepeat));
  }

  void _onToggleFavorite(_ToggleFavorite event, Emitter<PlayState> emit) {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }

  void _onPlaySong(_PlaySong event, Emitter<PlayState> emit) {
    final queue = event.queue.isEmpty ? [event.song] : event.queue;
    emit(state.copyWith(queue: queue));
    _play(event.song, emit);
  }

  void _onStop(_Stop event, Emitter<PlayState> emit) {
    _stopPositionTimer();
    emit(PlayState(isShuffle: state.isShuffle, isRepeat: state.isRepeat));
  }

  void _onUpdatePosition(_UpdatePosition event, Emitter<PlayState> emit) {
    emit(state.copyWith(currentPosition: event.position));
  }

  int get _currentIndex {
    final index = state.queue.indexWhere((song) => song.id == state.song?.id);
    return index < 0 ? 0 : index;
  }

  void _playAt(int index, Emitter<PlayState> emit) {
    _play(state.queue[index], emit);
  }

  void _play(Song song, Emitter<PlayState> emit) {
    emit(
      state.copyWith(
        song: song,
        totalDuration: song.duration.toDouble(),
        currentPosition: 0,
        isFavorite: false,
        isPlaying: true,
      ),
    );
    _startPositionTimer();
  }

  void _startPositionTimer() {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.currentPosition + 1 < state.totalDuration) {
        add(PlayEvent.updatePosition(state.currentPosition + 1));
      } else if (state.isRepeat) {
        add(const PlayEvent.updatePosition(0));
      } else {
        add(const PlayEvent.next());
      }
    });
  }

  void _stopPositionTimer() {
    _positionTimer?.cancel();
  }

  @override
  Future<void> close() {
    _positionTimer?.cancel();
    return super.close();
  }
}

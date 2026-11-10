import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';
import 'package:vibezone/features/trending/domain/usecases/get_trending_songs_usecase.dart';

part 'trending_bloc.freezed.dart';
part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingSongsUseCase _getTrendingSongs;

  TrendingBloc(this._getTrendingSongs) : super(const TrendingState()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(status: PageState.loading));
      await _loadFirstPage(emit);
    });
    // Keeps the current chart on screen while the pull-to-refresh spins.
    on<_Refreshed>((event, emit) => _loadFirstPage(emit));
    on<_LoadMore>(_onLoadMore);
  }

  Future<void> _loadFirstPage(Emitter<TrendingState> emit) async {
    final result = await _getTrendingSongs(1);
    result.fold(
      (_) => emit(state.copyWith(status: PageState.error)),
      (page) => emit(
        TrendingState(
          status: page.songs.isEmpty ? PageState.empty : PageState.success,
          songs: page.songs,
          page: 1,
          hasMore: page.hasMore,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<TrendingState> emit) async {
    if (!state.hasMore || state.status != PageState.success) return;
    emit(state.copyWith(status: PageState.loadMore));
    final result = await _getTrendingSongs(state.page + 1);
    result.fold(
      // Keep what is shown; scrolling to the end again retries.
      (_) => emit(state.copyWith(status: PageState.success)),
      (page) => emit(
        state.copyWith(
          status: PageState.success,
          songs: [...state.songs, ...page.songs],
          page: state.page + 1,
          hasMore: page.hasMore,
        ),
      ),
    );
  }
}

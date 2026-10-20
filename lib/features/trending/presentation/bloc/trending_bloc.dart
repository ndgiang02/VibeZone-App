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
    on<_Started>((event, emit) => _load(state.period, emit));
    on<_ChangePeriod>((event, emit) async {
      if (event.period == state.period && state.songs.isNotEmpty) return;
      await _load(event.period, emit);
    });
  }

  Future<void> _load(TrendingPeriod period, Emitter<TrendingState> emit) async {
    emit(state.copyWith(period: period, status: PageState.loading));
    final result = await _getTrendingSongs(period);
    result.fold(
      (failure) => emit(
        state.copyWith(status: PageState.error, errorMessage: failure.message),
      ),
      (songs) => emit(
        state.copyWith(
          status: songs.isEmpty ? PageState.empty : PageState.success,
          songs: songs,
          errorMessage: null,
        ),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/search/domain/usecases/get_genres_usecase.dart';
import 'package:vibezone/features/search/domain/usecases/recent_search_usecases.dart';
import 'package:vibezone/features/search/domain/usecases/search_songs_usecase.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static const _debounce = Duration(milliseconds: 350);

  final SearchSongsUseCase _searchSongs;
  final GetGenresUseCase _getGenres;
  final GetRecentSearchesUseCase _getRecent;
  final SaveRecentSearchUseCase _saveRecent;
  final RemoveRecentSearchUseCase _removeRecent;
  final ClearRecentSearchesUseCase _clearRecent;

  SearchBloc(
    this._searchSongs,
    this._getGenres,
    this._getRecent,
    this._saveRecent,
    this._removeRecent,
    this._clearRecent,
  ) : super(const SearchState()) {
    on<_Started>(_onStarted);
    on<_QueryChanged>(_onQueryChanged);
    on<_Submitted>(_onSubmitted);
    on<_RemoveRecent>(_onRemoveRecent);
    on<_ClearRecent>(_onClearRecent);
  }

  Future<void> _onStarted(_Started event, Emitter<SearchState> emit) async {
    final genres = await _getGenres(const NoParams());
    final recent = await _getRecent(const NoParams());
    emit(
      state.copyWith(
        genres: genres.getOrElse(() => []),
        recentSearches: recent.getOrElse(() => []),
      ),
    );
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query;
    if (query.trim().isEmpty) {
      emit(state.copyWith(query: '', results: [], status: PageState.init));
      return;
    }
    emit(state.copyWith(query: query, status: PageState.loading));
    // Simple debounce: drop this search if the user kept typing.
    await Future.delayed(_debounce);
    if (state.query != query) return;
    await _search(query, emit);
  }

  Future<void> _onSubmitted(_Submitted event, Emitter<SearchState> emit) async {
    final query = event.query.trim();
    if (query.isEmpty) return;
    emit(state.copyWith(query: query, status: PageState.loading));
    final recent = await _saveRecent(query);
    emit(
      state.copyWith(
        recentSearches: recent.getOrElse(() => state.recentSearches),
      ),
    );
    await _search(query, emit);
  }

  Future<void> _onRemoveRecent(
    _RemoveRecent event,
    Emitter<SearchState> emit,
  ) async {
    final recent = await _removeRecent(event.query);
    emit(
      state.copyWith(
        recentSearches: recent.getOrElse(() => state.recentSearches),
      ),
    );
  }

  Future<void> _onClearRecent(
    _ClearRecent event,
    Emitter<SearchState> emit,
  ) async {
    await _clearRecent(const NoParams());
    emit(state.copyWith(recentSearches: []));
  }

  Future<void> _search(String query, Emitter<SearchState> emit) async {
    final result = await _searchSongs(query);
    if (state.query != query) return;
    result.fold(
      (failure) => emit(
        state.copyWith(status: PageState.error, errorMessage: failure.message),
      ),
      (songs) => emit(
        state.copyWith(
          results: songs,
          status: songs.isEmpty ? PageState.empty : PageState.success,
        ),
      ),
    );
  }
}

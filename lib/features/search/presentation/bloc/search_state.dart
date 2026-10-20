part of 'search_bloc.dart';

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default(PageState.init) PageState status,
    @Default('') String query,
    @Default(<Song>[]) List<Song> results,
    @Default(<String>[]) List<String> genres,
    @Default(<String>[]) List<String> recentSearches,
    String? errorMessage,
  }) = _SearchState;

  bool get isSearching => query.trim().isNotEmpty;
}

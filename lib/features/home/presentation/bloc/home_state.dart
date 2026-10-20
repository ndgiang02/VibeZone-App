part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(PageState.init) PageState status,
    HomeData? data,
    String? selectedGenre,
    String? errorMessage,
  }) = _HomeState;

  List<Song> get popularSongs {
    final songs = data?.popular ?? const <Song>[];
    final filtered = selectedGenre == null
        ? songs
        : songs.where((song) => song.genre == selectedGenre);
    return filtered.take(10).toList();
  }
}

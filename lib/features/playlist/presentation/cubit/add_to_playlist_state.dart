part of 'add_to_playlist_cubit.dart';

@freezed
abstract class AddToPlaylistState with _$AddToPlaylistState {
  const factory AddToPlaylistState({
    @Default(PageState.init) PageState status,
    @Default(<MyPlaylist>[]) List<MyPlaylist> playlists,

    /// Playlists with a request in flight.
    @Default(<String>{}) Set<String> busyIds,
    @Default(false) bool isCreating,

    /// Error code of the last failed request.
    String? error,
  }) = _AddToPlaylistState;
}

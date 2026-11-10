import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/features/playlist/domain/entities/my_playlist.dart';
import 'package:vibezone/features/playlist/domain/usecases/playlist_usecases.dart';

part 'add_to_playlist_cubit.freezed.dart';
part 'add_to_playlist_state.dart';

/// Adds the track [trackId] to the user's playlists, or takes it out.
class AddToPlaylistCubit extends Cubit<AddToPlaylistState> {
  final String trackId;
  final GetMyPlaylistsUseCase _getMyPlaylists;
  final CreatePlaylistUseCase _createPlaylist;
  final AddTrackToPlaylistUseCase _addTrack;
  final RemoveTrackFromPlaylistUseCase _removeTrack;

  AddToPlaylistCubit(
    this.trackId,
    this._getMyPlaylists,
    this._createPlaylist,
    this._addTrack,
    this._removeTrack,
  ) : super(const AddToPlaylistState());

  Future<void> load() async {
    emit(state.copyWith(status: PageState.loading, error: null));
    final result = await _getMyPlaylists(trackId);
    result.fold(
      (failure) =>
          emit(state.copyWith(status: PageState.error, error: failure.message)),
      (playlists) => emit(
        state.copyWith(
          status: playlists.isEmpty ? PageState.empty : PageState.success,
          playlists: playlists,
        ),
      ),
    );
  }

  /// Updates the list right away and rolls back if the request fails.
  Future<void> toggle(MyPlaylist playlist) async {
    if (state.busyIds.contains(playlist.id)) return;
    final adding = !playlist.containsTrack;
    _replace(
      playlist.copyWith(
        containsTrack: adding,
        trackCount: playlist.trackCount + (adding ? 1 : -1),
      ),
      busy: true,
    );
    final params = PlaylistTrackParams(
      playlistId: playlist.id,
      trackId: trackId,
    );
    final result = adding
        ? await _addTrack(params)
        : await _removeTrack(params);
    result.fold(
      (failure) {
        _replace(playlist, busy: false);
        emit(state.copyWith(error: failure.message));
      },
      (_) => emit(
        state.copyWith(
          busyIds: {...state.busyIds}..remove(playlist.id),
          error: null,
        ),
      ),
    );
  }

  /// Creates a playlist that starts with the track.
  Future<void> create(String title, {required bool isPublic}) async {
    emit(state.copyWith(isCreating: true, error: null));
    final result = await _createPlaylist(
      CreatePlaylistParams(title: title, isPublic: isPublic, trackId: trackId),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isCreating: false, error: failure.message)),
      (playlist) => emit(
        state.copyWith(
          isCreating: false,
          status: PageState.success,
          playlists: [playlist, ...state.playlists],
        ),
      ),
    );
  }

  void _replace(MyPlaylist playlist, {required bool busy}) {
    final busyIds = {...state.busyIds};
    busy ? busyIds.add(playlist.id) : busyIds.remove(playlist.id);
    emit(
      state.copyWith(
        busyIds: busyIds,
        playlists: [
          for (final p in state.playlists) p.id == playlist.id ? playlist : p,
        ],
      ),
    );
  }
}

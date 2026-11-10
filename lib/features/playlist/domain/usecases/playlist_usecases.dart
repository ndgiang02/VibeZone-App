import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/playlist/domain/entities/my_playlist.dart';
import 'package:vibezone/features/playlist/domain/repositories/playlist_repository.dart';

/// The user's playlists, each flagged with whether it has the track.
class GetMyPlaylistsUseCase implements UseCase<List<MyPlaylist>, String?> {
  final PlaylistRepository repository;

  GetMyPlaylistsUseCase(this.repository);

  @override
  Future<Either<Failure, List<MyPlaylist>>> call(String? trackId) =>
      repository.getMyPlaylists(containsTrack: trackId);
}

class CreatePlaylistUseCase
    implements UseCase<MyPlaylist, CreatePlaylistParams> {
  final PlaylistRepository repository;

  CreatePlaylistUseCase(this.repository);

  @override
  Future<Either<Failure, MyPlaylist>> call(CreatePlaylistParams params) =>
      repository.createPlaylist(
        title: params.title,
        isPublic: params.isPublic,
        trackId: params.trackId,
      );
}

class CreatePlaylistParams extends Equatable {
  final String title;
  final bool isPublic;

  /// Added as the first track.
  final String? trackId;

  const CreatePlaylistParams({
    required this.title,
    this.isPublic = false,
    this.trackId,
  });

  @override
  List<Object?> get props => [title, isPublic, trackId];
}

class PlaylistTrackParams extends Equatable {
  final String playlistId;
  final String trackId;

  const PlaylistTrackParams({required this.playlistId, required this.trackId});

  @override
  List<Object?> get props => [playlistId, trackId];
}

class AddTrackToPlaylistUseCase implements UseCase<Unit, PlaylistTrackParams> {
  final PlaylistRepository repository;

  AddTrackToPlaylistUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(PlaylistTrackParams params) =>
      repository.addTrack(params.playlistId, params.trackId);
}

class RemoveTrackFromPlaylistUseCase
    implements UseCase<Unit, PlaylistTrackParams> {
  final PlaylistRepository repository;

  RemoveTrackFromPlaylistUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(PlaylistTrackParams params) =>
      repository.removeTrack(params.playlistId, params.trackId);
}

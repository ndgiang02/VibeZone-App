import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/playlist/domain/entities/my_playlist.dart';

abstract class PlaylistRepository {
  Future<Either<Failure, List<MyPlaylist>>> getMyPlaylists({
    String? containsTrack,
  });

  /// Creates a playlist, with [trackId] as its first track when given.
  Future<Either<Failure, MyPlaylist>> createPlaylist({
    required String title,
    bool isPublic = false,
    String? trackId,
  });

  Future<Either<Failure, Unit>> addTrack(String playlistId, String trackId);

  Future<Either<Failure, Unit>> removeTrack(String playlistId, String trackId);
}

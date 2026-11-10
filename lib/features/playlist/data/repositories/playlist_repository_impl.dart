import 'package:dartz/dartz.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/playlist/data/datasources/playlist_remote_data_source.dart';
import 'package:vibezone/features/playlist/domain/entities/my_playlist.dart';
import 'package:vibezone/features/playlist/domain/repositories/playlist_repository.dart';

class PlaylistRepositoryImpl implements PlaylistRepository {
  final PlaylistRemoteDataSource remote;

  PlaylistRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<MyPlaylist>>> getMyPlaylists({
    String? containsTrack,
  }) => _guard(() => remote.getMyPlaylists(containsTrack: containsTrack));

  @override
  Future<Either<Failure, MyPlaylist>> createPlaylist({
    required String title,
    bool isPublic = false,
    String? trackId,
  }) => _guard(() async {
    final playlist = await remote.createPlaylist(
      title: title.trim(),
      isPublic: isPublic,
    );
    if (trackId == null) return playlist;
    await remote.addTrack(playlist.id, trackId);
    return playlist.copyWith(containsTrack: true, trackCount: 1);
  });

  @override
  Future<Either<Failure, Unit>> addTrack(String playlistId, String trackId) =>
      _guard(() async {
        await remote.addTrack(playlistId, trackId);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> removeTrack(
    String playlistId,
    String trackId,
  ) => _guard(() async {
    await remote.removeTrack(playlistId, trackId);
    return unit;
  });

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure(unknownError));
    }
  }
}

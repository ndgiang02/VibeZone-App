import 'package:dartz/dartz.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/upload/data/datasources/upload_remote_data_source.dart';
import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';
import 'package:vibezone/features/upload/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDataSource remote;

  UploadRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Genre>>> getGenres() => _guard(remote.getGenres);

  @override
  Future<Either<Failure, ArtistProfile?>> getMyArtist() => _guard(() async {
    try {
      return await remote.getMyArtist();
    } on ServerException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  });

  /// The old access token lacks the new Artist role, so it is refreshed.
  @override
  Future<Either<Failure, ArtistProfile>> becomeArtist({
    required String slug,
    required String name,
  }) => _guard(() async {
    try {
      final artist = await remote.becomeArtist(slug: slug, name: name);
      try {
        await remote.refreshToken();
      } on ServerException {
        // The profile exists; the token gets the role at its next refresh.
      }
      return artist;
    } on ServerException catch (e) {
      if (e.statusCode == 409) throw const ServerException(slugTaken);
      rethrow;
    }
  });

  /// A cheap request first refreshes an expired token: the multipart body
  /// can't be replayed by the auth interceptor.
  @override
  Future<Either<Failure, UploadProgress>> uploadTrack(
    TrackUploadRequest request, {
    void Function(int sent, int total)? onProgress,
  }) => _guard(() async {
    await remote.getMyArtist();
    return remote.uploadTrack(request, onProgress: onProgress);
  });

  @override
  Future<Either<Failure, UploadProgress>> getUploadStatus(String trackId) =>
      _guard(() => remote.getUploadStatus(trackId));

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } on ServerException catch (e) {
      // Validation errors name the first failing field's code.
      final fieldCode = e.fieldErrors.values
          .expand((codes) => codes)
          .firstOrNull;
      return Left(ServerFailure(fieldCode ?? e.message));
    } catch (_) {
      return const Left(ServerFailure(unknownError));
    }
  }
}

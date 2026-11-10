import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';

abstract class UploadRepository {
  Future<Either<Failure, List<Genre>>> getGenres();

  /// `null` when the user hasn't created an artist profile yet.
  Future<Either<Failure, ArtistProfile?>> getMyArtist();

  Future<Either<Failure, ArtistProfile>> becomeArtist({
    required String slug,
    required String name,
  });

  Future<Either<Failure, UploadProgress>> uploadTrack(
    TrackUploadRequest request, {
    void Function(int sent, int total)? onProgress,
  });

  Future<Either<Failure, UploadProgress>> getUploadStatus(String trackId);
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';
import 'package:vibezone/features/upload/domain/repositories/upload_repository.dart';

class GetUploadGenresUseCase implements UseCase<List<Genre>, NoParams> {
  final UploadRepository repository;

  GetUploadGenresUseCase(this.repository);

  @override
  Future<Either<Failure, List<Genre>>> call(NoParams params) =>
      repository.getGenres();
}

class GetMyArtistUseCase implements UseCase<ArtistProfile?, NoParams> {
  final UploadRepository repository;

  GetMyArtistUseCase(this.repository);

  @override
  Future<Either<Failure, ArtistProfile?>> call(NoParams params) =>
      repository.getMyArtist();
}

class BecomeArtistUseCase
    implements UseCase<ArtistProfile, BecomeArtistParams> {
  final UploadRepository repository;

  BecomeArtistUseCase(this.repository);

  @override
  Future<Either<Failure, ArtistProfile>> call(BecomeArtistParams params) =>
      repository.becomeArtist(
        slug: params.slug.trim().toLowerCase(),
        name: params.name.trim(),
      );
}

class BecomeArtistParams extends Equatable {
  final String slug;
  final String name;

  const BecomeArtistParams({required this.slug, required this.name});

  @override
  List<Object?> get props => [slug, name];
}

class UploadTrackUseCase implements UseCase<UploadProgress, UploadTrackParams> {
  final UploadRepository repository;

  UploadTrackUseCase(this.repository);

  @override
  Future<Either<Failure, UploadProgress>> call(UploadTrackParams params) =>
      repository.uploadTrack(params.request, onProgress: params.onProgress);
}

class UploadTrackParams extends Equatable {
  final TrackUploadRequest request;
  final void Function(int sent, int total)? onProgress;

  const UploadTrackParams(this.request, {this.onProgress});

  @override
  List<Object?> get props => [request];
}

class GetUploadStatusUseCase implements UseCase<UploadProgress, String> {
  final UploadRepository repository;

  GetUploadStatusUseCase(this.repository);

  @override
  Future<Either<Failure, UploadProgress>> call(String trackId) =>
      repository.getUploadStatus(trackId);
}

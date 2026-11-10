import 'package:dio/dio.dart';
import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/features/upload/data/models/upload_models.dart';
import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';

abstract class UploadRemoteDataSource {
  Future<List<GenreModel>> getGenres();

  /// Throws a 404 [ServerException] when the user has none yet.
  Future<ArtistProfileModel> getMyArtist();

  /// Grants the Artist role. 409 when the slug is taken.
  Future<ArtistProfileModel> becomeArtist({
    required String slug,
    required String name,
  });

  /// Creates the track and starts processing in one request, all or nothing.
  /// [onProgress] reports the bytes sent.
  Future<UploadProgressModel> uploadTrack(
    TrackUploadRequest request, {
    void Function(int sent, int total)? onProgress,
  });

  Future<UploadProgressModel> getUploadStatus(String trackId);

  /// Gets a new access token so it carries the Artist role.
  Future<void> refreshToken();
}

class UploadRemoteDataSourceImpl implements UploadRemoteDataSource {
  final ApiClient client;

  UploadRemoteDataSourceImpl(this.client);

  @override
  Future<List<GenreModel>> getGenres() async {
    final response = await client.get(ApiEndpoints.genres, auth: false);
    return response.list(GenreModel.fromJson);
  }

  @override
  Future<ArtistProfileModel> getMyArtist() async {
    final response = await client.get(ApiEndpoints.myArtist);
    return ArtistProfileModel.fromJson(response.object);
  }

  @override
  Future<ArtistProfileModel> becomeArtist({
    required String slug,
    required String name,
  }) async {
    final response = await client.post(
      ApiEndpoints.myArtist,
      data: {'slug': slug, 'name': name, 'bio': null},
    );
    return ArtistProfileModel.fromJson(response.object);
  }

  /// The form can't be resent after a token refresh, so the caller makes
  /// sure the token is fresh first. Text fields go first, the audio last.
  @override
  Future<UploadProgressModel> uploadTrack(
    TrackUploadRequest request, {
    void Function(int sent, int total)? onProgress,
  }) async {
    final description = request.description?.trim();
    final form = FormData.fromMap({
      'title': request.title.trim(),
      'visibility': request.visibility.apiValue,
      if (request.genreSlug != null) 'genreSlug': request.genreSlug,
      if (description != null && description.isNotEmpty)
        'description': description,
      if (request.artworkPath != null)
        'artwork': await _file(request.artworkPath!),
      'audio': await _file(request.audioPath),
    });
    final response = await client.post(
      ApiEndpoints.trackUploads,
      data: form,
      onSendProgress: onProgress,
    );
    return UploadProgressModel.fromJson(response.object);
  }

  @override
  Future<UploadProgressModel> getUploadStatus(String trackId) async {
    final response = await client.get(ApiEndpoints.trackUpload(trackId));
    return UploadProgressModel.fromJson(response.object, trackId: trackId);
  }

  @override
  Future<void> refreshToken() => client.refreshToken();

  static Future<MultipartFile> _file(String path) => MultipartFile.fromFile(
    path,
    filename: path.split(RegExp(r'[/\\]')).last,
    contentType: MultipartFile.lookupMediaType(path),
  );
}

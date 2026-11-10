import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';

class GenreModel extends Genre {
  const GenreModel({required super.slug, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      GenreModel(slug: json['slug'] as String, name: json['name'] as String);
}

class ArtistProfileModel extends ArtistProfile {
  const ArtistProfileModel({
    required super.id,
    required super.slug,
    required super.name,
  });

  /// From the API's `ArtistDto`.
  factory ArtistProfileModel.fromJson(Map<String, dynamic> json) =>
      ArtistProfileModel(
        id: json['id'] as String,
        slug: json['slug'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );
}

class UploadProgressModel extends UploadProgress {
  const UploadProgressModel({
    required super.trackId,
    required super.status,
    super.errorCode,
  });

  /// From the API's upload status (`GET /api/v1/tracks/{id}/upload`).
  factory UploadProgressModel.fromJson(
    Map<String, dynamic> json, {
    String? trackId,
  }) => UploadProgressModel(
    trackId: json['trackId'] as String? ?? trackId ?? '',
    status: UploadStatus.parse(json['status'] as String?),
    errorCode: (json['errorCode'] ?? json['error']) as String?,
  );
}

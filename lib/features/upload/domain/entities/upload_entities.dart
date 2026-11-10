import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final String slug;
  final String name;

  const Genre({required this.slug, required this.name});

  @override
  List<Object?> get props => [slug, name];
}

/// The signed-in user's artist profile, needed to publish tracks.
class ArtistProfile extends Equatable {
  final String id;
  final String slug;
  final String name;

  const ArtistProfile({
    required this.id,
    required this.slug,
    required this.name,
  });

  @override
  List<Object?> get props => [id, slug, name];
}

/// Who can see a track: `Public` is listed, `Unlisted` only by link.
enum TrackVisibility {
  public('Public'),
  unlisted('Unlisted'),
  private('Private');

  final String apiValue;

  const TrackVisibility(this.apiValue);
}

class TrackUploadRequest extends Equatable {
  final String title;
  final String? description;
  final String? genreSlug;
  final TrackVisibility visibility;

  /// MP3/WAV/FLAC/AAC/M4A/OGG/Opus, ≤ 200 MB, 1 s–2 h.
  final String audioPath;

  /// Optional cover: JPEG/PNG/WebP, ≥ 200×200 px, ≤ 10 MB.
  final String? artworkPath;

  const TrackUploadRequest({
    required this.title,
    required this.visibility,
    required this.audioPath,
    this.description,
    this.genreSlug,
    this.artworkPath,
  });

  @override
  List<Object?> get props => [
    title,
    description,
    genreSlug,
    visibility,
    audioPath,
    artworkPath,
  ];
}

enum UploadStatus {
  uploaded,
  processing,
  completed,
  failed,
  cancelled;

  bool get isFinished =>
      this == completed || this == failed || this == cancelled;

  static UploadStatus parse(String? value) => UploadStatus.values.firstWhere(
    (status) => status.name == value?.toLowerCase(),
    orElse: () => UploadStatus.processing,
  );
}

/// Server-side processing of an uploaded track.
class UploadProgress extends Equatable {
  final String trackId;
  final UploadStatus status;

  /// Why processing failed, e.g. `unsupported_format`.
  final String? errorCode;

  const UploadProgress({
    required this.trackId,
    required this.status,
    this.errorCode,
  });

  @override
  List<Object?> get props => [trackId, status, errorCode];
}

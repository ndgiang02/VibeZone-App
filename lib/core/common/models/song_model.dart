import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/network/api_config.dart';
import 'package:vibezone/core/network/api_response.dart';

class SongModel extends Song {
  const SongModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.imageUrl,
    required super.duration,
    required super.genre,
    super.plays,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
    id: json['id'] as String,
    title: json['title'] as String,
    artist: json['artist'] as String,
    imageUrl: json['image_url'] as String,
    duration: json['duration'] as int,
    genre: json['genre'] as String,
    plays: (json['plays'] as int?) ?? 0,
  );

  /// From the API's `TrackDto`.
  factory SongModel.fromTrackJson(Map<String, dynamic> json) {
    final artist = json['artist'] as Map<String, dynamic>?;
    final genre = json['genre'] as Map<String, dynamic>?;
    final artwork = json['artwork'] as Map<String, dynamic>?;
    return SongModel(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: artist?['name'] as String? ?? '',
      imageUrl: ApiConfig.resolveUrl(artwork?['large'] as String?),
      duration: (asInt(json['durationMs']) ?? 0) ~/ 1000,
      genre: genre?['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'artist': artist,
    'image_url': imageUrl,
    'duration': duration,
    'genre': genre,
    'plays': plays,
  };
}

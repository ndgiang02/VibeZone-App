import 'package:vibezone/core/common/entities/song.dart';

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

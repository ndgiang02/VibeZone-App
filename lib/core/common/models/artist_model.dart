import 'package:vibezone/core/common/entities/artist.dart';

class ArtistModel extends Artist {
  const ArtistModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    super.followers,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
    id: json['id'] as String,
    name: json['name'] as String,
    imageUrl: json['image_url'] as String,
    followers: (json['followers'] as int?) ?? 0,
  );
}

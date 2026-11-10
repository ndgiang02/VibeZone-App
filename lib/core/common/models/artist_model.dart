import 'package:vibezone/core/common/entities/artist.dart';
import 'package:vibezone/core/network/api_config.dart';

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

  /// From the API's `ArtistRefDto` (the `artist` of a track or album).
  factory ArtistModel.fromArtistRefJson(Map<String, dynamic> json) =>
      ArtistModel(
        id: json['id'] as String,
        name: json['name'] as String,
        imageUrl: ApiConfig.resolveUrl(json['avatarUrl'] as String?),
      );

  /// From the API's `ArtistDto`.
  factory ArtistModel.fromArtistJson(Map<String, dynamic> json) {
    final avatar = json['avatar'] as Map<String, dynamic>?;
    return ArtistModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: ApiConfig.resolveUrl(avatar?['large'] as String?),
    );
  }
}

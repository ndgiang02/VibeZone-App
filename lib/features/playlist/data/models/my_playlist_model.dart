import 'package:vibezone/core/network/api_config.dart';
import 'package:vibezone/core/network/api_response.dart';
import 'package:vibezone/features/playlist/domain/entities/my_playlist.dart';

class MyPlaylistModel extends MyPlaylist {
  const MyPlaylistModel({
    required super.id,
    required super.title,
    super.isPublic,
    super.trackCount,
    super.coverUrls,
    super.containsTrack,
  });

  /// From the API's `PlaylistDto`.
  factory MyPlaylistModel.fromJson(Map<String, dynamic> json) =>
      MyPlaylistModel(
        id: json['id'] as String,
        title: json['title'] as String? ?? '',
        isPublic: json['visibility'] == 'Public',
        trackCount: asInt(json['trackCount']) ?? 0,
        coverUrls: (json['coverUrls'] as List? ?? const [])
            .map((url) => ApiConfig.resolveUrl(url as String?))
            .toList(),
        containsTrack: json['containsTrack'] as bool? ?? false,
      );
}

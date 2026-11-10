import 'package:vibezone/core/common/entities/playlist.dart';

import 'song_model.dart';

class PlaylistModel extends Playlist {
  const PlaylistModel({
    required super.id,
    required super.title,
    required super.description,
    required List<SongModel> super.songs,
  });

  /// [songs] is the full song catalog, used to resolve `song_ids`.
  factory PlaylistModel.fromJson(
    Map<String, dynamic> json,
    List<SongModel> songs,
  ) {
    final ids = (json['song_ids'] as List).cast<String>();
    return PlaylistModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      songs: songs.where((song) => ids.contains(song.id)).toList(),
    );
  }

  /// From the API's `PlaylistDto`; its tracks come from a separate request.
  factory PlaylistModel.fromApiJson(
    Map<String, dynamic> json,
    List<SongModel> songs,
  ) => PlaylistModel(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String? ?? '',
    songs: songs,
  );
}

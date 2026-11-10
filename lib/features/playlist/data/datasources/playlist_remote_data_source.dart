import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/features/playlist/data/models/my_playlist_model.dart';

abstract class PlaylistRemoteDataSource {
  /// Recently updated first. With [containsTrack], each playlist says whether
  /// that track is in it.
  Future<List<MyPlaylistModel>> getMyPlaylists({String? containsTrack});

  Future<MyPlaylistModel> createPlaylist({
    required String title,
    required bool isPublic,
  });

  /// Already there → no-op. `playlist_full` at 500 tracks.
  Future<void> addTrack(String playlistId, String trackId);

  Future<void> removeTrack(String playlistId, String trackId);
}

class PlaylistRemoteDataSourceImpl implements PlaylistRemoteDataSource {
  static const _pageSize = 50;

  final ApiClient client;

  PlaylistRemoteDataSourceImpl(this.client);

  @override
  Future<List<MyPlaylistModel>> getMyPlaylists({String? containsTrack}) async {
    final response = await client.get(
      ApiEndpoints.myPlaylists,
      query: {
        'page': 1,
        'pageSize': _pageSize,
        'containsTrack': ?containsTrack,
      },
    );
    return response.list(MyPlaylistModel.fromJson);
  }

  @override
  Future<MyPlaylistModel> createPlaylist({
    required String title,
    required bool isPublic,
  }) async {
    final response = await client.post(
      ApiEndpoints.playlists,
      data: {
        'title': title,
        'description': null,
        'visibility': isPublic ? 'Public' : 'Private',
      },
    );
    return MyPlaylistModel.fromJson(response.object);
  }

  @override
  Future<void> addTrack(String playlistId, String trackId) async {
    await client.post(
      ApiEndpoints.playlistTracks(playlistId),
      data: {'trackId': trackId},
    );
  }

  @override
  Future<void> removeTrack(String playlistId, String trackId) async {
    await client.delete(ApiEndpoints.playlistTrack(playlistId, trackId));
  }
}

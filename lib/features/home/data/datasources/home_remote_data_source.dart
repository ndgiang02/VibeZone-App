import 'package:vibezone/core/common/models/artist_model.dart';
import 'package:vibezone/core/common/models/playlist_model.dart';
import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/core/data/mock_music_data.dart';
import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/features/home/data/models/home_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  static const _trackCount = 20;
  static const _playlistCount = 6;

  final ApiClient client;

  HomeRemoteDataSourceImpl(this.client);

  @override
  Future<HomeDataModel> getHomeData() async {
    final (genres, songs, playlists) = await (
      _getGenres(),
      _getNewReleases(),
      _getPlaylists(),
    ).wait;

    // There is no "top artists" endpoint yet: show the artists of the
    // newest tracks instead.
    final artists = <String, ArtistModel>{};
    for (final track in songs.tracks) {
      final artist = ArtistModel.fromArtistRefJson(
        track['artist'] as Map<String, dynamic>,
      );
      artists.putIfAbsent(artist.id, () => artist);
    }

    return HomeDataModel(
      genres: genres,
      featured: songs.models.take(4).toList(),
      popular: songs.models,
      playlists: playlists,
      artists: artists.values.toList(),
      // No listening history endpoint yet.
      recentlyPlayed: const [],
    );
  }

  Future<List<String>> _getGenres() async {
    final response = await client.get(ApiEndpoints.genres, auth: false);
    return response.list((json) => json['name'] as String);
  }

  Future<({List<Map<String, dynamic>> tracks, List<SongModel> models})>
  _getNewReleases() async {
    final response = await client.get(
      ApiEndpoints.tracks,
      auth: false,
      query: {'page': 1, 'pageSize': _trackCount},
    );
    final tracks = response.list((json) => json);
    return (
      tracks: tracks,
      models: tracks.map(SongModel.fromTrackJson).toList(),
    );
  }

  /// Public playlists with their tracks; empty ones can't be played.
  Future<List<PlaylistModel>> _getPlaylists() async {
    final response = await client.get(
      ApiEndpoints.playlists,
      auth: false,
      query: {'page': 1, 'pageSize': _playlistCount},
    );
    final playlists = await Future.wait(
      response.list((json) => json).map((json) async {
        final tracks = await client.get(
          ApiEndpoints.playlistTracks(json['id'] as String),
        );
        return PlaylistModel.fromApiJson(
          json,
          tracks.list(SongModel.fromTrackJson),
        );
      }),
    );
    return playlists.where((playlist) => playlist.songs.isNotEmpty).toList();
  }
}

class HomeRemoteDataSourceMock implements HomeRemoteDataSource {
  @override
  Future<HomeDataModel> getHomeData() async {
    await Future.delayed(const Duration(milliseconds: 600));

    final songs = mockSongsJson.map(SongModel.fromJson).toList();
    final byPlays = [...songs]..sort((a, b) => b.plays.compareTo(a.plays));

    return HomeDataModel(
      genres: mockGenres,
      featured: byPlays.take(4).toList(),
      popular: byPlays,
      playlists: mockPlaylistsJson
          .map((json) => PlaylistModel.fromJson(json, songs))
          .toList(),
      artists: mockArtistsJson.map(ArtistModel.fromJson).toList(),
      recentlyPlayed: [songs[0], songs[4], songs[11], songs[6]],
    );
  }
}

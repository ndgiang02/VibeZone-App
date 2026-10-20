import 'package:vibezone/core/common/models/artist_model.dart';
import 'package:vibezone/core/common/models/playlist_model.dart';
import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/core/data/mock_music_data.dart';
import 'package:vibezone/features/home/data/models/home_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();
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

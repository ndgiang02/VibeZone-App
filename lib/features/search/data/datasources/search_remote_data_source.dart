import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/core/data/mock_music_data.dart';
import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_endpoints.dart';

abstract class SearchRemoteDataSource {
  Future<List<SongModel>> searchSongs(String query);

  Future<List<String>> getGenres();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  static const _pageSize = 20;

  final ApiClient client;

  SearchRemoteDataSourceImpl(this.client);

  /// Accent-insensitive ("son tung" finds "Sơn Tùng") and typo tolerant.
  @override
  Future<List<SongModel>> searchSongs(String query) async {
    final response = await client.get(
      ApiEndpoints.searchTracks,
      auth: false,
      query: {'q': query, 'page': 1, 'pageSize': _pageSize},
    );
    return response.list(SongModel.fromTrackJson);
  }

  @override
  Future<List<String>> getGenres() async {
    final response = await client.get(ApiEndpoints.genres, auth: false);
    return response.list((json) => json['name'] as String);
  }
}

class SearchRemoteDataSourceMock implements SearchRemoteDataSource {
  @override
  Future<List<SongModel>> searchSongs(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final keyword = query.toLowerCase();
    return mockSongsJson
        .map(SongModel.fromJson)
        .where(
          (song) =>
              song.title.toLowerCase().contains(keyword) ||
              song.artist.toLowerCase().contains(keyword) ||
              song.genre.toLowerCase().contains(keyword),
        )
        .toList();
  }

  @override
  Future<List<String>> getGenres() async => mockGenres;
}

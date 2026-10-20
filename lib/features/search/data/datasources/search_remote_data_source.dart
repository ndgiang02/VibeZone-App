import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/core/data/mock_music_data.dart';

abstract class SearchRemoteDataSource {
  Future<List<SongModel>> searchSongs(String query);

  Future<List<String>> getGenres();
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

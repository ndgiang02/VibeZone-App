import 'package:vibezone/core/data/mock_music_data.dart';
import 'package:vibezone/features/trending/data/models/trending_song_model.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

abstract class TrendingRemoteDataSource {
  Future<List<TrendingSongModel>> getTrendingSongs(TrendingPeriod period);
}

class TrendingRemoteDataSourceMock implements TrendingRemoteDataSource {
  @override
  Future<List<TrendingSongModel>> getTrendingSongs(
    TrendingPeriod period,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Shuffle deterministically per period so each tab shows a different chart.
    final songs = [...mockSongsJson];
    final seed = period.index + 1;
    songs.sort((a, b) {
      final scoreA = (a['plays'] as int) ~/ (1 + (a['id'].hashCode % seed));
      final scoreB = (b['plays'] as int) ~/ (1 + (b['id'].hashCode % seed));
      return scoreB.compareTo(scoreA);
    });

    return [
      for (var i = 0; i < songs.length; i++)
        TrendingSongModel.fromJson({
          'song': songs[i],
          'rank': i + 1,
          // Every 5th entry is new, the rest move a little around their rank.
          'previous_rank': i % 5 == 4
              ? null
              : (i + 1 + (i * seed) % 5 - 2).clamp(1, 99),
        }),
    ];
  }
}

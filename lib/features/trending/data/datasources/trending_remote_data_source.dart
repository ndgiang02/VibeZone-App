import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

abstract class TrendingRemoteDataSource {
  /// The chart (top 100 over the last 7 days, same for everyone), [page] is
  /// 1-based.
  Future<TrendingPage> getTrendingSongs({
    required int page,
    required int pageSize,
  });
}

class TrendingRemoteDataSourceImpl implements TrendingRemoteDataSource {
  final ApiClient client;

  TrendingRemoteDataSourceImpl(this.client);

  @override
  Future<TrendingPage> getTrendingSongs({
    required int page,
    required int pageSize,
  }) async {
    final response = await client.get(
      ApiEndpoints.trendingTracks,
      auth: false,
      query: {'page': page, 'pageSize': pageSize},
    );
    final tracks = response.page(SongModel.fromTrackJson);
    final firstRank = (page - 1) * pageSize + 1;
    return TrendingPage(
      songs: [
        for (final (i, song) in tracks.items.indexed)
          TrendingSong(song: song, rank: firstRank + i),
      ],
      hasMore: tracks.hasMore,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:vibezone/core/common/entities/song.dart';

class TrendingSong extends Equatable {
  final Song song;

  /// 1-based position on the chart.
  final int rank;

  const TrendingSong({required this.song, required this.rank});

  @override
  List<Object?> get props => [song, rank];
}

/// One page of the chart.
class TrendingPage extends Equatable {
  final List<TrendingSong> songs;
  final bool hasMore;

  const TrendingPage({required this.songs, required this.hasMore});

  @override
  List<Object?> get props => [songs, hasMore];
}

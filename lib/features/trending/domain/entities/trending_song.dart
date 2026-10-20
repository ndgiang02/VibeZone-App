import 'package:equatable/equatable.dart';
import 'package:vibezone/core/common/entities/song.dart';

enum TrendingPeriod { today, week, month }

class TrendingSong extends Equatable {
  final Song song;
  final int rank;

  /// `null` when the song is new on the chart.
  final int? previousRank;

  const TrendingSong({
    required this.song,
    required this.rank,
    this.previousRank,
  });

  bool get isNew => previousRank == null;

  /// Positive when the song climbed, negative when it dropped.
  int get rankChange => isNew ? 0 : previousRank! - rank;

  @override
  List<Object?> get props => [song, rank, previousRank];
}

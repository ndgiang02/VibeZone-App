import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

class TrendingSongModel extends TrendingSong {
  const TrendingSongModel({
    required SongModel super.song,
    required super.rank,
    super.previousRank,
  });

  factory TrendingSongModel.fromJson(Map<String, dynamic> json) =>
      TrendingSongModel(
        song: SongModel.fromJson(json['song'] as Map<String, dynamic>),
        rank: json['rank'] as int,
        previousRank: json['previous_rank'] as int?,
      );
}

import 'package:vibezone/core/common/models/artist_model.dart';
import 'package:vibezone/core/common/models/playlist_model.dart';
import 'package:vibezone/core/common/models/song_model.dart';
import 'package:vibezone/features/home/domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.genres,
    required List<SongModel> super.featured,
    required List<SongModel> super.popular,
    required List<PlaylistModel> super.playlists,
    required List<ArtistModel> super.artists,
    required List<SongModel> super.recentlyPlayed,
  });
}

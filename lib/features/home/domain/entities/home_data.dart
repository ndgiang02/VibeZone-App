import 'package:equatable/equatable.dart';
import 'package:vibezone/core/common/entities/artist.dart';
import 'package:vibezone/core/common/entities/playlist.dart';
import 'package:vibezone/core/common/entities/song.dart';

class HomeData extends Equatable {
  final List<String> genres;
  final List<Song> featured;
  final List<Song> popular;
  final List<Playlist> playlists;
  final List<Artist> artists;
  final List<Song> recentlyPlayed;

  const HomeData({
    required this.genres,
    required this.featured,
    required this.popular,
    required this.playlists,
    required this.artists,
    required this.recentlyPlayed,
  });

  @override
  List<Object?> get props => [
    genres,
    featured,
    popular,
    playlists,
    artists,
    recentlyPlayed,
  ];
}

import 'package:equatable/equatable.dart';

import 'song.dart';

class Playlist extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<Song> songs;

  const Playlist({
    required this.id,
    required this.title,
    required this.description,
    required this.songs,
  });

  int get songCount => songs.length;

  List<String> get coverImages => songs.map((e) => e.imageUrl).toList();

  @override
  List<Object?> get props => [id, title, description, songs];
}

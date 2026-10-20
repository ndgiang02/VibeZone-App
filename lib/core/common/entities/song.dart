import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;

  /// Duration in seconds.
  final int duration;
  final String genre;
  final int plays;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.duration,
    required this.genre,
    this.plays = 0,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    artist,
    imageUrl,
    duration,
    genre,
    plays,
  ];
}

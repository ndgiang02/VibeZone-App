import 'package:equatable/equatable.dart';

/// One of the signed-in user's playlists, as listed in "Add to playlist".
class MyPlaylist extends Equatable {
  final String id;
  final String title;
  final bool isPublic;
  final int trackCount;

  /// Up to 4 track covers for a mosaic.
  final List<String> coverUrls;

  /// Whether the track asked about is already in it.
  final bool containsTrack;

  const MyPlaylist({
    required this.id,
    required this.title,
    this.isPublic = false,
    this.trackCount = 0,
    this.coverUrls = const [],
    this.containsTrack = false,
  });

  MyPlaylist copyWith({bool? containsTrack, int? trackCount}) => MyPlaylist(
    id: id,
    title: title,
    isPublic: isPublic,
    trackCount: trackCount ?? this.trackCount,
    coverUrls: coverUrls,
    containsTrack: containsTrack ?? this.containsTrack,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    isPublic,
    trackCount,
    coverUrls,
    containsTrack,
  ];
}

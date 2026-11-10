import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/features/playlist/presentation/widget/add_to_playlist_sheet.dart';
import 'package:vibezone/features/player/presentation/widget/player_bottom_bar.dart';
import 'package:vibezone/features/player/presentation/widget/waveform_seek_bar.dart';

import 'bloc/play_bloc.dart';

/// Full screen player in the style of SoundCloud: the artwork fills the
/// screen, swipe it to change song, tap it to pause, and the waveform sits on
/// top. Reads the app-wide [PlayBloc] provided in `main.dart`.
class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late final PageController _pages = PageController(
    initialPage: _indexOf(context.read<PlayBloc>().state),
  );

  /// True while the page is moved to follow the bloc, so that move isn't
  /// mistaken for a swipe.
  bool _following = false;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  static List<Song> _queueOf(PlayState state) => state.queue.isNotEmpty
      ? state.queue
      : [if (state.song != null) state.song!];

  static int _indexOf(PlayState state) {
    final index = _queueOf(
      state,
    ).indexWhere((song) => song.id == state.song?.id);
    return index < 0 ? 0 : index;
  }

  /// The song changed elsewhere (next/previous, end of song): follow it.
  Future<void> _followSong(PlayState state) async {
    if (!_pages.hasClients) return;
    final index = _indexOf(state);
    final current = _pages.page?.round() ?? index;
    if (current == index) return;
    _following = true;
    // Animating across several pages would play each one on the way.
    if ((current - index).abs() == 1) {
      await _pages.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _pages.jumpToPage(index);
    }
    _following = false;
  }

  void _onSwipe(int index) {
    if (_following) return;
    final state = context.read<PlayBloc>().state;
    final queue = _queueOf(state);
    if (queue[index].id == state.song?.id) return;
    context.read<PlayBloc>().add(
      PlayEvent.playSong(song: queue[index], queue: queue),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayBloc>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<PlayBloc, PlayState>(
          listenWhen: (p, c) => p.song?.id != c.song?.id,
          listener: (context, state) => _followSong(state),
          builder: (context, state) {
            final queue = _queueOf(state);
            return Stack(
              fit: StackFit.expand,
              children: [
                PageView.builder(
                  controller: _pages,
                  itemCount: queue.length,
                  onPageChanged: _onSwipe,
                  itemBuilder: (context, index) => _ArtworkPage(
                    song: queue[index],
                    isCurrent: queue[index].id == state.song?.id,
                    onTap: () => bloc.add(const PlayEvent.playPause()),
                  ),
                ),
                const IgnorePointer(child: _Scrims()),
                IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: state.isPlaying ? 0 : 1,
                    duration: const Duration(milliseconds: 200),
                    child: const _PausedOverlay(),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      _Header(
                        title: state.song?.title ?? '',
                        artist: state.song?.artist ?? '',
                        onClose: () => context.pop(),
                      ),
                      // Leaves the middle free for swipes and taps.
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: WaveformSeekBar(
                          peaks: state.waveform,
                          position: state.currentPosition,
                          total: state.totalDuration,
                          onSeek: (pos) => bloc.add(PlayEvent.seek(pos)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      PlayerBottomBar(
                        isFavorite: state.isFavorite,
                        isRepeat: state.isRepeat,
                        isShuffle: state.isShuffle,
                        onToggleFavorite: () =>
                            bloc.add(const PlayEvent.toggleFavorite()),
                        onToggleRepeat: () =>
                            bloc.add(const PlayEvent.toggleRepeat()),
                        onToggleShuffle: () =>
                            bloc.add(const PlayEvent.toggleShuffle()),
                        onAddToPlaylist: state.song == null
                            ? null
                            : () =>
                                  showAddToPlaylistSheet(context, state.song!),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ArtworkPage extends StatelessWidget {
  final Song song;
  final bool isCurrent;
  final VoidCallback onTap;

  const _ArtworkPage({
    required this.song,
    required this.isCurrent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final image = song.imageUrl.isEmpty
        ? Container(
            color: Colors.grey[900],
            alignment: Alignment.center,
            child: const Icon(Icons.music_note, size: 120, color: Colors.grey),
          )
        : AppImage(url: song.imageUrl);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      // Only the current page flies in from the mini player.
      child: isCurrent ? Hero(tag: 'player-artwork', child: image) : image,
    );
  }
}

/// Darkens the top and bottom so the labels and waveform read on any artwork.
class _Scrims extends StatelessWidget {
  const _Scrims();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.22, 0.5, 1],
          colors: [
            Colors.black54,
            Colors.transparent,
            Colors.transparent,
            Colors.black87,
          ],
        ),
      ),
    );
  }
}

class _PausedOverlay extends StatelessWidget {
  const _PausedOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.3),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.white,
          size: 56,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String artist;
  final VoidCallback onClose;

  const _Header({
    required this.title,
    required this.artist,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 4, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  _Label(
                    title,
                    style: text.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (artist.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  _Label(
                    artist,
                    style: text.bodyMedium!.copyWith(color: Colors.white70),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 32,
            ),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

/// Text on a black box, like SoundCloud's title and artist tags.
class _Label extends StatelessWidget {
  final String text;
  final TextStyle style;

  const _Label(this.text, {required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.black.withValues(alpha: 0.8),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}

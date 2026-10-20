import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/common/widgets/max_width_box.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/features/player/presentation/widget/action_button.dart';
import 'package:vibezone/features/player/presentation/widget/control_button.dart';
import 'package:vibezone/features/player/presentation/widget/play_progress.dart';
import 'package:vibezone/features/player/presentation/widget/play_time.dart';
import 'package:vibezone/features/player/presentation/widget/song_album.dart';
import 'package:vibezone/features/player/presentation/widget/song_info.dart';

import 'bloc/play_bloc.dart';

/// Full screen player. Reads the app-wide [PlayBloc] provided in `main.dart`.
class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) => const _PlayScreenBody();
}

class _PlayScreenBody extends StatelessWidget {
  const _PlayScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<PlayBloc, PlayState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: state.song != null
                    ? AppImage(url: state.song!.imageUrl)
                    : _buildDefaultBackground(),
              ),

              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(color: Colors.black.withValues(alpha: 0.5)),
                ),
              ),

              // Main Content: scrolls instead of overflowing on short screens.
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MaxWidthBox(
                      maxWidth: Breakpoints.form,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SongAlbum(imagePath: state.song?.imageUrl),
                            const SizedBox(height: 30),

                            SongInfo(
                              title: state.song?.title,
                              artist: state.song?.artist,
                            ),
                            const SizedBox(height: 30),

                            PlayProgress(
                              position: state.currentPosition,
                              total: state.totalDuration,
                              onSeek: (pos) => context.read<PlayBloc>().add(
                                PlayEvent.seek(pos),
                              ),
                            ),

                            PlayTime(
                              currentPosition: state.currentPosition,
                              totalDuration: state.totalDuration,
                            ),
                            const SizedBox(height: 30),

                            ControlButtons(
                              isPlaying: state.isPlaying,
                              isShuffle: state.isShuffle,
                              isRepeat: state.isRepeat,
                              onPlayPause: () => context.read<PlayBloc>().add(
                                const PlayEvent.playPause(),
                              ),
                              onNext: () => context.read<PlayBloc>().add(
                                const PlayEvent.next(),
                              ),
                              onPrev: () => context.read<PlayBloc>().add(
                                const PlayEvent.previous(),
                              ),
                              onToggleShuffle: () => context
                                  .read<PlayBloc>()
                                  .add(const PlayEvent.toggleShuffle()),
                              onToggleRepeat: () => context
                                  .read<PlayBloc>()
                                  .add(const PlayEvent.toggleRepeat()),
                            ),
                            const SizedBox(height: 30),

                            ActionButtons(
                              isFavorite: state.isFavorite,
                              onToggleFavorite: () => context
                                  .read<PlayBloc>()
                                  .add(const PlayEvent.toggleFavorite()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDefaultBackground() {
    return Container(
      color: Colors.grey[900],
      child: const Center(
        child: Icon(Icons.music_note, size: 150, color: Colors.grey),
      ),
    );
  }
}

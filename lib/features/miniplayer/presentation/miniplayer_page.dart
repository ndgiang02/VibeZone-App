import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/common/widgets/max_width_box.dart';
import 'package:vibezone/features/player/presentation/bloc/play_bloc.dart';

import 'cubit/miniplayer_cubit.dart';

/// Docked above the bottom bar. Can be shrunk into a floating bubble
/// (minimize button / swipe down) and expanded again by tapping the bubble.
class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final hasSong = context.select((PlayBloc bloc) => bloc.state.hasSong);
    final isCollapsed = context.watch<MiniPlayerCubit>().state;

    return MaxWidthBox(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        alignment: Alignment.bottomRight,
        child: !hasSong
            ? const SizedBox(width: double.infinity)
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOutBack,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    alignment: Alignment.centerRight,
                    child: child,
                  ),
                ),
                child: isCollapsed
                    ? const _CollapsedPlayer(key: ValueKey('collapsed'))
                    : const _ExpandedPlayer(key: ValueKey('expanded')),
              ),
      ),
    );
  }
}

class _ExpandedPlayer extends StatelessWidget {
  const _ExpandedPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayBloc>();
    return BlocBuilder<PlayBloc, PlayState>(
      builder: (context, state) {
        final song = state.song;
        if (song == null) return const SizedBox.shrink();
        final scheme = Theme.of(context).colorScheme;
        return GestureDetector(
          onTap: () => context.push('/play'),
          onVerticalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;
            if (velocity > 200) {
              context.read<MiniPlayerCubit>().collapse();
            } else if (velocity < -200) {
              context.push('/play');
            }
          },
          onHorizontalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;
            if (velocity < -300) bloc.add(const PlayEvent.next());
            if (velocity > 300) bloc.add(const PlayEvent.previous());
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'player-artwork',
                          child: AppImage(
                            url: song.imageUrl,
                            width: 46,
                            height: 46,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                song.artist,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            state.isPlaying
                                ? Icons.pause_circle_filled_rounded
                                : Icons.play_circle_fill_rounded,
                            color: scheme.primary,
                            size: 36,
                          ),
                          onPressed: () =>
                              bloc.add(const PlayEvent.playPause()),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () => bloc.add(const PlayEvent.next()),
                        ),
                        IconButton(
                          tooltip: 'Minimize',
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white70,
                          ),
                          onPressed: () =>
                              context.read<MiniPlayerCubit>().collapse(),
                        ),
                      ],
                    ),
                  ),
                  LinearProgressIndicator(
                    value: state.progress,
                    minHeight: 2,
                    color: scheme.primary,
                    backgroundColor: Colors.white12,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CollapsedPlayer extends StatefulWidget {
  const _CollapsedPlayer({super.key});

  @override
  State<_CollapsedPlayer> createState() => _CollapsedPlayerState();
}

class _CollapsedPlayerState extends State<_CollapsedPlayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotation = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  );

  @override
  void initState() {
    super.initState();
    _syncRotation(context.read<PlayBloc>().state.isPlaying);
  }

  void _syncRotation(bool isPlaying) {
    if (isPlaying) {
      _rotation.repeat();
    } else {
      _rotation.stop();
    }
  }

  @override
  void dispose() {
    _rotation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return BlocConsumer<PlayBloc, PlayState>(
      listenWhen: (p, c) => p.isPlaying != c.isPlaying,
      listener: (context, state) => _syncRotation(state.isPlaying),
      builder: (context, state) {
        final song = state.song;
        if (song == null) return const SizedBox.shrink();
        return Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 16, 8),
            child: GestureDetector(
              onTap: () => context.read<MiniPlayerCubit>().expand(),
              onVerticalDragEnd: (details) {
                if ((details.primaryVelocity ?? 0) < -200) {
                  context.read<MiniPlayerCubit>().expand();
                }
              },
              child: SizedBox(
                width: 64,
                height: 64,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    SizedBox.expand(
                      child: CircularProgressIndicator(
                        value: state.progress,
                        strokeWidth: 3,
                        color: scheme.primary,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                    RotationTransition(
                      turns: _rotation,
                      child: AppImage(
                        url: song.imageUrl,
                        width: 54,
                        height: 54,
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                    Icon(
                      state.isPlaying
                          ? Icons.graphic_eq_rounded
                          : Icons.play_arrow_rounded,
                      color: Colors.white,
                      shadows: const [Shadow(blurRadius: 6)],
                    ),
                    Positioned(
                      top: -4,
                      left: -4,
                      child: GestureDetector(
                        onTap: () {
                          context.read<PlayBloc>().add(const PlayEvent.stop());
                          context.read<MiniPlayerCubit>().expand();
                        },
                        child: const CircleAvatar(
                          radius: 11,
                          backgroundColor: Color(0xFF2A2A2A),
                          child: Icon(
                            Icons.close_rounded,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

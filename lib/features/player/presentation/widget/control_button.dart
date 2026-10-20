import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/constant.dart';
import 'package:vibezone/core/configs/constants/icons.dart';

class ControlButtons extends StatelessWidget {
  final bool isPlaying;
  final bool isShuffle;
  final bool isRepeat;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final VoidCallback onToggleShuffle;
  final VoidCallback onToggleRepeat;

  const ControlButtons({
    super.key,
    required this.isPlaying,
    required this.isShuffle,
    required this.isRepeat,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrev,
    required this.onToggleShuffle,
    required this.onToggleRepeat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.shuffle,
            color: isShuffle ? Theme.of(context).primaryColor : Colors.white70,
            size: 28,
          ),
          onPressed: onToggleShuffle,
        ),
        IconButton(
          icon: const Icon(Icons.skip_previous, color: Colors.white, size: 48),
          onPressed: onPrev,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPlayPause,
            icon: SvgWidget(ic: isPlaying ? icPause : icPlay),
            color: secondary,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.skip_next, color: Colors.white, size: 48),
          onPressed: onNext,
        ),
        IconButton(
          icon: Icon(
            Icons.repeat,
            color: isRepeat ? Theme.of(context).primaryColor : Colors.white70,
            size: 28,
          ),
          onPressed: onToggleRepeat,
        ),
      ],
    );
  }
}

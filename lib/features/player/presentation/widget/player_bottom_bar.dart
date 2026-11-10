import 'package:flutter/material.dart';

/// Row of song actions at the bottom of the player, like SoundCloud's.
class PlayerBottomBar extends StatelessWidget {
  final bool isFavorite;
  final bool isRepeat;
  final bool isShuffle;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleRepeat;
  final VoidCallback onToggleShuffle;
  final VoidCallback? onAddToPlaylist;

  const PlayerBottomBar({
    super.key,
    required this.isFavorite,
    required this.isRepeat,
    required this.isShuffle,
    required this.onToggleFavorite,
    required this.onToggleRepeat,
    required this.onToggleShuffle,
    this.onAddToPlaylist,
  });

  @override
  Widget build(BuildContext context) {
    final active = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Action(
            icon: isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? active : Colors.white,
            onPressed: onToggleFavorite,
          ),
          _Action(
            icon: Icons.repeat_rounded,
            color: isRepeat ? active : Colors.white,
            onPressed: onToggleRepeat,
          ),
          _Action(
            icon: Icons.shuffle_rounded,
            color: isShuffle ? active : Colors.white,
            onPressed: onToggleShuffle,
          ),
          if (onAddToPlaylist != null)
            _Action(
              icon: Icons.playlist_add_rounded,
              color: Colors.white,
              onPressed: onAddToPlaylist!,
            ),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _Action({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 28,
      icon: Icon(icon, color: color),
      onPressed: onPressed,
    );
  }
}

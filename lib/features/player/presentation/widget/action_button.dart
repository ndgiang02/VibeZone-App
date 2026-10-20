import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const ActionButtons({
    super.key,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white70,
            size: 28,
          ),
          onPressed: onToggleFavorite,
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white70, size: 28),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.playlist_add, color: Colors.white70, size: 28),
          onPressed: () {
            // TODO: Add to playlist
          },
        ),
      ],
    );
  }
}

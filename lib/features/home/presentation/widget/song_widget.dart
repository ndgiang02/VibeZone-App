import 'package:flutter/material.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/utils/responsive.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;
  final bool isActive;

  const SongCard({
    super.key,
    required this.song,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = Responsive.clampWidth(36, context, min: 120, max: 180);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppImage(
                  url: song.imageUrl,
                  width: size,
                  height: size,
                  borderRadius: BorderRadius.circular(14),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: theme.colorScheme.primary,
                    child: Icon(
                      isActive
                          ? Icons.graphic_eq_rounded
                          : Icons.play_arrow_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              song.title,
              style: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: isActive ? theme.colorScheme.primary : null,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              song.artist,
              style: theme.textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

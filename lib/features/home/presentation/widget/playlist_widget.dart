import 'package:flutter/material.dart';
import 'package:vibezone/core/common/entities/playlist.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/utils/responsive.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  final VoidCallback onTap;

  const PlaylistCard({super.key, required this.playlist, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = Responsive.clampWidth(36, context, min: 120, max: 180);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StackedCover(images: playlist.coverImages, width: width),
            const SizedBox(height: 10),
            Text(
              playlist.title,
              style: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              '${playlist.songCount} ${S.of(context).txt_songs}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// Up to three covers fanned out behind each other.
class _StackedCover extends StatelessWidget {
  final List<String> images;
  final double width;

  const _StackedCover({required this.images, required this.width});

  @override
  Widget build(BuildContext context) {
    final covers = images.take(3).toList();
    // Proportions match the original 140 x 130 design.
    final step = width * 0.07;
    final front = width * 0.8;
    return SizedBox(
      width: width,
      height: front + step * 2,
      child: Stack(
        children: List.generate(covers.length, (index) {
          final offset = index * step;
          final size = front - index * step * 0.8;
          return Positioned(
            top: offset,
            left: offset,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: AppImage(
                url: covers[index],
                width: size,
                height: size,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }).reversed.toList(),
      ),
    );
  }
}

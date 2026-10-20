import 'package:flutter/material.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/utils/responsive.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  /// Highlights the tile when this song is the one currently loaded.
  final bool isActive;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;

  const SongTile({
    super.key,
    required this.song,
    required this.onTap,
    this.isActive = false,
    this.leading,
    this.trailing,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = theme.colorScheme.primary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.x3),
        child: Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 12)],
            Stack(
              alignment: Alignment.center,
              children: [
                AppImage(
                  url: song.imageUrl,
                  width: 52,
                  height: 52,
                  borderRadius: BorderRadius.circular(10),
                ),
                if (isActive)
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.graphic_eq_rounded, color: activeColor),
                  ),
              ],
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
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isActive ? activeColor : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle ?? song.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            trailing ??
                Icon(
                  Icons.more_vert_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
          ],
        ),
      ),
    );
  }
}

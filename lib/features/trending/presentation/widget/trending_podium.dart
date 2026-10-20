import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

/// Top 3 laid out as a podium: #2 – #1 – #3.
class TrendingPodium extends StatelessWidget {
  final List<TrendingSong> topThree;
  final ValueChanged<TrendingSong> onTap;

  const TrendingPodium({
    super.key,
    required this.topThree,
    required this.onTap,
  });

  static const _medalColors = [
    Color(0xFFFFD54F),
    Color(0xFFCFD8DC),
    Color(0xFFD7A26C),
  ];

  @override
  Widget build(BuildContext context) {
    if (topThree.length < 3) return const SizedBox.shrink();
    final order = [topThree[1], topThree[0], topThree[2]];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: order.map((item) {
        final isFirst = item.rank == 1;
        return Expanded(
          child: LayoutBuilder(
            // Avatar follows the column width: #1 is ~80% of it, others ~65%,
            // capped so tablets don't get oversized circles.
            builder: (context, constraints) => _PodiumItem(
              item: item,
              size: (constraints.maxWidth * (isFirst ? 0.8 : 0.65) - 12).clamp(
                48.0,
                isFirst ? 150.0 : 120.0,
              ),
              color: _medalColors[item.rank - 1],
              onTap: () => onTap(item),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _PodiumItem extends StatelessWidget {
  final TrendingSong item;
  final double size;
  final Color color;
  final VoidCallback onTap;

  const _PodiumItem({
    required this.item,
    required this.size,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if (item.rank == 1)
            Icon(Icons.emoji_events_rounded, color: color, size: 28),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 3),
                ),
                child: AppImage(
                  url: item.song.imageUrl,
                  width: size,
                  height: size,
                  borderRadius: BorderRadius.circular(size / 2),
                ),
              ),
              Positioned(
                bottom: -12,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: color,
                  child: Text(
                    '${item.rank}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              item.song.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            item.song.artist,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

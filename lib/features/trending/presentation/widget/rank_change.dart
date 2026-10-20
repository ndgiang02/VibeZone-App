import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

class RankChange extends StatelessWidget {
  final TrendingSong item;

  const RankChange({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (item.isNew) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        decoration: BoxDecoration(
          color: scheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          S.of(context).txt_new,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    }
    final change = item.rankChange;
    if (change == 0) {
      return Icon(Icons.remove_rounded, size: 14, color: scheme.outline);
    }
    final isUp = change > 0;
    final color = isUp ? const Color(0xFF4CD964) : scheme.error;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isUp ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
          size: 18,
          color: color,
        ),
        Text(
          '${change.abs()}',
          style: TextStyle(fontSize: 10, color: color, height: 1),
        ),
      ],
    );
  }
}

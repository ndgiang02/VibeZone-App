import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';

/// Entry point from Home to the Trending tab.
class TrendingTeaser extends StatelessWidget {
  final VoidCallback onTap;

  const TrendingTeaser({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [scheme.primary, const Color(0xFF3FA36B)],
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.local_fire_department_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).title_trending_now,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    S.of(context).txt_trending_subtitle,
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

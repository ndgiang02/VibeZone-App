import 'package:flutter/material.dart';
import 'package:vibezone/core/utils/responsive.dart';

/// Skeleton shown while the home feed is loading.
class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    Widget box(double w, double h, {double r = 12}) => Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(r),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box(double.infinity, 180, r: 20),
        const SizedBox(height: Spacing.x5),
        Row(
          children: List.generate(
            4,
            (_) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: box(64, 36, r: 18),
            ),
          ),
        ),
        const SizedBox(height: Spacing.x5),
        box(160, 20),
        const SizedBox(height: Spacing.x4),
        Row(
          children: List.generate(
            2,
            (_) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: box(140, 140, r: 14),
            ),
          ),
        ),
      ],
    );
  }
}

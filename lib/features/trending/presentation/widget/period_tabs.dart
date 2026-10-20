import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

class PeriodTabs extends StatelessWidget {
  final TrendingPeriod selected;
  final ValueChanged<TrendingPeriod> onChanged;

  const PeriodTabs({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  String _label(BuildContext context, TrendingPeriod period) {
    switch (period) {
      case TrendingPeriod.today:
        return S.of(context).period_today;
      case TrendingPeriod.week:
        return S.of(context).period_week;
      case TrendingPeriod.month:
        return S.of(context).period_month;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: TrendingPeriod.values.map((period) {
          final isSelected = period == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(period),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 9),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? scheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _label(context, period),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? Colors.black : scheme.onSurface,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

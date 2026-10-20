import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (onSeeAll != null)
          TextButton.icon(
            onPressed: onSeeAll,
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.chevron_right, size: 18),
            label: Text(S.of(context).see_all),
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.onSurfaceVariant,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
          ),
      ],
    );
  }
}

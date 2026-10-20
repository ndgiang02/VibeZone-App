import 'package:flutter/material.dart';

/// Titled rounded card that groups menu rows with dividers between them.
class MenuSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MenuSectionCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Material(
          color: theme.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.5,
          ),
          borderRadius: BorderRadius.circular(18),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (var i = 0; i < children.length; i++) ...[
                if (i > 0) const Divider(height: 1, indent: 68),
                children[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';

/// One row of a [MenuSection] card. [trailing] defaults to a chevron.
class MenuItem extends StatelessWidget {
  final String title;
  final String icLeft;
  final VoidCallback onTap;
  final Widget? trailing;

  const MenuItem({
    super.key,
    required this.title,
    required this.icLeft,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: scheme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgWidget(
                ic: icLeft,
                width: 20,
                height: 20,
                color: scheme.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleSmall!.copyWith(fontSize: 15),
              ),
            ),
            trailing ??
                Icon(
                  Icons.chevron_right_rounded,
                  color: scheme.onSurfaceVariant,
                ),
          ],
        ),
      ),
    );
  }
}

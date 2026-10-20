import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/brand_name.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/assets.dart';
import 'package:vibezone/core/configs/constants/icons.dart';
import 'package:vibezone/core/utils/responsive.dart';

class HomeHeader extends StatelessWidget {
  final String username;
  final VoidCallback onSearchTap;

  const HomeHeader({
    super.key,
    required this.username,
    required this.onSearchTap,
  });

  String _greeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour < 12) return S.of(context).txt_good_morning;
    if (hour < 18) return S.of(context).txt_good_afternoon;
    return S.of(context).txt_good_evening;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 22, backgroundImage: AssetImage(avatar)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_greeting(context), style: theme.textTheme.bodySmall),
                  if (username.isEmpty)
                    BrandName(fontSize: theme.textTheme.titleLarge!.fontSize!)
                  else
                    Text(
                      '$username ✨',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge,
                    ),
                ],
              ),
            ),
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
            ),
          ],
        ),
        const SizedBox(height: Spacing.x4),
        Text(
          S.of(context).txt_what_to_listen,
          style: theme.textTheme.displaySmall!.copyWith(fontSize: 22),
        ),
        const SizedBox(height: Spacing.x4),
        InkWell(
          onTap: onSearchTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.x4,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SvgWidget(
                  ic: icSearch,
                  width: 20,
                  height: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    S.of(context).hint_search,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

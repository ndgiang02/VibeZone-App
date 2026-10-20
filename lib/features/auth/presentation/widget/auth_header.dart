import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/brand_name.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/configs/constants/icons.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showLogo;

  const AuthHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (showLogo) ...[
          const SvgWidget(ic: icLogo),
          const SizedBox(height: 12),
          const BrandName(fontSize: 28),
          const SizedBox(height: 28),
        ],
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}

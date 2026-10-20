import 'package:flutter/material.dart';

/// App wordmark: "Vibe" in the text color, "Zone" in the primary color.
class BrandName extends StatelessWidget {
  final double fontSize;
  final Color? color;

  const BrandName({super.key, this.fontSize = 24, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
      color: color ?? theme.colorScheme.onSurface,
    );
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          const TextSpan(text: 'Vibe'),
          TextSpan(
            text: 'Zone',
            style: TextStyle(color: theme.colorScheme.primary),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

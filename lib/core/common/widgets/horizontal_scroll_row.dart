import 'package:flutter/material.dart';

/// Horizontally scrolling row that sizes its height to the tallest child,
/// so cards never overflow a hard-coded height when text scales up.
/// Meant for short lists (a few dozen items) since children aren't lazy.
class HorizontalScrollRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const HorizontalScrollRow({
    super.key,
    required this.children,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing,
        children: children,
      ),
    );
  }
}

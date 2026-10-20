import 'package:flutter/material.dart';
import 'package:vibezone/core/utils/responsive.dart';

/// Centers [child] and caps its width, so layouts designed for phones don't
/// stretch across tablet screens.
class MaxWidthBox extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const MaxWidthBox({
    super.key,
    this.maxWidth = Breakpoints.content,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // heightFactor 1 keeps the box as tall as the child, so it never
    // stretches vertically or shifts content to the middle of the screen.
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}

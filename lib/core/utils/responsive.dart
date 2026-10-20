import 'dart:math' as math;

import 'package:flutter/material.dart';

class Responsive {
  static width(double size, BuildContext context) {
    return MediaQuery.of(context).size.width * (size / 100);
  }

  static height(double size, BuildContext context) {
    return MediaQuery.of(context).size.height * (size / 100);
  }

  /// [size] percent of the screen width, kept within [min]..[max] so cards
  /// don't get tiny on small phones or huge on tablets.
  static double clampWidth(
    double size,
    BuildContext context, {
    required double min,
    required double max,
  }) {
    return (MediaQuery.sizeOf(context).width * (size / 100)).clamp(min, max);
  }

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).shortestSide >= Breakpoints.tablet;

  /// Side padding that keeps content at most [maxWidth] wide and centered,
  /// while never going below [min] on phones.
  static double horizontalPadding(
    BuildContext context, {
    double maxWidth = Breakpoints.content,
    double min = Spacing.x4,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    return math.max(min, (width - maxWidth) / 2);
  }
}

class Breakpoints {
  /// Shortest side at which a device is treated as a tablet.
  static const double tablet = 600;

  /// Max width of main content (feeds, lists, settings).
  static const double content = 720;

  /// Max width of forms (login, sign up, ...) and the player controls.
  static const double form = 480;

  /// Max width of the bottom navigation bar.
  static const double bottomBar = 560;
}

class Spacing {
  static const double x0 = 0;
  static const double x1 = 2;
  static const double x2 = 4;
  static const double x3 = 8;
  static const double x4 = 16;
  static const double x5 = 24;
  static const double x6 = 32;
}

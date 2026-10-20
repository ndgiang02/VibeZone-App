import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final double centerX;
  final double dipWidth;
  final double dipHeight;
  final double dipRadius;
  final double softCurveHeight;

  Painter({
    required this.centerX,
    required this.dipWidth,
    required this.dipHeight,
    required this.dipRadius,
    this.softCurveHeight = 30.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final double left = centerX - dipWidth / 2;
    final double right = centerX + dipWidth / 2;

    path.moveTo(0, 0);
    path.lineTo(left - softCurveHeight, 0);

    path.quadraticBezierTo(left, 0, left, softCurveHeight);

    path.lineTo(left, dipHeight - dipRadius);
    path.quadraticBezierTo(left, dipHeight, left + dipRadius, dipHeight);

    path.lineTo(right - dipRadius, dipHeight);
    path.quadraticBezierTo(right, dipHeight, right, dipHeight - dipRadius);

    path.lineTo(right, softCurveHeight);
    path.quadraticBezierTo(right, 0, right + softCurveHeight, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.15), 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return oldDelegate.centerX != centerX ||
        oldDelegate.dipWidth != dipWidth ||
        oldDelegate.dipHeight != dipHeight ||
        oldDelegate.dipRadius != dipRadius ||
        oldDelegate.softCurveHeight != softCurveHeight;
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/utils/responsive.dart';

class SongAlbum extends StatelessWidget {
  final String? imagePath;
  const SongAlbum({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Fit both dimensions so the controls stay visible on short screens.
    final screen = MediaQuery.sizeOf(context);
    // and never wider than the centered player column on tablets.
    final size = [
      screen.width * 0.8,
      screen.height * 0.42,
      Breakpoints.form - 40,
    ].reduce(math.min);
    return Hero(
      tag: 'player-artwork',
      child: imagePath != null
          ? AppImage(
              url: imagePath!,
              width: size,
              height: size,
              borderRadius: BorderRadius.circular(16.0),
            )
          : _fallback(size),
    );
  }

  Widget _fallback(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Icon(Icons.music_note, size: 100, color: Colors.grey),
    );
  }
}

import 'package:flutter/material.dart';

class PlayTime extends StatelessWidget {
  final double currentPosition;
  final double totalDuration;

  const PlayTime({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
  });

  String _format(double seconds) {
    final duration = Duration(seconds: seconds.round());
    final m = duration.inMinutes;
    final s = duration.inSeconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _format(currentPosition),
            style: const TextStyle(color: Colors.white70),
          ),
          Text(
            _format(totalDuration),
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

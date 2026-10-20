import 'package:flutter/material.dart';

class PlayProgress extends StatelessWidget {
  final double position;
  final double total;
  final ValueChanged<double> onSeek;

  const PlayProgress({
    super.key,
    required this.position,
    required this.total,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Theme.of(context).primaryColor,
        inactiveTrackColor: Colors.white30,
        thumbColor: Theme.of(context).primaryColor,
        overlayColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
      ),
      child: Slider(
        value: total > 0 ? (position / total).clamp(0.0, 1.0) : 0.0,
        onChanged: (value) => onSeek(value * total),
      ),
    );
  }
}

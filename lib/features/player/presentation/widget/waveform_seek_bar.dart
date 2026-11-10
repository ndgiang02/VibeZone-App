import 'dart:math' as math;

import 'package:flutter/material.dart';

/// SoundCloud-style waveform: bars above a baseline with a fainter reflection
/// below it. The played part is highlighted; tap or drag to seek.
class WaveformSeekBar extends StatefulWidget {
  /// Loudness peaks in 0..1 from the API; a flat placeholder when empty.
  final List<double> peaks;
  final double position;
  final double total;
  final ValueChanged<double> onSeek;

  const WaveformSeekBar({
    super.key,
    required this.peaks,
    required this.position,
    required this.total,
    required this.onSeek,
  });

  @override
  State<WaveformSeekBar> createState() => _WaveformSeekBarState();
}

class _WaveformSeekBarState extends State<WaveformSeekBar> {
  /// Position under the finger while dragging, so it doesn't jump back
  /// between position ticks.
  double? _dragProgress;

  double get _progress =>
      _dragProgress ??
      (widget.total > 0 ? (widget.position / widget.total).clamp(0.0, 1.0) : 0);

  double _fractionAt(Offset local, double width) =>
      (local.dx / width).clamp(0.0, 1.0);

  static String _format(double seconds) {
    final duration = Duration(seconds: seconds.round());
    final s = duration.inSeconds % 60;
    return '${duration.inMinutes}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final dragging = _dragProgress != null;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapUp: (d) =>
              widget.onSeek(_fractionAt(d.localPosition, width) * widget.total),
          onHorizontalDragStart: (d) => setState(
            () => _dragProgress = _fractionAt(d.localPosition, width),
          ),
          onHorizontalDragUpdate: (d) => setState(
            () => _dragProgress = _fractionAt(d.localPosition, width),
          ),
          onHorizontalDragEnd: (_) {
            widget.onSeek(_progress * widget.total);
            setState(() => _dragProgress = null);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: dragging ? 1.15 : 1,
                duration: const Duration(milliseconds: 150),
                child: _TimeLabel(
                  '${_format(_progress * widget.total)}  |  '
                  '${_format(widget.total)}',
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: width,
                height: 96,
                // Bars grow in whenever a new song's waveform arrives.
                child: TweenAnimationBuilder<double>(
                  key: ValueKey(widget.peaks),
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOutCubic,
                  builder: (context, reveal, _) => CustomPaint(
                    painter: _WaveformPainter(
                      peaks: widget.peaks,
                      progress: _progress,
                      reveal: reveal,
                      playedColor: color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TimeLabel extends StatelessWidget {
  final String text;

  const _TimeLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      color: Colors.black.withValues(alpha: 0.75),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  static const _barWidth = 2.5;
  static const _gap = 1.5;

  /// Share of the height above the baseline; the rest is the reflection.
  static const _upper = 0.66;

  /// Bar height used while there is no waveform for the song.
  static const _placeholder = 0.08;

  final List<double> peaks;
  final double progress;
  final double reveal;
  final Color playedColor;

  _WaveformPainter({
    required this.peaks,
    required this.progress,
    required this.reveal,
    required this.playedColor,
  });

  /// One value per bar: the loudest peak in each bucket, so short hits
  /// aren't averaged away.
  List<double> _bars(int count) {
    if (peaks.isEmpty) return List.filled(count, _placeholder);
    final bars = List<double>.filled(count, 0);
    for (var i = 0; i < count; i++) {
      final start = i * peaks.length ~/ count;
      final end = math.max(start + 1, (i + 1) * peaks.length ~/ count);
      for (var j = start; j < end && j < peaks.length; j++) {
        bars[i] = math.max(bars[i], peaks[j]);
      }
    }
    return bars;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final count = (size.width / (_barWidth + _gap)).floor();
    if (count <= 0) return;
    final bars = _bars(count);
    final step = size.width / count;
    final baseline = size.height * _upper;
    final playedX = size.width * progress;

    final played = Paint()..color = playedColor;
    final playedReflection = Paint()
      ..color = playedColor.withValues(alpha: 0.45);
    final rest = Paint()..color = Colors.white.withValues(alpha: 0.85);
    final restReflection = Paint()..color = Colors.white.withValues(alpha: 0.3);

    for (var i = 0; i < count; i++) {
      final value = math.max(0.02, bars[i] * reveal);
      final x = i * step + (step - _barWidth) / 2;
      final isPlayed = x + _barWidth / 2 <= playedX;
      final up = value * baseline;
      final down = value * (size.height - baseline);
      canvas
        ..drawRect(
          Rect.fromLTWH(x, baseline - up, _barWidth, up),
          isPlayed ? played : rest,
        )
        ..drawRect(
          Rect.fromLTWH(x, baseline + 1, _barWidth, down),
          isPlayed ? playedReflection : restReflection,
        );
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter old) =>
      old.peaks != peaks ||
      old.progress != progress ||
      old.reveal != reveal ||
      old.playedColor != playedColor;
}

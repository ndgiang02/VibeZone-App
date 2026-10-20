class FormatUtils {
  /// 225 -> "3:45"
  static String duration(num seconds) {
    final value = Duration(seconds: seconds.round());
    final m = value.inMinutes;
    final s = value.inSeconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  /// 1234567 -> "1.2M"
  static String compact(int value) {
    if (value >= 1000000000)
      return '${(value / 1000000000).toStringAsFixed(1)}B';
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
    return value.toString();
  }
}

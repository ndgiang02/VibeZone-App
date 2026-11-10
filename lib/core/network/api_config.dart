import 'package:flutter/foundation.dart';

class ApiConfig {
  static const _fromEnv = String.fromEnvironment('API_BASE_URL');

  /// Override with `--dart-define=API_BASE_URL=...`, e.g.
  /// `http://10.0.2.2:3001` (Android emulator) or `http://localhost:3001`
  /// for the local Docker stack.
  static String get baseUrl =>
      _fromEnv.isNotEmpty ? _fromEnv : 'https://api.vibezone.io.vn';

  static const connectTimeout = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 30);

  /// Shown in the user's signed-in devices list.
  static String get deviceName => 'VibeZone ${defaultTargetPlatform.name}';

  /// Image and media URLs from the API are relative to [baseUrl].
  static String resolveUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    return Uri.parse(baseUrl).resolve(path).toString();
  }
}

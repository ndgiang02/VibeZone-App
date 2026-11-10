import 'package:vibezone/core/storage/local_storage.dart';

/// Keeps the token pair in secure storage, with the access token cached in
/// memory so every request doesn't hit the keychain. Never log the tokens.
class TokenStorage {
  static const accessTokenKey = 'access_token';
  static const refreshTokenKey = 'refresh_token';

  final LocalStorage storage;
  String? _accessToken;

  TokenStorage(this.storage);

  Future<String?> accessToken() async =>
      _accessToken ??= await storage.readValue(accessTokenKey);

  Future<String?> refreshToken() async =>
      await storage.readValue(refreshTokenKey);

  Future<void> save({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    await storage.setValue(accessTokenKey, accessToken);
    await storage.setValue(refreshTokenKey, refreshToken);
  }

  Future<void> clear() async {
    _accessToken = null;
    await storage.clearValue(accessTokenKey);
    await storage.clearValue(refreshTokenKey);
  }
}

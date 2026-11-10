import 'dart:math';

import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/network/api_client.dart';
import 'package:vibezone/core/network/api_config.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/core/network/token_storage.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Signs in, stores the token pair and returns the account.
  Future<UserModel> login(String email, String password);

  Future<UserModel> getMe();

  Future<void> register(
    String name,
    String email,
    String password, {
    required String locale,
  });

  Future<void> sendPasswordResetEmail(String email);

  /// Revokes the refresh token on the server and forgets both tokens.
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static const _maxHandleAttempts = 3;

  final ApiClient client;
  final TokenStorage tokens;

  AuthRemoteDataSourceImpl({required this.client, required this.tokens});

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      ApiEndpoints.token,
      auth: false,
      data: {
        'email': email,
        'password': password,
        'deviceName': ApiConfig.deviceName,
      },
    );
    final token = response.object;
    await tokens.save(
      accessToken: token['accessToken'] as String,
      refreshToken: token['refreshToken'] as String,
    );
    return getMe();
  }

  @override
  Future<UserModel> getMe() async {
    final response = await client.get(ApiEndpoints.me);
    return UserModel.fromJson(response.object);
  }

  /// The sign-up form has no handle field, so one is derived from the email
  /// and suffixed with random digits when it is already taken.
  @override
  Future<void> register(
    String name,
    String email,
    String password, {
    required String locale,
  }) async {
    final base = _handleFrom(email);
    for (var attempt = 0; ; attempt++) {
      final handle = attempt == 0
          ? base
          : '${base}_${Random().nextInt(9000) + 1000}';
      try {
        await client.post(
          ApiEndpoints.register,
          auth: false,
          data: {
            'email': email,
            'handle': handle,
            'password': password,
            'displayName': name,
            'locale': locale,
          },
        );
        return;
      } on ServerException catch (e) {
        final handleUnavailable =
            e.message == handleTaken || e.message == handleReserved;
        if (!handleUnavailable || attempt + 1 >= _maxHandleAttempts) rethrow;
      }
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await client.post(
      ApiEndpoints.forgotPassword,
      auth: false,
      data: {'email': email},
    );
  }

  @override
  Future<void> logout() async {
    final refreshToken = await tokens.refreshToken();
    try {
      if (refreshToken != null) {
        await client.post(
          ApiEndpoints.revokeToken,
          auth: false,
          data: {'refreshToken': refreshToken},
        );
      }
    } finally {
      // Sign out locally even when the server can't be reached.
      await tokens.clear();
    }
  }

  /// handle: 3–30 chars of a-z 0-9 _ -.
  static String _handleFrom(String email) {
    var handle = email
        .split('@')
        .first
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9_-]'), '');
    if (handle.length < 3) handle = '${handle}user';
    // Leaves room for the "_1234" suffix.
    return handle.length > 25 ? handle.substring(0, 25) : handle;
  }
}

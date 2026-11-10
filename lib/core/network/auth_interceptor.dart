import 'package:dio/dio.dart';
import 'package:vibezone/core/network/api_endpoints.dart';
import 'package:vibezone/core/network/token_storage.dart';

/// Adds the bearer token and, on 401, refreshes it once and retries.
///
/// Refresh tokens are single use, so only one refresh may run at a time:
/// [QueuedInterceptor] handles errors one by one, and a request that waited
/// while another one refreshed just retries with the new token.
class AuthInterceptor extends QueuedInterceptor {
  /// Set `extra: {noAuth: true}` on requests that must go without a token.
  static const noAuth = 'noAuth';
  static const _retried = 'retried';

  /// A client without this interceptor, used to refresh and to retry.
  /// Retrying through the main client would deadlock the error queue.
  final Dio plainDio;
  final TokenStorage tokens;

  /// Called when the refresh token is rejected: the user must sign in again.
  final Future<void> Function() onSessionExpired;

  AuthInterceptor({
    required this.plainDio,
    required this.tokens,
    required this.onSessionExpired,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[noAuth] != true) {
      final token = await tokens.accessToken();
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    if (err.response?.statusCode != 401 ||
        options.extra[noAuth] == true ||
        options.extra[_retried] == true) {
      return handler.next(err);
    }

    final String accessToken;
    try {
      final current = await tokens.accessToken();
      final sent = options.headers['Authorization'];
      accessToken = current != null && sent != 'Bearer $current'
          ? current // Another request already refreshed.
          : await refresh();
    } on DioException {
      return handler.next(err);
    }

    options
      ..extra[_retried] = true
      ..headers['Authorization'] = 'Bearer $accessToken';
    try {
      handler.resolve(await plainDio.fetch(options));
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  Future<String>? _refreshing;

  /// Gets a new token pair now, e.g. after the user's roles changed. Shares
  /// a refresh that is already running instead of starting a second one.
  Future<String> refresh() =>
      _refreshing ??= _refresh().whenComplete(() => _refreshing = null);

  Future<String> _refresh() async {
    final refreshToken = await tokens.refreshToken();
    if (refreshToken == null) {
      throw DioException(requestOptions: RequestOptions());
    }
    try {
      final response = await plainDio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      final accessToken = data['accessToken'] as String;
      await tokens.save(
        accessToken: accessToken,
        refreshToken: data['refreshToken'] as String,
      );
      return accessToken;
    } on DioException catch (e) {
      // Only a rejected token ends the session, not a dropped connection.
      final status = e.response?.statusCode;
      if (status == 400 || status == 401) {
        await tokens.clear();
        await onSessionExpired();
      }
      rethrow;
    }
  }
}

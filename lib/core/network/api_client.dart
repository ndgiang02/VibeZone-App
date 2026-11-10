import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/network/api_config.dart';
import 'package:vibezone/core/network/api_response.dart';
import 'package:vibezone/core/network/auth_interceptor.dart';
import 'package:vibezone/core/network/token_storage.dart';

/// Thin wrapper over [Dio]: unwraps the `{data, meta}` envelope and turns
/// every failure into a [ServerException] whose message is the API's stable
/// error `code` (RFC 9457 Problem Details), e.g. `invalid_credentials`.
class ApiClient {
  final Dio dio;
  final AuthInterceptor? _auth;

  ApiClient(this.dio, [this._auth]);

  factory ApiClient.create({
    required TokenStorage tokens,
    required Future<void> Function() onSessionExpired,
  }) {
    final options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    final dio = Dio(options);
    final auth = AuthInterceptor(
      plainDio: Dio(options),
      tokens: tokens,
      onSessionExpired: onSessionExpired,
    );
    dio.interceptors.add(auth);
    if (kDebugMode) {
      // Headers are left out so tokens never reach the logs.
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          requestBody: false,
          responseBody: false,
          logPrint: (o) => debugPrint(o.toString()),
        ),
      );
    }
    return ApiClient(dio, auth);
  }

  /// Gets a new access token, so it carries the user's current roles.
  Future<void> refreshToken() async {
    try {
      await _auth?.refresh();
    } on DioException catch (e) {
      throw _toException(e);
    }
  }

  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? query,
    bool auth = true,
  }) => _send(
    () => dio.get(path, queryParameters: query, options: _options(auth)),
  );

  Future<ApiResponse> post(
    String path, {
    Object? data,
    bool auth = true,
    ProgressCallback? onSendProgress,
  }) => _send(
    () => dio.post(
      path,
      data: data,
      options: _options(auth),
      onSendProgress: onSendProgress,
    ),
  );

  Future<ApiResponse> put(String path, {Object? data, bool auth = true}) =>
      _send(() => dio.put(path, data: data, options: _options(auth)));

  /// Sends the image [file] as the raw request body, not multipart. It is
  /// read into memory (≤ 10 MB) so a retry after a token refresh can resend it.
  Future<ApiResponse> putImage(String path, File file) async {
    final bytes = await file.readAsBytes();
    return _send(
      () => dio.put(
        path,
        data: bytes,
        options: Options(contentType: _imageContentType(file.path)),
      ),
    );
  }

  Future<ApiResponse> patch(String path, {Object? data, bool auth = true}) =>
      _send(() => dio.patch(path, data: data, options: _options(auth)));

  Future<ApiResponse> delete(String path, {Object? data, bool auth = true}) =>
      _send(() => dio.delete(path, data: data, options: _options(auth)));

  Options _options(bool auth) =>
      Options(extra: {AuthInterceptor.noAuth: !auth});

  static String _imageContentType(String path) {
    final ext = path.split('.').last.toLowerCase();
    return switch (ext) {
      'png' => 'image/png',
      'webp' => 'image/webp',
      _ => 'image/jpeg',
    };
  }

  Future<ApiResponse> _send(Future<Response> Function() request) async {
    try {
      final response = await request();
      return ApiResponse.fromBody(response.data);
    } on DioException catch (e) {
      throw _toException(e);
    }
  }

  ServerException _toException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const ServerException(networkError);
      default:
        break;
    }
    final status = e.response?.statusCode;
    final body = e.response?.data;
    final code = body is Map && body['code'] is String
        ? body['code'] as String
        : status == 429
        ? tooManyRequests
        : unknownError;
    final errors = body is Map && body['errors'] is Map
        ? (body['errors'] as Map).map(
            (key, value) => MapEntry(
              key.toString(),
              (value as List).map((e) => e.toString()).toList(),
            ),
          )
        : const <String, List<String>>{};
    return ServerException(code, statusCode: status, fieldErrors: errors);
  }
}

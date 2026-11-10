class ServerException implements Exception {
  /// A stable error code (see `errors.dart`), not a message to show as is.
  final String message;
  final int? statusCode;

  /// Validation errors: field name → error codes.
  final Map<String, List<String>> fieldErrors;

  const ServerException(
    this.message, {
    this.statusCode,
    this.fieldErrors = const {},
  });

  @override
  String toString() => 'ServerException($statusCode, $message)';
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);
}

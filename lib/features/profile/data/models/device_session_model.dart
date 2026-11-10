import 'package:vibezone/features/profile/domain/entities/device_session.dart';

class DeviceSessionModel extends DeviceSession {
  const DeviceSessionModel({
    required super.id,
    required super.name,
    super.createdAt,
    super.lastSeenAt,
    super.isCurrent,
  });

  /// From the API's session DTO (`GET /api/v1/me/sessions`).
  factory DeviceSessionModel.fromJson(Map<String, dynamic> json) =>
      DeviceSessionModel(
        id: json['id'] as String,
        name: json['userAgent'] as String? ?? '',
        createdAt: DateTime.tryParse(json['createdAt'] as String? ?? ''),
        lastSeenAt: DateTime.tryParse(json['lastSeenAt'] as String? ?? ''),
        isCurrent: json['isCurrent'] as bool? ?? false,
      );
}

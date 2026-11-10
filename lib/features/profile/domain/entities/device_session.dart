import 'package:equatable/equatable.dart';

/// A signed-in device (an app sign-in or a browser session).
class DeviceSession extends Equatable {
  final String id;

  /// The device name for apps, the browser's user agent otherwise.
  final String name;
  final DateTime? createdAt;
  final DateTime? lastSeenAt;
  final bool isCurrent;

  const DeviceSession({
    required this.id,
    required this.name,
    this.createdAt,
    this.lastSeenAt,
    this.isCurrent = false,
  });

  @override
  List<Object?> get props => [id, name, createdAt, lastSeenAt, isCurrent];
}

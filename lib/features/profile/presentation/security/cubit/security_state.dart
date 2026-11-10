part of 'security_cubit.dart';

@freezed
abstract class SecurityState with _$SecurityState {
  /// [revokingId] while signing out every other device.
  static const allOthers = '*';

  const factory SecurityState({
    @Default(PageState.init) PageState sessionsStatus,
    @Default(<DeviceSession>[]) List<DeviceSession> sessions,
    @Default(false) bool isChangingPassword,

    /// The session being signed out, or [allOthers].
    String? revokingId,
    @Default(0) int revokedCount,
    PageCommand? pageCommand,
  }) = _SecurityState;
}

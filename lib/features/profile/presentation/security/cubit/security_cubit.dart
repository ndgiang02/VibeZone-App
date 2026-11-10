import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/profile/domain/entities/device_session.dart';
import 'package:vibezone/features/profile/domain/usecases/account_usecases.dart';

part 'security_cubit.freezed.dart';
part 'security_state.dart';

/// Change password and the signed-in devices list.
class SecurityCubit extends Cubit<SecurityState> {
  /// [PageCommandShowSuccess] messages, localized by the screen.
  static const msgPasswordChanged = 'password_changed';
  static const msgSessionsRevoked = 'sessions_revoked';

  final ChangePasswordUseCase _changePassword;
  final GetSessionsUseCase _getSessions;
  final RevokeSessionUseCase _revokeSession;
  final RevokeOtherSessionsUseCase _revokeOtherSessions;

  SecurityCubit(
    this._changePassword,
    this._getSessions,
    this._revokeSession,
    this._revokeOtherSessions,
  ) : super(const SecurityState());

  Future<void> loadSessions() async {
    emit(state.copyWith(sessionsStatus: PageState.loading));
    final result = await _getSessions(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          sessionsStatus: PageState.error,
          pageCommand: PageCommandShowError(failure.message),
        ),
      ),
      (sessions) => emit(
        state.copyWith(
          sessionsStatus: PageState.success,
          // This device first, then the most recently used.
          sessions: [...sessions]
            ..sort((a, b) {
              if (a.isCurrent != b.isCurrent) return a.isCurrent ? -1 : 1;
              final aSeen = a.lastSeenAt ?? DateTime(0);
              return (b.lastSeenAt ?? DateTime(0)).compareTo(aSeen);
            }),
        ),
      ),
    );
  }

  /// Returns whether it succeeded, so the form can be cleared.
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(state.copyWith(isChangingPassword: true));
    final result = await _changePassword(
      ChangePasswordParams(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
    );
    emit(state.copyWith(isChangingPassword: false));
    return result.fold(
      (failure) {
        emit(
          state.copyWith(pageCommand: PageCommandShowError(failure.message)),
        );
        return false;
      },
      (_) {
        emit(
          state.copyWith(
            pageCommand: PageCommandShowSuccess(msgPasswordChanged),
            // The other sessions were signed out.
            sessions: state.sessions.where((s) => s.isCurrent).toList(),
          ),
        );
        return true;
      },
    );
  }

  Future<void> revokeSession(String id) async {
    emit(state.copyWith(revokingId: id));
    final result = await _revokeSession(id);
    result.fold(
      (failure) => emit(
        state.copyWith(
          revokingId: null,
          pageCommand: PageCommandShowError(failure.message),
        ),
      ),
      (_) => emit(
        state.copyWith(
          revokingId: null,
          sessions: state.sessions.where((s) => s.id != id).toList(),
        ),
      ),
    );
  }

  Future<void> revokeOtherSessions() async {
    emit(state.copyWith(revokingId: SecurityState.allOthers));
    final result = await _revokeOtherSessions(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          revokingId: null,
          pageCommand: PageCommandShowError(failure.message),
        ),
      ),
      (count) => emit(
        state.copyWith(
          revokingId: null,
          revokedCount: count,
          sessions: state.sessions.where((s) => s.isCurrent).toList(),
          pageCommand: PageCommandShowSuccess(msgSessionsRevoked),
        ),
      ),
    );
  }
}

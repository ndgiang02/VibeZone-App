import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_validator.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPassword;

  ForgotPasswordBloc(this._forgotPassword)
    : super(const ForgotPasswordState()) {
    on<_OnChangeEmail>(
      (event, emit) => emit(state.copyWith(email: event.value, errEmail: null)),
    );
    on<_OnSubmit>(_onSubmit);
    on<_OnResend>((event, emit) => _send(emit));
    on<_OnClearPage>((event, emit) => emit(state.copyWith(pageCommand: null)));
  }

  Future<void> _onSubmit(
    _OnSubmit event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final errEmail = AuthValidator(S.of(event.ctx)).email(state.email);
    if (errEmail != null) {
      emit(state.copyWith(errEmail: errEmail));
      return;
    }
    await _send(emit);
  }

  Future<void> _send(Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(status: PageState.loading));
    final result = await _forgotPassword(state.email);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PageState.error,
          pageCommand: PageCommandShowAlertError(failure.message),
        ),
      ),
      (_) => emit(state.copyWith(status: PageState.success, isSent: true)),
    );
  }
}

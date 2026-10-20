import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/features/auth/domain/usecases/register_usecase.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_validator.dart';

part 'signup_bloc.freezed.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterUseCase _register;

  SignupBloc(this._register) : super(const SignupState()) {
    on<_OnChangeName>(
      (event, emit) => emit(state.copyWith(name: event.value, errName: null)),
    );
    on<_OnChangeEmail>(
      (event, emit) => emit(state.copyWith(email: event.value, errEmail: null)),
    );
    on<_OnChangePassword>(
      (event, emit) =>
          emit(state.copyWith(password: event.value, errPassword: null)),
    );
    on<_OnChangeConfirmPassword>(
      (event, emit) => emit(
        state.copyWith(confirmPassword: event.value, errConfirmPassword: null),
      ),
    );
    on<_OnToggleAgree>(
      (event, emit) => emit(state.copyWith(isAgree: event.value)),
    );
    on<_OnSubmit>(_onSubmit);
    on<_OnClearPage>((event, emit) => emit(state.copyWith(pageCommand: null)));
  }

  Future<void> _onSubmit(_OnSubmit event, Emitter<SignupState> emit) async {
    final s = S.of(event.ctx);
    final validator = AuthValidator(s);
    final errName = validator.name(state.name);
    final errEmail = validator.email(state.email);
    final errPassword = validator.password(state.password);
    final errConfirm = validator.confirmPassword(
      state.password,
      state.confirmPassword,
    );
    emit(
      state.copyWith(
        errName: errName,
        errEmail: errEmail,
        errPassword: errPassword,
        errConfirmPassword: errConfirm,
      ),
    );
    if ([errName, errEmail, errPassword, errConfirm].any((e) => e != null)) {
      return;
    }
    if (!state.isAgree) {
      emit(
        state.copyWith(pageCommand: PageCommandShowToast(s.err_agree_terms)),
      );
      return;
    }

    emit(state.copyWith(status: PageState.loading));
    final result = await _register(
      RegisterParams(
        name: state.name,
        email: state.email,
        password: state.password,
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PageState.error,
          pageCommand: PageCommandShowAlertError(failure.message),
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: PageState.success,
          pageCommand: PageCommandNavigatorPage(argument: state.email.trim()),
        ),
      ),
    );
  }
}

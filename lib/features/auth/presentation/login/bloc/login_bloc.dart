import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/core/utils/dialog_utils.dart';
import 'package:vibezone/features/auth/domain/usecases/get_remembered_email_usecase.dart';
import 'package:vibezone/features/auth/domain/usecases/login_usecase.dart';
import 'package:vibezone/features/auth/presentation/utils/auth_validator.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _login;
  final GetRememberedEmailUseCase _getRememberedEmail;

  LoginBloc(this._login, this._getRememberedEmail) : super(LoginState()) {
    on<OnInitData>((event, emit) async {
      final result = await _getRememberedEmail(const NoParams());
      final email = result.getOrElse(() => '');
      emit(
        state.copyWith(
          isRememberMe: email.isNotEmpty,
          email: email,
          isEnable: _canSubmit(email, state.password),
        ),
      );
    });
    on<OnSelectedRemember>((event, emit) {
      emit(state.copyWith(isRememberMe: event.value));
    });
    on<OnChangePassword>((event, emit) {
      emit(
        state.copyWith(
          password: event.value,
          errPassword: null,
          isEnable: _canSubmit(state.email, event.value),
        ),
      );
    });
    on<OnChangeEmail>((event, emit) {
      emit(
        state.copyWith(
          email: event.value,
          errEmail: null,
          isEnable: _canSubmit(event.value, state.password),
        ),
      );
    });
    on<OnLogin>((event, emit) async {
      final email = (state.email ?? '').trim();
      final password = state.password ?? '';
      final validator = AuthValidator(S.of(event.ctx));
      final errEmail = validator.email(email);
      final errPassword = validator.password(password);
      if (errEmail != null || errPassword != null) {
        emit(state.copyWith(errEmail: errEmail, errPassword: errPassword));
      } else {
        emit(state.copyWith(status: PageState.loading));
        DialogUtils.loading();
        final result = await _login(
          LoginParams(
            email: email,
            password: password,
            rememberMe: state.isRememberMe,
          ),
        );
        DialogUtils.hideLoading();

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
              pageCommand: PageCommandNavigatorPage(page: '/main'),
            ),
          ),
        );
      }
    });
    on<OnNavigate>((event, emit) {
      emit(state.copyWith(pageCommand: event.pageCommand));
    });
    on<OnClearPage>((event, emit) {
      emit(state.copyWith(pageCommand: null));
    });
  }

  bool _canSubmit(String? email, String? password) =>
      (email?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false);
}

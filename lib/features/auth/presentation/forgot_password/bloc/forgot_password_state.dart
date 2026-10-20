part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const ForgotPasswordState._();

  const factory ForgotPasswordState({
    PageCommand? pageCommand,
    @Default(PageState.init) PageState status,
    @Default('') String email,
    @Default(false) bool isSent,
    String? errEmail,
  }) = _ForgotPasswordState;

  bool get isLoading => status == PageState.loading;
}

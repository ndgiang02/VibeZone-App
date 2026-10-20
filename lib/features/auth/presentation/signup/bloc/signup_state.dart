part of 'signup_bloc.dart';

@freezed
abstract class SignupState with _$SignupState {
  const SignupState._();

  const factory SignupState({
    PageCommand? pageCommand,
    @Default(PageState.init) PageState status,
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isAgree,
    String? errName,
    String? errEmail,
    String? errPassword,
    String? errConfirmPassword,
  }) = _SignupState;

  bool get isLoading => status == PageState.loading;

  bool get canSubmit =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;
}

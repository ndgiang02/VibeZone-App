part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onInitData() = OnInitData;
  const factory LoginEvent.onChangePassword(String value) = OnChangePassword;
  const factory LoginEvent.onChangeEmail(String value) = OnChangeEmail;
  const factory LoginEvent.onSelectedRemember(bool value) = OnSelectedRemember;
  const factory LoginEvent.onNavigate(PageCommand pageCommand) = OnNavigate;
  const factory LoginEvent.onLogin(BuildContext ctx) = OnLogin;
  const factory LoginEvent.onSignInGoogle() = OnSignInGoogle;
  const factory LoginEvent.onSignInFacebook() = OnSignInFacebook;
  const factory LoginEvent.onSignInApple() = OnSignInApple;
  const factory LoginEvent.onForgotPassword() = OnForgotPassword;
  const factory LoginEvent.onClearPage() = OnClearPage;
}

part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.onChangeEmail(String value) =
      _OnChangeEmail;
  const factory ForgotPasswordEvent.onSubmit(BuildContext ctx) = _OnSubmit;
  const factory ForgotPasswordEvent.onResend() = _OnResend;
  const factory ForgotPasswordEvent.onClearPage() = _OnClearPage;
}

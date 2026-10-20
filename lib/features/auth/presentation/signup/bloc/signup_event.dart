part of 'signup_bloc.dart';

@freezed
class SignupEvent with _$SignupEvent {
  const factory SignupEvent.onChangeName(String value) = _OnChangeName;
  const factory SignupEvent.onChangeEmail(String value) = _OnChangeEmail;
  const factory SignupEvent.onChangePassword(String value) = _OnChangePassword;
  const factory SignupEvent.onChangeConfirmPassword(String value) =
      _OnChangeConfirmPassword;
  const factory SignupEvent.onToggleAgree(bool value) = _OnToggleAgree;
  const factory SignupEvent.onSubmit(BuildContext ctx) = _OnSubmit;
  const factory SignupEvent.onClearPage() = _OnClearPage;
}

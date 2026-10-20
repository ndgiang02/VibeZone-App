part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.onInit() = _OnInit;
  const factory ProfileEvent.onChangeDarkMode() = _OnChangeDarkMode;
  const factory ProfileEvent.onChangeLanguage(String langName) =
      _OnChangeLanguage;
  const factory ProfileEvent.onLogout() = _OnLogout;
}

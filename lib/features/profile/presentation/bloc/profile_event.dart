part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.onInit() = _OnInit;
  const factory ProfileEvent.onChangeDarkMode() = _OnChangeDarkMode;
  const factory ProfileEvent.onChangeLanguage(Language language) =
      _OnChangeLanguage;
  const factory ProfileEvent.onLogout() = _OnLogout;
  const factory ProfileEvent.onUpdateName(String displayName) = _OnUpdateName;
  const factory ProfileEvent.onChangeAvatar(File image) = _OnChangeAvatar;
  const factory ProfileEvent.onRemoveAvatar() = _OnRemoveAvatar;
}

part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isDarkMode,
    String? languageName,
    PageCommand? pageCommand,
  }) = _ProfileState;
}

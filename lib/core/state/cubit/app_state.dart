part of 'app_cubit.dart';

@freezed
abstract class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    @Default(LanguageLocale.en) Locale locale,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppState;
}

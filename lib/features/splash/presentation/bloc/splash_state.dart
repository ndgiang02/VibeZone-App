part of 'splash_bloc.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool showButton,
    PageCommand? pageCmd,
  }) = _SplashState;
}

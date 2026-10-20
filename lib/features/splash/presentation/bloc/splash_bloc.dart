import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/injection.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<_Started>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      final loggedIn = getIt<SessionController>().isLogin;
      if (loggedIn) {
        emit(state.copyWith(pageCmd: PageCommandNavigatorPage(page: '/main')));
      } else {
        emit(state.copyWith(showButton: true));
      }
    });
  }
}

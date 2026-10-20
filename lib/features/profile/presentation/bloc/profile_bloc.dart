import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/core/utils/data_utils.dart';
import 'package:vibezone/features/auth/domain/usecases/logout_usecase.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LogoutUseCase _logout;

  ProfileBloc(this._logout) : super(const ProfileState()) {
    on<_OnInit>(_onInit);
    on<_OnLogout>(_onLogout);
    on<_OnChangeDarkMode>(_onChangeDarkMode);
    on<_OnChangeLanguage>(_onChangeLanguage);
  }

  Future _onInit(_OnInit event, Emitter<ProfileState> emit) async {
    final storage = SessionController().localStorage;

    String? localeCode = await storage.readValue('locale');
    localeCode ??= '';

    String langName = languages
        .firstWhere(
          (item) => item.code == localeCode,
          orElse: () => languages.first,
        )
        .name;

    emit(state.copyWith(isDarkMode: false, languageName: langName));
  }

  FutureOr _onChangeDarkMode(
    _OnChangeDarkMode event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  FutureOr _onChangeLanguage(
    _OnChangeLanguage event,
    Emitter<ProfileState> emit,
  ) {
    if (event.langName != state.languageName) {
      emit(state.copyWith(languageName: event.langName));
    }
  }

  Future<void> _onLogout(_OnLogout event, Emitter<ProfileState> emit) async {
    final result = await _logout(const NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(pageCommand: PageCommandShowError(failure.message)),
      ),
      (_) => emit(
        state.copyWith(pageCommand: PageCommandNavigatorPage(page: '/login')),
      ),
    );
  }
}

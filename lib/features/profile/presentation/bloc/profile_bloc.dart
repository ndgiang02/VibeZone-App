import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/core/utils/data_utils.dart';
import 'package:vibezone/core/utils/dialog_utils.dart';
import 'package:vibezone/features/auth/data/models/language/language.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/auth/domain/usecases/logout_usecase.dart';
import 'package:vibezone/features/profile/domain/usecases/account_usecases.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  /// [PageCommandShowSuccess] messages, localized by the screen.
  static const msgProfileUpdated = 'profile_updated';
  static const msgAvatarUpdated = 'avatar_updated';

  final LogoutUseCase _logout;
  final RefreshMeUseCase _refreshMe;
  final UpdateProfileUseCase _updateProfile;
  final SetAvatarUseCase _setAvatar;
  final RemoveAvatarUseCase _removeAvatar;

  ProfileBloc(
    this._logout,
    this._refreshMe,
    this._updateProfile,
    this._setAvatar,
    this._removeAvatar,
  ) : super(const ProfileState()) {
    on<_OnInit>(_onInit);
    on<_OnLogout>(_onLogout);
    on<_OnChangeDarkMode>(_onChangeDarkMode);
    on<_OnChangeLanguage>(_onChangeLanguage);
    on<_OnUpdateName>(_onUpdateName);
    on<_OnChangeAvatar>(_onChangeAvatar);
    on<_OnRemoveAvatar>(_onRemoveAvatar);
  }

  Future _onInit(_OnInit event, Emitter<ProfileState> emit) async {
    final session = SessionController();

    String? localeCode = await session.localStorage.readValue('locale');
    localeCode ??= '';

    String langName = languages
        .firstWhere(
          (item) => item.code == localeCode,
          orElse: () => languages.first,
        )
        .name;

    emit(
      state.copyWith(
        isDarkMode: false,
        languageName: langName,
        user: session.user,
      ),
    );

    // Picks up changes made on another device; the cached one stays on error.
    final result = await _refreshMe(const NoParams());
    result.fold((_) {}, (user) => emit(state.copyWith(user: user)));
  }

  FutureOr _onChangeDarkMode(
    _OnChangeDarkMode event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }

  /// Also saved on the account, so emails come in the user's language.
  Future<void> _onChangeLanguage(
    _OnChangeLanguage event,
    Emitter<ProfileState> emit,
  ) async {
    final language = event.language;
    if (language.name == state.languageName) return;
    emit(state.copyWith(languageName: language.name));
    final locale = language.code.split('_').first;
    if (locale == state.user?.locale) return;
    final result = await _updateProfile(UpdateProfileParams(locale: locale));
    result.fold((_) {}, (user) => emit(state.copyWith(user: user)));
  }

  Future<void> _onUpdateName(
    _OnUpdateName event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.displayName.trim() == state.user?.displayName) return;
    await _save(
      emit,
      () => _updateProfile(UpdateProfileParams(displayName: event.displayName)),
      msgProfileUpdated,
    );
  }

  Future<void> _onChangeAvatar(
    _OnChangeAvatar event,
    Emitter<ProfileState> emit,
  ) => _save(emit, () => _setAvatar(event.image), msgAvatarUpdated);

  Future<void> _onRemoveAvatar(
    _OnRemoveAvatar event,
    Emitter<ProfileState> emit,
  ) => _save(emit, () => _removeAvatar(const NoParams()), msgAvatarUpdated);

  Future<void> _save(
    Emitter<ProfileState> emit,
    Future<Either<Failure, UserModel>> Function() action,
    String successMessage,
  ) async {
    DialogUtils.loading();
    final result = await action();
    DialogUtils.hideLoading();
    result.fold(
      (failure) => emit(
        state.copyWith(pageCommand: PageCommandShowError(failure.message)),
      ),
      (user) => emit(
        state.copyWith(
          user: user,
          pageCommand: PageCommandShowSuccess(successMessage),
        ),
      ),
    );
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

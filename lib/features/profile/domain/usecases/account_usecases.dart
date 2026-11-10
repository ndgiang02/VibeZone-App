import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/profile/domain/entities/device_session.dart';
import 'package:vibezone/features/profile/domain/repositories/account_repository.dart';

class RefreshMeUseCase implements UseCase<UserModel, NoParams> {
  final AccountRepository repository;

  RefreshMeUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) =>
      repository.refreshMe();
}

class UpdateProfileUseCase implements UseCase<UserModel, UpdateProfileParams> {
  final AccountRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(UpdateProfileParams params) =>
      repository.updateProfile(
        displayName: params.displayName?.trim(),
        locale: params.locale,
      );
}

class UpdateProfileParams extends Equatable {
  final String? displayName;

  /// `vi` or `en`.
  final String? locale;

  const UpdateProfileParams({this.displayName, this.locale});

  @override
  List<Object?> get props => [displayName, locale];
}

class ChangePasswordUseCase implements UseCase<Unit, ChangePasswordParams> {
  final AccountRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) =>
      repository.changePassword(
        currentPassword: params.currentPassword,
        newPassword: params.newPassword,
      );
}

class ChangePasswordParams extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [currentPassword, newPassword];
}

class SetAvatarUseCase implements UseCase<UserModel, File> {
  final AccountRepository repository;

  SetAvatarUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(File image) =>
      repository.setAvatar(image);
}

class RemoveAvatarUseCase implements UseCase<UserModel, NoParams> {
  final AccountRepository repository;

  RemoveAvatarUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) =>
      repository.removeAvatar();
}

class GetSessionsUseCase implements UseCase<List<DeviceSession>, NoParams> {
  final AccountRepository repository;

  GetSessionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DeviceSession>>> call(NoParams params) =>
      repository.getSessions();
}

class RevokeSessionUseCase implements UseCase<Unit, String> {
  final AccountRepository repository;

  RevokeSessionUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) => repository.revokeSession(id);
}

class RevokeOtherSessionsUseCase implements UseCase<int, NoParams> {
  final AccountRepository repository;

  RevokeOtherSessionsUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(NoParams params) =>
      repository.revokeOtherSessions();
}

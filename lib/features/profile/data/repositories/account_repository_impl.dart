import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/profile/data/datasources/account_remote_data_source.dart';
import 'package:vibezone/features/profile/domain/entities/device_session.dart';
import 'package:vibezone/features/profile/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remote;
  final SessionController session;

  AccountRepositoryImpl({required this.remote, required this.session});

  @override
  Future<Either<Failure, UserModel>> refreshMe() => _guard(_saveMe);

  /// PATCH needs the full object, so missing fields keep their value.
  @override
  Future<Either<Failure, UserModel>> updateProfile({
    String? displayName,
    String? locale,
  }) => _guard(() async {
    final user = session.user;
    await remote.updateProfile(
      displayName: displayName ?? user.displayName,
      locale: locale ?? user.locale,
    );
    return _saveMe();
  });

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) => _guard(() async {
    await remote.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    return unit;
  });

  @override
  Future<Either<Failure, UserModel>> setAvatar(File image) => _guard(() async {
    await remote.setAvatar(image);
    return _saveMe();
  });

  @override
  Future<Either<Failure, UserModel>> removeAvatar() => _guard(() async {
    await remote.removeAvatar();
    return _saveMe();
  });

  @override
  Future<Either<Failure, List<DeviceSession>>> getSessions() =>
      _guard(remote.getSessions);

  @override
  Future<Either<Failure, Unit>> revokeSession(String id) => _guard(() async {
    await remote.revokeSession(id);
    return unit;
  });

  @override
  Future<Either<Failure, int>> revokeOtherSessions() =>
      _guard(remote.revokeOtherSessions);

  Future<UserModel> _saveMe() async {
    final user = await remote.getMe();
    await session.saveUserInPreference(user);
    return user;
  }

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure(unknownError));
    }
  }
}

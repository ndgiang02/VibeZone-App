import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/profile/domain/entities/device_session.dart';

/// The signed-in user's own account. Calls that change the profile return
/// the updated account, which is also saved to the session.
abstract class AccountRepository {
  Future<Either<Failure, UserModel>> refreshMe();

  Future<Either<Failure, UserModel>> updateProfile({
    String? displayName,
    String? locale,
  });

  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, UserModel>> setAvatar(File image);

  Future<Either<Failure, UserModel>> removeAvatar();

  Future<Either<Failure, List<DeviceSession>>> getSessions();

  Future<Either<Failure, Unit>> revokeSession(String id);

  Future<Either<Failure, int>> revokeOtherSessions();
}

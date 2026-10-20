import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
    required bool rememberMe,
  });

  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email);

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, String>> getRememberedEmail();
}

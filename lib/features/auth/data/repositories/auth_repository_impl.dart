import 'package:dartz/dartz.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const _defaultLocale = 'vi';

  final AuthRemoteDataSource remote;
  final SessionController session;

  AuthRepositoryImpl({required this.remote, required this.session});

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      final user = await remote.login(email, password);
      await session.saveUserInPreference(user);
      if (rememberMe) {
        await session.saveRememberMe(email);
      } else {
        await session.clearRememberMe();
      }
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure(unknownError));
    }
  }

  @override
  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) => _guard(() async {
    final saved = await session.getSavedLocale();
    final locale = saved == 'en' || saved == 'vi' ? saved! : _defaultLocale;
    await remote.register(name, email, password, locale: locale);
  });

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email) =>
      _guard(() => remote.sendPasswordResetEmail(email));

  Future<Either<Failure, Unit>> _guard(Future<void> Function() action) async {
    try {
      await action();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure(unknownError));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remote.logout();
    } catch (_) {
      // The tokens are already gone locally; the server session expires.
    }
    try {
      await session.clearSession();
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getRememberedEmail() async {
    try {
      return Right(await session.getRememberMe());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/auth/domain/repositories/auth_repository.dart';

/// Sends a password reset link to the given email.
class ForgotPasswordUseCase implements UseCase<Unit, String> {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String email) =>
      repository.sendPasswordResetEmail(email.trim());
}

import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/auth/domain/repositories/auth_repository.dart';

class GetRememberedEmailUseCase implements UseCase<String, NoParams> {
  final AuthRepository repository;

  GetRememberedEmailUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) =>
      repository.getRememberedEmail();
}

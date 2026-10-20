import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<Unit, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(RegisterParams params) {
    return repository.register(
      name: params.name.trim(),
      email: params.email.trim(),
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

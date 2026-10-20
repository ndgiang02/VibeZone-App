import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';
import 'package:vibezone/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<UserModel, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(LoginParams params) {
    return repository.login(
      email: params.email.trim(),
      password: params.password,
      rememberMe: params.rememberMe,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;

  const LoginParams({
    required this.email,
    required this.password,
    this.rememberMe = false,
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}

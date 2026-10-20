import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/features/auth/data/models/user/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Returns the logged in user and its access token.
  Future<(UserModel, String)> login(String email, String password);

  Future<void> register(String name, String email, String password);

  Future<void> sendPasswordResetEmail(String email);
}

/// Fake backend: accepts any well-formed input. Two reserved emails let the
/// error paths be exercised: [_blockedEmail] is an unknown account and
/// [_takenEmail] is already registered.
class AuthRemoteDataSourceMock implements AuthRemoteDataSource {
  static const _blockedEmail = 'notfound@vibezone.app';
  static const _takenEmail = 'taken@vibezone.app';

  @override
  Future<(UserModel, String)> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.toLowerCase() == _blockedEmail) {
      throw const ServerException(userNotFound);
    }

    final name = email.split('@').first;
    final user = UserModel(
      id: email.hashCode.abs(),
      username: name.isEmpty
          ? email
          : name[0].toUpperCase() + name.substring(1),
      email: email,
      createdAt: DateTime.now(),
    );
    return (user, 'mock-token-${user.id}');
  }

  @override
  Future<void> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (email.toLowerCase() == _takenEmail) {
      throw const ServerException(emailAlreadyInUse);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (email.toLowerCase() == _blockedEmail) {
      throw const ServerException(userNotFound);
    }
  }
}

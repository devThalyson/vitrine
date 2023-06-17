import 'package:login/features/login/domain/entities/user_entity.dart';
import 'package:login/features/login/domain/errors/login_error.dart';

import 'package:dartz/dartz.dart';
import 'package:login/features/login/domain/repositories/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<LoginError, UserEntity>> call(
      {required String email, required String password});
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecaseImpl({required this.loginRepository});

  @override
  Future<Either<LoginError, UserEntity>> call(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(
        LoginError(message: 'Email e senha são campos obrigatórios'),
      );
    }

    return await loginRepository.login(email: email, password: password);
  }
}

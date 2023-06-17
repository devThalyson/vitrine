import 'package:login/features/login/domain/entities/user_entity.dart';
import 'package:login/features/login/domain/errors/login_error.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<LoginError, UserEntity>> login({
    required String email,
    required String password,
  });
}

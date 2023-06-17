import 'package:dartz/dartz.dart';
import 'package:login/features/login/data/datasources/login_datasource.dart';
import 'package:login/features/login/data/models/user_model.dart';
import 'package:login/features/login/domain/entities/user_entity.dart';
import 'package:login/features/login/domain/errors/login_error.dart';
import 'package:login/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl({required this.loginDatasource});

  @override
  Future<Either<LoginError, UserEntity>> login(
      {required String email, required String password}) async {
    try {
      final result = await loginDatasource.login(email: email);

      return result.fold(
        (l) => Left(l),
        (r) {
          return Right(
            UserModel.fromMap(
              map: r,
            ),
          );
        },
      );
    } catch (e) {
      return Left(
        LoginError(
          message: 'Erro ao realizar login',
        ),
      );
    }
  }
}

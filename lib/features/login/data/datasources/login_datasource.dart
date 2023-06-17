import 'package:dartz/dartz.dart';
import 'package:login/core/services/api_service.dart';
import 'package:login/features/login/domain/errors/login_error.dart';

abstract class LoginDatasource {
  Future<Either<LoginError, Map<String, dynamic>>> login(
      {required String email, password});
}

class LoginDatasourceImpl implements LoginDatasource {
  final ApiService apiService;

  LoginDatasourceImpl({required this.apiService});

  @override
  Future<Either<LoginError, Map<String, dynamic>>> login(
      {required String email, password}) async {
    final response = await apiService.post(
        httpRequestParams: HttpRequestParams(
      url: 'loginUrl',
      header: {
        'qqq': 'asdasd',
      },
      body: {
        'email': email,
        'password': password,
      },
    ));

    if (response['statusCode'] != 200) {
      return Left(
        LoginError(
          message: response['message'],
          statusCode: response['statusCode'],
        ),
      );
    }

    return Right(
      response['body'],
    );
  }
}

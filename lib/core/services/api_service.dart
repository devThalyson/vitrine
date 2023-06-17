abstract class ApiService {
  Future<Map> post({
    required HttpRequestParams httpRequestParams,
  });
}

class ApiServiceImpl implements ApiService {
  @override
  Future<Map> post({required HttpRequestParams httpRequestParams}) async {
    return {
      'statusCode': 200,
      'message': 'Login com sucesso!',
      'data': {
        'email': 'devthalyson@gmail.com',
        'nome': 'Thalyson Moura',
      },
    };
  }
}

class HttpRequestParams {
  final String url;
  final Map<String, dynamic> header;
  final Map<String, dynamic>? body;

  HttpRequestParams({
    required this.url,
    required this.header,
    this.body,
  });
}

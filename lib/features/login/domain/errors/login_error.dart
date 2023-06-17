class LoginError {
  final String message;
  final int? statusCode;

  LoginError({
    required this.message,
    this.statusCode,
  });
}

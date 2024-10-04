sealed class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

final class AuthError implements AuthException {
  final String message;

  AuthError({required super.message});
}

final class AuthUnathorizedException implements AuthException {
  final String message;

  AuthUnathorizedException(): super(message: '');
}
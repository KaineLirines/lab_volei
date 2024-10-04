import 'package:logica_programacao_acadf/lab_clinicas/lib/src/exceptions/auth_exception.dart';

Abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);
}
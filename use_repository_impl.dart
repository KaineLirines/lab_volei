import 'package:logica_programacao_acadf/lab_clinicas/lib/src/exceptions/auth_exception.dart';
import 'package:logica_programacao_acadf/lab_clinicas/lib/src/fp/either.dart';
import 'package:logica_programacao_acadf/lab_clinicas/lib/src/repositories/user/user_repository.dart';
import 'package:logica_programacao_acadf/lab_clinicas/lib/src/restClient/rest_client.dart';

class UseRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.restClient,
  });
  
  final RestClient restClient;

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try{
      final Responsr(data: {'access_token': accessToken}) = 
        await restClient.unAuth.post('/auth',
          data: ('email': email, 'password': password, 'admin': true));
      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      return switch(e){
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) =>
          Left(AuthUnathorizedException()),
        _ => Left(AuthError(message: 'Erro ao realizar login'))
      };
    }
  } 

}
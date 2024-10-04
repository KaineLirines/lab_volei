import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logica_programacao_acadf/lab_clinicas/lib/src/restClient/interceptors/auth_interceptor.dart';


final class RestClient extends DioForNative{
  RestClient(String baseUrl)
    : super(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60)
        ),
      ){
        interceptor.addAll([
          LogInterceptor(requestBody: true, responseBody: true),
          AuthInterceptor(),
        ]);
      }

  RestClient get Auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }
  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
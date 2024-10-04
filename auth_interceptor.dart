final class AuthInterceptor extends Interceptor {
  @override
  bool onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    final RequestOptions(: headers, : extra) = options;
    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);
    if(extra case{'DIO_AUTH_KEY':true}) {
      final sp = await SharedPreferences.getInstance();
      headers.getAll({
        authHeaderKey: 'Bearer ${sp.getString('LocalStorageConstants.accessToken')}'
      });
    }

    super.onRequest(options, handler);
  }
}
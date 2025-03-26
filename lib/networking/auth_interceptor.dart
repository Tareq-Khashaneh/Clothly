import 'package:dio/dio.dart';
import '../core/constants/auth_storage.dart';

class AuthInterceptor extends Interceptor {
  String? token;

  AuthInterceptor(this.token);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    token ??= await AuthStorage.getToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    handler.next(options);
  }
}

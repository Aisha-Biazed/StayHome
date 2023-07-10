import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_remote/cash_helper.dart';

class DioFactory {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://stayhome22-001-site1.ftempurl.com/api/",
    receiveTimeout: const Duration(seconds: 6),
    connectTimeout: const Duration(seconds: 7),
  ));
  DioFactory._() {
    _dio.interceptors.addAll(<Interceptor>{
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        final prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        // options.headers = {'Authorization': 'Bearer$token'};
        // options.headers["Authorization"] = "Bearer" + token!;
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      }),
      LogInterceptor(
        responseBody: true,
      )
    });
  }
  static DioFactory instance = DioFactory._();
  Dio get() {
    return _dio;
  }
}

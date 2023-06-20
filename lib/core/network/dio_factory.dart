import 'package:dio/dio.dart';

class DioFactory {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://stayhome22-001-site1.ftempurl.com/api/",
    receiveTimeout: const Duration(seconds: 6),
    connectTimeout: const Duration(seconds: 7),
  ));
  DioFactory._() {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }
  static DioFactory instance = DioFactory._();
  Dio get() {
    return _dio;
  }
}

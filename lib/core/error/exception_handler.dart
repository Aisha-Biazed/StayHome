import 'dart:io';

import 'package:dio/dio.dart';

class ExceptionHandler {
  static String handle(Exception e) {
    if (e is SocketException) {
      return "يوجد مشكلة في الإنترنت";
    }
    if (e is FormatException) {
      return "يوجد خطأ في البيانات";
    }
    if (e is DioError) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.receiveTimeout) {
        return "حدث خطأ أثناء الاتصال";
      }
      if (e.type == DioErrorType.badResponse) {
        if (e.response?.statusCode == 500) {
          return " حدث خطأ أثناء الاتصال بالخادم";
        }
        if (e.response?.statusCode == 403) {
          return "غير مسموح";
        }
      }
    }
    return "خطأ ما";
  }
}

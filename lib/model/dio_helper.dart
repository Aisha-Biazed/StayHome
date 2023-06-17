import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

Future<Unit> getLogin(String dialCode, String phoneNumber) async {
  var response = await Dio(
      BaseOptions(
          receiveDataWhenStatusError: true,
          receiveTimeout: const Duration(seconds: 5),
          connectTimeout: const Duration(seconds: 6),
          headers: {
            'Content-Type':'multipart/form-data',
            'Accept':'text/plain'
          })
  ).post('http://52.91.25.191:85/api/Account/LogIn?dialCode=%2B963&phoneNumber=$phoneNumber');
  if(response.statusCode==200){
    print(response.statusCode);
    print("Successful");
    return Future.value(unit);
  }else {
    print("###############");
    throw Exception();
  }

}
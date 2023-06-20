import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stay_home/core/network/dio_factory.dart';
import 'package:stay_home/model/auth_model.dart';

import '../core/error/exception_handler.dart';

class AuthRepo {
  late final Dio _dio;
  AuthRepo() {
    _dio = DioFactory.instance.get();
  }

  Future<Either<String, String>> loginUser(
      {required String email, required String password}) async {
    try {
      final result = await _dio
          .post('Mobile/Customer/LogIn?Email=$email&password=$password');

      print("SuccessfulData");
      return Right(result.data["response"]["accessToken"]);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, AuthModel>> createUser(
      {required String fullName,
      required String email,
      required String imgUrl,
      required String password,
      required String phoneNumber,
      required String birthdate,
      required String deviceToken,
      required String cityId}) async {
    try {
      final result = await _dio.post(
          'Mobile/Customer/Create?FullName=$fullName&Email=$email&ImageUrl=asd&Password=$password&PhoneNumber=$phoneNumber&BirthDate=$birthdate&DeviceToken=44&CityId=d024439e-9efc-4a4c-94de-50e05c4df267');
      print("SuccessfulData");
      return Right(AuthModel.fromJson(result.data["response"]));
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }
}

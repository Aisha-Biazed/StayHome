import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay_home/core/network/dio_factory.dart';
import 'package:stay_home/model/create_model.dart';
import 'package:stay_home/model/details_shop_model.dart';
import 'package:stay_home/model/home_model.dart';
import 'package:stay_home/model/profile_model.dart';
import 'package:stay_home/model/shope_model.dart';

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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data["response"]["accessToken"]);
      print("SuccessfulData");
      print(result.data["response"]["accessToken"]);
      return Right(result.data["response"]["accessToken"]);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, CreateModel>> createUser(
      {String? id,
      required String fullName,
      required String email,
      required String password,
      required String phoneNumber,
      required String birthdate,
      required String deviceToken,
      String? gender,
      required String cityId}) async {
    try {
      final result = await _dio.post(
          // 'Mobile/Customer/Create?FullName=$fullName&Email=$email&ImageUrl=asd&Password=$password&PhoneNumber=&Gender=0$phoneNumber&BirthDate=$birthdate&CityId=d024439e-9efc-4a4c-94de-50e05c4df267',
          'Mobile/Customer/Create?FullName=joudi&Email=joudi%40gmail.com&Password=1111&PhoneNumber=123456789&BirthDate=2-6-2001&DeviceToken=5&Gender=Female&CityId=6781586e-a6c6-46c6-89b6-b68539434d89');
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', result.data["response"]["accessToken"]);
      print("SuccessfulData");
      return Right(CreateModel.fromJson(result.data["response"]));
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, ProfileModel>> myProfile() async {
    try {
      final result = await _dio.get(
        'Mobile/Customer/GetMyProfile',
      );
      print("SuccessfulData");
      return Right(ProfileModel.fromJson(result.data["response"]));
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, List<HomeModel>>> getHome() async {
    try {
      final result = await _dio.get('Mobile/Home/Get');
      (result.data["response"] as List).map((e) {
        return HomeModel.fromJson(e);
      }).toList();
      print("SuccessfulDataHome");
      return Right((result.data["response"] as List).map((e) {
        return HomeModel.fromJson(e);
      }).toList());
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, List<ShopModel>>> getShop() async {
    try {
      final result = await _dio.get('Mobile/Shop/GetAll');
      (result.data["response"] as List).map((e) {
        return ShopModel.fromJson(e);
      }).toList();
      print("SuccessfulDataShop");
      return Right((result.data["response"] as List).map((e) {
        return ShopModel.fromJson(e);
      }).toList());
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, DetailsShopModel>> detailsShop(String shopId) async {
    try {
      final result = await _dio.get(
        'Mobile/Shop/GetById',
        queryParameters: {'Id': shopId},
      );
      print("SuccessfulDetailsSop");
      return Right(DetailsShopModel.fromJson(result.data["response"]));
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }
}

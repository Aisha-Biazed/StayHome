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
import '../model/all_cities_model.dart';

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

  Future<Either<String, String>> createUserCubit({
    required String fullName,
    required String birthdate,
    required String phoneNumber,
    required String email,
    required String password,
    required String gender,
    required String cityId,
  }) async {
    try {
      final result = await _dio.post(
          'Mobile/Customer/Create?FullName=$fullName&Email=$email&Password=$password&PhoneNumber=$phoneNumber&BirthDate=$birthdate&DeviceToken=3&Gender=$gender&CityId=$cityId');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data["response"]["accessToken"]);
      print("SuccessfulDataCreateUser");
      print(result.data["response"]["accessToken"]);
      return Right(result.data["response"]["accessToken"]);
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

  Future<Either<String, List<GetAllCitiesModel>>> getAllCities() async {
    try {
      final result = await _dio.get('Mobile/Setting/GetAllCities');
      (result.data["response"] as List).map((e) {
        return GetAllCitiesModel.fromJson(e);
      }).toList();
      print("SuccessfulGetAllCities");
      return Right((result.data["response"] as List).map((e) {
        return GetAllCitiesModel.fromJson(e);
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

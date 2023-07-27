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
import '../model/all_areas_model.dart';
import '../model/all_cities_model.dart';
import '../model/all_cities_with_area_model.dart';

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

  Future<Either<String, String>> addShoppingOrder({
    required String destinationAreaId,
    required String destinationStreet,
    required String destinationAdditional,
    required String note,
    required String sourceAreaId,
    required String sourceStreet,
    required String sourceAdditional,
    required String? weight,
    // String? scheduleDate,
    // String? shopId,
  }) async {
    try {
      final result = await _dio.post(
          'Mobile/Order/AddShippingOrder?Destination.AreaId=528de862-161a-417b-93c5-a196983cb8b8&Destination.Street=%D8%B4%D8%A7%D8%B1%D8%B9%20%D8%AC%D8%A7%D9%85%D8%B9%20%D8%A7%D9%84%D8%B1%D9%88%D8%B6%D8%A9&Destination.Additional=%D8%A8%D8%AC%D8%A7%D9%86%D8%A8%20%D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9&Note=%D8%A7%D9%84%D8%B1%D8%AC%D8%A7%D8%A1%20%D8%B9%D8%AF%D9%85%20%D9%82%D8%B1%D8%B9%20%D8%A7%D9%84%D8%AC%D8%B1%D8%B3&Source.AreaId=5c8c8814-75d7-47wQbNPTDJp9hMYdvogK2hAUiHsGeiybwaWe36bwtRQ3UTpYV7YuZ8FV5j9nauFCWwcjM6dTzpL5s2N79Rp5unwdMvc8ZKUD9%82&Source.Additional=%D8%A3%D9%85%D8%A7%D9%85%20%D8%A7%D9%84%D9%81%D9%86%D8%AF%D9%82%20%D8%A7%D9%84%D8%AF%D9%8A%D8%AF%D9%85%D8%A7%D9%86&Weight=250');
      print("SuccessfulAddShoppingOrder");
      return Right(result.data["response"]);
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

  Future<Either<String, List<GetAllAreasModel>>> getAllAreas() async {
    try {
      final result = await _dio.get('Mobile/Setting/GetAllAreas');
      (result.data["response"] as List).map((e) {
        return GetAllAreasModel.fromJson(e);
      }).toList();
      print("SuccessfulGetAllAreas");
      return Right((result.data["response"] as List).map((e) {
        return GetAllAreasModel.fromJson(e);
      }).toList());
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, List<GetAllCitiesWithAreasModel>>>
      getAllCitiesWithAreas() async {
    try {
      final result = await _dio.get('Mobile/Setting/GetAllCitiesWithAreas');
      (result.data["response"] as List).map((e) {
        return GetAllCitiesWithAreasModel.fromJson(e);
      }).toList();
      print("SuccessfulGetAllCitiesWithAreas");
      return Right((result.data["response"] as List).map((e) {
        return GetAllCitiesWithAreasModel.fromJson(e);
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

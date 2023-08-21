import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay_home/core/network/dio_factory.dart';
import 'package:stay_home/model/details_shop_model.dart';
import 'package:stay_home/model/home_model.dart';
import 'package:stay_home/model/profile_model.dart';
import 'package:stay_home/model/shope_model.dart';
import '../core/error/exception_handler.dart';
import '../model/all_areas_model.dart';
import '../model/all_cities_model.dart';
import '../model/all_cities_with_area_model.dart';
import '../model/check_order_model.dart';

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
      if(((error as DioError).response?.data['message']as String).contains('User Not Found')){
        return Left('هذا الحساب غير موجود، تحقق من المعلومات المدخلة');
      }else {
        return Left(ExceptionHandler.handle(error as Exception));
      }
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

  Future<Either<String, dynamic>> shippingOrder({
    required String destinationAreaId,
    required String destinationStreet,
    required String destinationAdditional,
    required String note,
    required String sourceAreaId,
    required String sourceStreet,
    required String sourceAdditional,
    required double weight,
    // String? shopId
    // String? scheduleDate,
  }) async {
    try {
      final result = await _dio.post(
          'Mobile/Order/AddShippingOrder?Destination.AreaId=$destinationAreaId&Destination.Street=$destinationStreet&Destination.Additional=$destinationAdditional&Note=$note&Source.Street=$sourceStreet&Source.AreaId=$sourceAreaId&Source.Additional=$sourceAdditional&Weight=$weight');
      //&ShopId=$shopId
      print("SuccessfulAddShippingOrder");
      return Right(result.data["response"]);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, dynamic>> deliveryOrder({
    required String destinationAreaId,
    required String destinationStreet,
    required String destinationAdditional,
    required String note,
    required String sourceAreaId,
    required String sourceStreet,
    required String sourceAdditional,
    required double weight,
    // String? shopId
    // String? scheduleDate,
  }) async {
    try {
      final result = await _dio.post(
          'Mobile/Order/AddShippingOrder?Destination.AreaId=$destinationAreaId&Destination.Street=$destinationStreet&Destination.Additional=$destinationAdditional&Note=$note&Source.Street=$sourceStreet&Source.AreaId=$sourceAreaId&Source.Additional=$sourceAdditional&Weight=$weight');
      //&ShopId=$shopId
      print("SuccessfulAddShippingOrder");
      return Right(result.data["response"]);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, dynamic>> shippingShop(
      {required String destinationAreaId,
      required String destinationStreet,
      required String destinationAdditional,
      required String note,
      required String shopId
      // String? scheduleDate,
      }) async {
    try {
      final result = await _dio.post(
          'Mobile/Order/AddShippingOrder?Destination.AreaId=$destinationAreaId&Destination.Street=$destinationStreet&Destination.Additional=$destinationAdditional&Note=$note&ShopId=$shopId&Cart=%7B%0A%20%20%22productId%22%3A%20%223fa85f64-5717-4562-b3fc-2c963f66afa6%22%2C%0A%20%20%22quantity%22%3A%203%0A%7D');
      //&ShopId=$shopId
      print("SuccessfulAddShopping");
      return Right(result.data["response"]);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, dynamic>> passengerOrder({
    required String sourceAreaID,
    required String destinationAreaID,
    required String note,
    required int numberOfPassenger,
    required String sourceStreet,
    required String destinationStreet,
    required String sourceAdditional,
    required String destinationAdditional,
  }) async {
    try {
      final result = await _dio.post(
          'Mobile/Order/AddPassengerOrder?Note=$note&Source.AreaId=$sourceAreaID&Source.Street=$sourceStreet&Source.Additional=$sourceAdditional&Destination.AreaId=$destinationAreaID&Destination.Street=$destinationStreet&Destination.Additional=$destinationAdditional&NumberOfPassenger=$numberOfPassenger');
      //&ScheduleDate=$scheduleDate
      print("SuccessfulDataOrderPassenger");
      print(result.data["response"]);
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

  Future<Either<String, OrderCheckModel>> orderCheck(
      String destinationAreaId, String sourceAreaId) async {
    try {
      final result = await _dio.get(
        'Mobile/Order/Check',
        // '?SourceAreaId=dda57d62-b1c0-46bd-a3f3-490210dea637',
        // 'dda57d62-b1c0-46bd-a3f3-490210dea637',
        queryParameters: {
          'DestinationAreaId': destinationAreaId,
          'SourceAreaId': sourceAreaId
        },
      );
      print("SuccessfulOrderCheck");
      return Right(OrderCheckModel.fromJson(result.data["response"]));
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, Null>> rate(
      {required int star, required String comment}) async {
    try {
      final result = await _dio.post(
          'Mobile/Order/Rate?Id=4a4c2eea-ea10-4b08-9cc7-7422230dcde7&Star=$star&Comment=$comment');
      print("SuccessfulDataRate");
      print(result.data["response"]);
      return Right(result.data["response"]);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }
}

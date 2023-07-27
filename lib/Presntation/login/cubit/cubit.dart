import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/data_remote/auth_repo.dart';
import 'package:stay_home/model/all_cities_with_area_model.dart';
import 'package:stay_home/model/details_shop_model.dart';
import 'package:stay_home/model/shope_model.dart';
import '../../../model/all_areas_model.dart';
import '../../../model/all_cities_model.dart';
import '../../../model/home_model.dart';
import '../../../model/profile_model.dart';

class InitialCubit extends Cubit<InitialStates> {
  late final AuthRepo _authRepo;

  InitialCubit() : super(LoginInitialState()) {
    _authRepo = AuthRepo();
  }

  static InitialCubit get(context) => BlocProvider.of(context);

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    Either<String, String> result =
        await _authRepo.loginUser(email: email, password: password);
    result.fold((l) {
      emit(LoginErrorState());
      //show error
    }, (r) {
      emit(LoginSuccessState());
      //save user
    });
  }

  void createUser(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber,
      required String birthdate,
      required BuildContext context,
      required String cityId,
      // String? deviceToken,
      required String gender}) async {
    emit(CreateLoadingState());

    Either<String, String> result = await _authRepo.createUserCubit(
      // fullName: fullName,
      email: email,
      password: password,
      fullName: fullName,
      birthdate: birthdate,
      phoneNumber: phoneNumber,
      cityId: cityId,
      gender: gender,
    );

    result.fold((l) {
      emit(CreateErrorState());
      //show error
    }, (r) {
      emit(CreateSuccessState());
      Navigator.pushNamed(context, Routes.profilesRoute, arguments: r);
    });
  }

  void profileCubit() async {
    emit(ProfileLoadingState());
    Either<String, ProfileModel> result = await _authRepo.myProfile();
    result.fold((l) {
      emit(ProfileErrorState());
      //show error
    }, (r) {
      emit(ProfileSuccessState(r as ProfileModel));
      //save user
    });
  }

  void addShoppingOrderCubit({
    required String destinationAreaId,
    required String destinationStreet,
    required String destinationAdditional,
    required String note,
    required String sourceAreaId,
    required String sourceStreet,
    required String sourceAdditional,
    required String weight,
    // String? scheduleDate,
    // String? shopId,
  }) async {
    emit(AddShoppingOrderLoadingState());
    Either<String, String> result = await _authRepo.addShoppingOrder(
        destinationAreaId: destinationAreaId,
        destinationStreet: destinationStreet,
        destinationAdditional: destinationAdditional,
        note: note,
        sourceAreaId: sourceAreaId,
        sourceStreet: sourceStreet,
        sourceAdditional: sourceAdditional,
        weight: weight);
    result.fold((l) {
      emit(AddShoppingOrderErrorState());
      //show error
    }, (r) {
      emit(AddShoppingOrderSuccessState());
      //save user
    });
  }

  void homeCubit() async {
    emit(HomeLoadingState());
    Either<String, List<HomeModel>> result = await _authRepo.getHome();
    result.fold((l) {
      emit(HomeErrorState());
      //show error
    }, (r) {
      emit(HomeSuccessState(r as List<HomeModel>));
      //save user
    });
  }

  void getAllCitiesCubit() async {
    emit(GetAllCitiesLoadingState());
    Either<String, List<GetAllCitiesModel>> result =
        await _authRepo.getAllCities();
    result.fold((l) {
      emit(GetAllCitiesErrorState());
      //show error
    }, (r) {
      emit(GetAllCitiesSuccessState(r as List<GetAllCitiesModel>));
      //save user
    });
  }

  void getAllAreasCubit() async {
    emit(GetAllAreasLoadingState());
    Either<String, List<GetAllAreasModel>> result =
        await _authRepo.getAllAreas();
    result.fold((l) {
      emit(GetAllAreasErrorState());
      //show error
    }, (r) {
      emit(GetAllAreasSuccessState(r as List<GetAllAreasModel>));
      //save user
    });
  }

  void getAllCitiesWithAreasCubit() async {
    emit(GetAllCitiesWithAllCitiesLoadingState());
    Either<String, List<GetAllCitiesWithAreasModel>> result =
        await _authRepo.getAllCitiesWithAreas();
    result.fold((l) {
      emit(GetAllCitiesWithAllCitiesErrorState());
      //show error
    }, (r) {
      emit(GetAllCitiesWithAllCitiesSuccessState(
          r as List<GetAllCitiesWithAreasModel>));
      //save user
    });
  }

  void shopCubit() async {
    emit(ShopLoadingState());
    Either<String, List<ShopModel>> listShop = await _authRepo.getShop();
    listShop.fold((l) {
      emit(ShopErrorState());
      //show error
    }, (r) {
      emit(ShopSuccessState(r as List<ShopModel>));
      //save user
    });
  }

  void detailsShopCubit(String shopId) async {
    emit(ProfileLoadingState());
    Either<String, DetailsShopModel> result =
        await _authRepo.detailsShop(shopId);
    result.fold((l) {
      emit(DetailsShopErrorState());
      //show error
    }, (r) {
      emit(DetailsShopSuccessState(r as DetailsShopModel));
      //save user
    });
  }

// void addToCart(List<ProductCart> cart, ProductCart product) {
//   final pro = cart.firstWhereOrNull((element) => element.id == product.id);
//   if (pro == null) {
//     cart.add(product);
//   } else {
//     final newProduct = ProductCart(
//         id: pro.id,
//         name: pro.name,
//         imageUrl: pro.imageUrl,
//         cost: pro.cost,
//         counter: pro.counter! + 1);
//     cart.removeWhere((element) => element.id == pro.id);
//     cart.add(product);
//   }
//   emit(MyCartState(productsCart: cart));
// }
//
// void decreaseFromCart(List<ProductCart> cart, ProductCart product) {
//   final pro = cart.firstWhereOrNull((element) => element.id == product.id);
//   if (pro != null && pro.counter! > 1) {
//     final newProduct = ProductCart(
//         id: pro.id,
//         name: pro.name,
//         imageUrl: pro.imageUrl,
//         cost: pro.cost,
//         counter: pro.counter! - 1);
//     cart.removeWhere((element) => element.id == pro.id);
//     cart.add(newProduct);
//     emit(MyCartState(productsCart: cart));
//   } else {
//     cart.removeWhere((element) => element.id == product.id);
//     emit(MyCartState(productsCart: cart));
//   }
// }
//
// void clearCart(List<ProductCart> cart) {
//   cart.clear();
//   emit(MyCartState(productsCart: cart));
// }
}

// void removeFromCart(List<ProductCart> cart, ProductCart product) {
//   cart.removeWhere((element) => element.id == product.id);
//   emit(MyCartState(productsCart: cart));
// }

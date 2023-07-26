import 'package:stay_home/model/all_cities_model.dart';

import '../../../model/details_shop_model.dart';
import '../../../model/home_model.dart';
import '../../../model/profile_model.dart';
import '../../../model/shope_model.dart';

abstract class InitialStates {}

class LoginInitialState extends InitialStates {}

class LoginLoadingState extends InitialStates {}

class LoginSuccessState extends InitialStates {}

class LoginErrorState extends InitialStates {}

class CreateLoadingState extends InitialStates {}

class CreateSuccessState extends InitialStates {}

class CreateErrorState extends InitialStates {}

class ProfileLoadingState extends InitialStates {}

class ProfileSuccessState extends InitialStates {
  ProfileModel result;
  ProfileSuccessState(this.result);
}

class ProfileErrorState extends InitialStates {}

class HomeLoadingState extends InitialStates {}

class HomeSuccessState extends InitialStates {
  List<HomeModel> result;
  HomeSuccessState(this.result);
}

class HomeErrorState extends InitialStates {}

class GetAllCitiesLoadingState extends InitialStates {}

class GetAllCitiesSuccessState extends InitialStates {
  List<GetAllCitiesModel> result;
  GetAllCitiesSuccessState(this.result);
}

class GetAllCitiesErrorState extends InitialStates {}

class ShopLoadingState extends InitialStates {}

class ShopSuccessState extends InitialStates {
  List<ShopModel> listShop;
  ShopSuccessState(this.listShop);
}

class ShopErrorState extends InitialStates {}

class DetailsLoadingState extends InitialStates {}

class DetailsShopSuccessState extends InitialStates {
  DetailsShopModel listIdShop;
  DetailsShopSuccessState(this.listIdShop);
}

class DetailsShopErrorState extends InitialStates {}

// class MyCartState extends InitialStates {
//   List<ProductCart> productsCart;
//   MyCartState({required this.productsCart});
// }
//
// class ProductCart {
//   ProductCart({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.cost,
//     required this.counter,
//   });
//
//   final String? id;
//   final String? name;
//   final String? imageUrl;
//   final int? cost;
//   final int? counter;
// }

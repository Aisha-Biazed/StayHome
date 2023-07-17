import 'package:dartz/dartz.dart';

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

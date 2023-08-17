import 'package:stay_home/model/all_cities_model.dart';
import 'package:stay_home/model/all_cities_with_area_model.dart';
import 'package:stay_home/model/check_order_model.dart';

import '../../../model/all_areas_model.dart';
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

class AddShoppingOrderLoadingState extends InitialStates {}

class AddShoppingOrderErrorState extends InitialStates {}

class AddShoppingOrderSuccessState extends InitialStates {}

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

class GetAllAreasLoadingState extends InitialStates {}

class GetAllAreasSuccessState extends InitialStates {
  List<GetAllAreasModel> result;
  GetAllAreasSuccessState(this.result);
}

class GetAllAreasErrorState extends InitialStates {}

class GetAllCitiesWithAllCitiesLoadingState extends InitialStates {}

class GetAllCitiesWithAllCitiesSuccessState extends InitialStates {
  List<GetAllCitiesWithAreasModel> result;
  GetAllCitiesWithAllCitiesSuccessState(this.result);
}

class GetAllCitiesWithAllCitiesErrorState extends InitialStates {}

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

class OrderCheckErrorState extends InitialStates {}

class OrderCheckLoadingState extends InitialStates {}

class OrderCheckSuccessState extends InitialStates {
  OrderCheckModel listOrder;
  OrderCheckSuccessState(this.listOrder);
}

class DetailsShopErrorState extends InitialStates {}

class RateLoadingState extends InitialStates {}

class RateSuccessState extends InitialStates {}

class RateErrorState extends InitialStates {}

class OrderPassengerLoadingState extends InitialStates {}

class OrderPassengerSuccessState extends InitialStates {}

class OrderPassengerErrorState extends InitialStates {}

class GetIdAreaSourceState extends InitialStates {}

class GetIdAreaDestinationState extends InitialStates {}

class GetSourceStreetState extends InitialStates {}

class GetDestinationStreetState extends InitialStates {}

class GetSourceAdditionalState extends InitialStates {}

class GetDestinationAdditionalState extends InitialStates {}

class NoteState extends InitialStates {}

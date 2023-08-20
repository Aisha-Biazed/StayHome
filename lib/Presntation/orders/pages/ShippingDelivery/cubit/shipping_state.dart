part of 'shipping_cubit.dart';

@immutable
abstract class ShippingState {}

class ShippingInitial extends ShippingState {}

class ShippingOrderLoadingState extends ShippingState {}

class ShippingOrderErrorState extends ShippingState {}

class ShippingOrderSuccessState extends ShippingState {}

class ShippingShopLoadingState extends ShippingState {}

class ShippingShopErrorState extends ShippingState {}

class ShippingShopSuccessState extends ShippingState {}

//variables
class ShippingIdAreaSourceState extends ShippingState {}

class ShippingIdAreaDestinationState extends ShippingState {}

class ShippingSourceStreetState extends ShippingState {}

class ShippingDestinationStreetState extends ShippingState {}

class ShippingSourceAdditionalState extends ShippingState {}

class ShippingDestinationAdditionalState extends ShippingState {}

class ShippingNoteState extends ShippingState {}

class ShippingSopIdState extends ShippingState {}

class ShippingWeightState extends ShippingState {}

class ShippingShopIDState extends ShippingState {}

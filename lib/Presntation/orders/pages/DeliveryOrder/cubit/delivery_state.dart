part of 'delivery_cubit.dart';

@immutable
abstract class DeliveryState {}

class DeliveryInitial extends DeliveryState {}

class DeliveryOrderLoadingState extends DeliveryState {}

class DeliveryOrderErrorState extends DeliveryState {}

class DeliveryOrderSuccessState extends DeliveryState {}

class DeliveryShopLoadingState extends DeliveryState {}

class DeliveryShopErrorState extends DeliveryState {}

class DeliveryShopSuccessState extends DeliveryState {}

//variables
class DeliveryIdAreaSourceState extends DeliveryState {}

class DeliveryIdAreaDestinationState extends DeliveryState {}

class DeliverySourceStreetState extends DeliveryState {}

class DeliveryDestinationStreetState extends DeliveryState {}

class DeliverySourceAdditionalState extends DeliveryState {}

class DeliveryDestinationAdditionalState extends DeliveryState {}

class DeliveryNoteState extends DeliveryState {}

class DeliverySopIdState extends DeliveryState {}

class DeliveryWeightState extends DeliveryState {}

class DeliveryShopIDState extends DeliveryState {}

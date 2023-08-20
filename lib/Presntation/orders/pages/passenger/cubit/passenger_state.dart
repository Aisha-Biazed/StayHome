part of 'passenger_cubit.dart';

@immutable
abstract class PassengerState {}

class PassengerInitial extends PassengerState {}

class OrderPassengerLoadingState extends PassengerState {}

class OrderPassengerSuccessState extends PassengerState {}

class OrderPassengerErrorState extends PassengerState {}

class GetIdAreaSourceState extends PassengerState {}

class GetIdAreaDestinationState extends PassengerState {}

class GetSourceStreetState extends PassengerState {}

class GetDestinationStreetState extends PassengerState {}

class GetSourceAdditionalState extends PassengerState {}

class GetDestinationAdditionalState extends PassengerState {}

class NoteState extends PassengerState {}

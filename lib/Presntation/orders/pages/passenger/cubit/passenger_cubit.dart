import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data_remote/auth_repo.dart';

part 'passenger_state.dart';

class PassengerCubit extends Cubit<PassengerState> {
  late final AuthRepo _authRepo;

  PassengerCubit() : super(PassengerInitial()) {
    _authRepo = AuthRepo();
  }

  static PassengerCubit get(context) => BlocProvider.of(context);
  String idDestinationCubit = '';
  String nameDestinationCubit = '';

  void getIdDestination({required String value, required String name}) {
    idDestinationCubit = value;
    nameDestinationCubit = name;
    emit(GetIdAreaDestinationState());
  }

  String idSourceCubit = '';
  String nameSourceCubit = '';

  void getIdSource({required String value, required String name}) {
    idSourceCubit = value;
    nameSourceCubit = name;
    emit(GetIdAreaSourceState());
  }

  String sourceStreetCubit = '';

  void getSourceStreet({required String value}) {
    sourceStreetCubit = value;
    emit(GetSourceStreetState());
  }

  String destinationStreetCubit = '';

  void getDestinationStreet({required String value}) {
    destinationStreetCubit = value;
    emit(GetDestinationStreetState());
  }

  String detailsSourceCubit = '';

  void getDetailsSource({required String value}) {
    detailsSourceCubit = value;
    emit(GetSourceAdditionalState());
  }

  String detailsDestinationCubit = '';

  void getDetailsDestination({required String value}) {
    detailsDestinationCubit = value;
    emit(GetDestinationAdditionalState());
  }

  String noteCubit = '';

  void getNote({required String value}) {
    noteCubit = value;
    emit(NoteState());
  }

  int numberCubit = 0;

  void getNumber({required int value}) {
    numberCubit = value;
    emit(NoteState());
  }

  Future<bool> orderPassengerCubit(
      {
     String? sourceAreaID,
     String? destinationAreaID,
     String? note,
     int? numberOfPassenger,
     String? sourceStreet,
     String? destinationStreet,
     String? sourceAdditional,
     String? destinationAdditional,
    // required String scheduleDate
  }
      ) async {
    emit(OrderPassengerLoadingState());
    Either<String, dynamic> result = await _authRepo.passengerOrder(
      note: noteCubit,
      numberOfPassenger: numberCubit,
      sourceStreet: sourceStreetCubit,
      destinationStreet: destinationStreetCubit,
      sourceAdditional: nameSourceCubit,
      destinationAdditional: nameDestinationCubit,
      sourceAreaID: idSourceCubit,
      destinationAreaID: idDestinationCubit,
      // scheduleDate: scheduleDate,
    );
    result.fold((l) {
      emit(OrderPassengerErrorState());

      return false;
    }, (r) {
      emit(OrderPassengerSuccessState());

      return true;
    });
    return true;
  }
}

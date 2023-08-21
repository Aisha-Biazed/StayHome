import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data_remote/auth_repo.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  late final AuthRepo _authRepo;

  DeliveryCubit() : super(DeliveryInitial()) {
    _authRepo = AuthRepo();
  }

  static DeliveryCubit get(context) => BlocProvider.of(context);

  String idSourceCubit = '';
  String nameSourceCubit = '';
  String sourceStreetCubit = '';
  String detailsSourceCubit = '';

  String idDestinationCubit = '';
  String nameDestinationCubit = '';
  String destinationStreetCubit = '';
  String detailsDestinationCubit = '';

  int totalCubit = 0;
  String noteCubit = '';
  String shopIdCubit = "";
  String shoppNameCubit = "";
  int weightCubit = 0;

  void setIdDestination({required String value, required String name}) {
    idDestinationCubit = value;
    nameDestinationCubit = name;
    emit(DeliveryIdAreaDestinationState());
  }

  void setIdSource({required String value, required String name}) {
    idSourceCubit = value;
    nameSourceCubit = name;
    emit(DeliveryIdAreaSourceState());
  }

  void setSourceStreet({required String value}) {
    sourceStreetCubit = value;
    emit(DeliverySourceStreetState());
  }

  void setDestinationStreet({required String value}) {
    destinationStreetCubit = value;
    emit(DeliveryDestinationStreetState());
  }

  void setDetailsSource({required String value}) {
    detailsSourceCubit = value;
    emit(DeliverySourceAdditionalState());
  }

  void setDetailsDestination({required String value}) {
    detailsDestinationCubit = value;
    emit(DeliveryDestinationAdditionalState());
  }

  void setNote({required String value}) {
    noteCubit = value;
    emit(DeliveryNoteState());
  }

  void setWeight({required int value}) {
    print('weightCubit');
    print(weightCubit);
    weightCubit = value;
    emit(DeliveryWeightState());
  }

  void getTotalPrice({required int value}) {
    totalCubit = value;
    emit(DeliveryWeightState());
  }

  void reset() {
    idSourceCubit = '';
    nameSourceCubit = '';
    sourceStreetCubit = '';
    detailsSourceCubit = '';
    idDestinationCubit = '';
    nameDestinationCubit = '';
    destinationStreetCubit = '';
    detailsDestinationCubit = '';

    totalCubit = 0;
    noteCubit = '';
    shopIdCubit = "";
    shoppNameCubit = "";
    weightCubit = 0;
  }

  void setShopId({required String value, required String name}) {
    shopIdCubit = value;
    shoppNameCubit = name;
    emit(DeliverySopIdState());
  }

  Future<bool> deliveryPointCubit({
    String? destinationAreaId,
    String? destinationStreet,
    String? destinationAdditional,
    String? note,
    String? sourceAreaId,
    String? sourceStreet,
    String? sourceAdditional,
    double? weight,
    // String? shopId
    // String? scheduleDate,
  }) async {
    emit(DeliveryOrderLoadingState());
    BotToast.showLoading();
    Either<String, dynamic> result = await _authRepo.deliveryOrder(
        destinationAreaId: idDestinationCubit,
        destinationStreet: destinationStreetCubit,
        destinationAdditional: detailsDestinationCubit,
        note: noteCubit,
        weight: weightCubit.toDouble(),
        sourceAdditional: detailsSourceCubit,
        sourceAreaId: idSourceCubit,
        sourceStreet: sourceStreetCubit);
    result.fold((l) {
      emit(DeliveryOrderErrorState());
      //show error
      BotToast.closeAllLoading();
      return false;
    }, (r) {
      emit(DeliveryOrderSuccessState());
      //save user
      BotToast.closeAllLoading();
      return true;
    });
    return true;
  }

  void deliveryShopCubit(
      {required String destinationAreaId,
      required String destinationStreet,
      required String destinationAdditional,
      required String note,
      required String shopId
      // String? scheduleDate,
      }) async {
    emit(DeliveryShopLoadingState());
    Either<String, dynamic> result = await _authRepo.deliveryOrder(
      destinationAreaId: destinationAreaId,
      destinationStreet: destinationStreet,
      destinationAdditional: destinationAdditional,
      note: note,
      sourceAreaId: '',
      sourceStreet: '',
      sourceAdditional: '',
      weight: 15,
    );
    result.fold((l) {
      emit(DeliveryShopErrorState());
      //show error
    }, (r) {
      emit(DeliveryShopSuccessState());
      //save user
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data_remote/auth_repo.dart';

part 'shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  late final AuthRepo _authRepo;
  ShippingCubit() : super(ShippingInitial()) {
    _authRepo = AuthRepo();
  }

  String idDestinationCubit = '';
  String nameDestinationCubit = '';
  void getIdDestination({required String value, required String name}) {
    idDestinationCubit = value;
    nameDestinationCubit = name;
    emit(ShippingIdAreaDestinationState());
  }

  String idSourceCubit = '';
  String nameSourceCubit = '';
  void getIdSource({required String value, required String name}) {
    idSourceCubit = value;
    nameSourceCubit = name;
    emit(ShippingIdAreaSourceState());
  }

  String sourceStreetCubit = '';
  void getSourceStreet({required String value}) {
    sourceStreetCubit = value;
    emit(ShippingSourceStreetState());
  }

  String destinationStreetCubit = '';
  void getDestinationStreet({required String value}) {
    destinationStreetCubit = value;
    emit(ShippingDestinationStreetState());
  }

  String detailsSourceCubit = '';
  void getDetailsSource({required String value}) {
    detailsSourceCubit = value;
    emit(ShippingSourceAdditionalState());
  }

  String detailsDestinationCubit = '';
  void getDetailsDestination({required String value}) {
    detailsDestinationCubit = value;
    emit(ShippingDestinationAdditionalState());
  }

  String noteCubit = '';
  void getNote({required String value}) {
    noteCubit = value;
    emit(ShippingNoteState());
  }

  double weightCubit = 0.0;
  void getWeight({required double value}) {
    weightCubit = value;
    emit(ShippingWeightState());
  }

  int totalCubit = 0;
  void getTotalPrice({required int value}) {
    totalCubit = value;
    emit(ShippingWeightState());
  }

  String shopIdCubit = "";
  String shoppNameCubit = "";
  void getShopId({required String value, required String name}) {
    shopIdCubit = value;
    shoppNameCubit = name;
    emit(ShippingSopIdState());
  }

  static ShippingCubit get(context) => BlocProvider.of(context);
  void shippingOrderCubit({
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
    emit(ShippingOrderLoadingState());
    Either<String, dynamic> result = await _authRepo.shippingOrder(
        destinationAreaId: destinationAreaId,
        destinationStreet: destinationStreet,
        destinationAdditional: destinationAdditional,
        note: note,
        // shopId: shopId,
        weight: weight,
        sourceAdditional: sourceAdditional,
        sourceAreaId: sourceAreaId,
        sourceStreet: sourceStreet);
    result.fold((l) {
      emit(ShippingOrderErrorState());
      //show error
    }, (r) {
      emit(ShippingOrderSuccessState());
      //save user
    });
  }

  void shippingShopCubit(
      {required String destinationAreaId,
      required String destinationStreet,
      required String destinationAdditional,
      required String note,
      required String shopId
      // String? scheduleDate,
      }) async {
    emit(ShippingShopLoadingState());
    Either<String, dynamic> result = await _authRepo.shippingShop(
      destinationAreaId: destinationAreaId,
      destinationStreet: destinationStreet,
      destinationAdditional: destinationAdditional,
      note: note,
      shopId: shopId,
    );
    result.fold((l) {
      emit(ShippingShopErrorState());
      //show error
    }, (r) {
      emit(ShippingShopSuccessState());
      //save user
    });
  }
}

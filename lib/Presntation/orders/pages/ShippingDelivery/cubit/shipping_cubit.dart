import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data_remote/auth_repo.dart';
import '../../../store/Cubit/my_cart_cubit.dart';

part 'shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  late final AuthRepo _authRepo;

  ShippingCubit() : super(ShippingInitial()) {
    _authRepo = AuthRepo();
  }

  static ShippingCubit get(context) => BlocProvider.of(context);

  String idDestinationCubit = '';
  String nameDestinationCubit = '';
  String idSourceCubit = '';
  String nameSourceCubit = '';
  String sourceStreetCubit = '';
  String destinationStreetCubit = '';
  String detailsSourceCubit = '';
  String detailsDestinationCubit = '';
  String noteCubit = '';
  int weightCubit = 0;
  int totalCubit = 0;
  String shopIdCubit = "";
  String shoppNameCubit = "";
  DateTime? scheduleDate ;


  void reset() {
    idSourceCubit = '';
    nameSourceCubit = '';
    sourceStreetCubit = '';
    detailsSourceCubit = '';
    idDestinationCubit = '';
    nameDestinationCubit = '';
    destinationStreetCubit = '';
    detailsDestinationCubit = '';
    scheduleDate = null;
    totalCubit = 0;
    noteCubit = '';
    shopIdCubit = "";
    shoppNameCubit = "";
    weightCubit = 0;
  }

  void setScheduleDate({required DateTime value}) {
    scheduleDate = value;
  }

  void setIdDestination({required String value, required String name}) {
    idDestinationCubit = value;
    nameDestinationCubit = name;
    emit(ShippingIdAreaDestinationState());
  }

  void setIdSource({required String value, required String name}) {
    idSourceCubit = value;
    nameSourceCubit = name;
    emit(ShippingIdAreaSourceState());
  }

  void setSourceStreet({required String value}) {
    sourceStreetCubit = value;
    emit(ShippingSourceStreetState());
  }

  void setDestinationStreet({required String value}) {
    destinationStreetCubit = value;
    emit(ShippingDestinationStreetState());
  }

  void setDetailsSource({required String value}) {
    detailsSourceCubit = value;
    emit(ShippingSourceAdditionalState());
  }

  void setDetailsDestination({required String value}) {
    detailsDestinationCubit = value;
    emit(ShippingDestinationAdditionalState());
  }

  void setNote({required String value}) {
    noteCubit = value;
    emit(ShippingNoteState());
  }

  void setWeight({required int value}) {
    weightCubit = value;
    emit(ShippingWeightState());
  }

  void setTotalPrice({required int value}) {
    totalCubit = value;
    emit(ShippingWeightState());
  }

  void setShopId({required String value, required String name}) {
    shopIdCubit = value;
    shoppNameCubit = name;
    emit(ShippingSopIdState());
  }

  Future<bool> shippingPointCubit({
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
    emit(ShippingOrderLoadingState());
    BotToast.showLoading();
    Either<String, dynamic> result = await _authRepo.shippingOrder(
      destinationAreaId: idDestinationCubit,
      destinationStreet: destinationStreetCubit,
      destinationAdditional: detailsDestinationCubit,
      note: noteCubit,
      weight: weightCubit.toDouble(),
      sourceAdditional: detailsSourceCubit,
      sourceAreaId: idSourceCubit,
      sourceStreet: sourceStreetCubit,
      scheduleDate: scheduleDate
    );
    final val = result.fold((l) {
      emit(ShippingOrderErrorState());
      //show error
      BotToast.closeAllLoading();
      return false;
    }, (r) {
      emit(ShippingOrderSuccessState());
      //save user
      BotToast.closeAllLoading();
      return true;
    });
    return val;
  }

  Future<bool> shippingShopCubit({
    String? destinationAreaId,
    String? destinationStreet,
    String? destinationAdditional,
    String? note,
    String? shopId,
    required List<ProductCart> cart,
    // String? scheduleDate,
  }) async {
    emit(ShippingShopLoadingState());
    Either<String, dynamic> result = await _authRepo.shippingShop(
      destinationAreaId: idDestinationCubit,
      destinationStreet: destinationStreetCubit,
      destinationAdditional: detailsDestinationCubit,
      note: noteCubit,
      shopId: shopIdCubit,
      scheduleDate: scheduleDate,
      cart: cart,
    );
    final val = result.fold((l) {
      emit(ShippingShopErrorState());
      //show error
      BotToast.closeAllLoading();
      return false;
    }, (r) {
      emit(ShippingShopSuccessState());
      //save user
      BotToast.closeAllLoading();
      return true;
    });
    return val;
  }
}

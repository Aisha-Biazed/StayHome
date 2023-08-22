import 'dart:async';

import 'package:dartz/dartz.dart' as e;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/ratings/pages/rating_page.dart';
import 'package:stay_home/Presntation/ratings/widgets/custom_buttons.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../../data_remote/auth_repo.dart';
import '../../../model/order_tracking_model.dart';

class DeliveryRatingPage extends StatefulWidget {
  const DeliveryRatingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DeliveryRatingPage> createState() => _DeliveryRatingPageState();
}

class _DeliveryRatingPageState extends State<DeliveryRatingPage> {
  late StreamSubscription _orderTrackingSubscription;

  @override
  void initState() {
    super.initState();
    _startOrderTrackingUpdates();
  }

  @override
  void dispose() {
    _cancelOrderTrackingUpdates();
    super.dispose();
  }

  void _startOrderTrackingUpdates() {
    const duration = Duration(seconds: 2);
    _orderTrackingSubscription = Stream.periodic(duration).listen((_) {
      RatingCubit.get(context).refreshOrderTrackingCubit();
    });
  }

  void _cancelOrderTrackingUpdates() {
    _orderTrackingSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    RatingCubit.get(context).orderTrackingCubit();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: REdgeInsetsDirectional.only(start: 10, end: 10, top: 50),
          child: BlocBuilder<RatingCubit, RatingState>(
            builder: (context, state) {
              if (!state.loading) {
                return ListView.separated(
                  itemCount: state.list!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return 20.verticalSpace;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final item = state.list![index];
                    return Container(
                      padding: REdgeInsetsDirectional.only(
                          start: 6, end: 6, top: 40, bottom: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(width: 1.0, color: ColorManager.primary),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: REdgeInsetsDirectional.only(end: 10),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: ColorManager.purple,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ColorManager.purple,
                                    width: 2.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                    backgroundColor: ColorManager.purple,
                                    child: Image.asset(
                                      ImageAssets.box,
                                      width: 40,
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    txt: AppStrings.order,
                                    txtColor: ColorManager.dark,
                                  ),
                                  CustomText(
                                    txt:
                                        "${AppStrings.priceRating}${item.coast}",
                                    txtColor: ColorManager.dark,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CustomButtons(
                                onPressed: () {
                                  if (item.star == null &&
                                      item.canEvaluate == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RatingsPage(idRate: item.id!)));
                                  }
                                },
                                text: AppStrings.ratingBtnDelivery,
                                color: item.star == null &&
                                        item.canEvaluate == true
                                    ? ColorManager.primary
                                    : ColorManager.purple,
                                colorText: item.star == null &&
                                        item.canEvaluate == true
                                    ? ColorManager.white
                                    : ColorManager.dark,
                              ),
                            ],
                          ),
                          Padding(
                            padding: REdgeInsetsDirectional.only(
                              end: 25,
                            ),
                            child: Visibility(
                              visible: !(item.currentStage == "OnWay" ||
                                  item.currentStage == "Complete"),
                              child: CustomButtons(
                                text: AppStrings.cancelBtn,
                                colorText: ColorManager.dark,
                                onPressed: () {
                                  InitialCubit.get(context)
                                      .cancelCubit(idOrder: item.id!);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: REdgeInsetsDirectional.only(
                                start: 16, end: 16, top: 16),
                            child: Row(children: <Widget>[
                              Container(
                                height: 10,
                                width: 10,
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    color: item.currentStage == 'Confirmed' ||
                                            item.currentStage == "OnWay" ||
                                            item.currentStage == "Complete"
                                        ? ColorManager.primary
                                        : ColorManager.purple,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                                color: item.currentStage == "OnWay" ||
                                        item.currentStage == "Complete"
                                    ? ColorManager.primary
                                    : ColorManager.purple,
                              )),
                              Container(
                                height: 10,
                                width: 10,
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    color: item.currentStage == "OnWay" ||
                                            item.currentStage == "Complete"
                                        ? ColorManager.primary
                                        : ColorManager.purple,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                                color: item.currentStage == 'Complete'
                                    ? ColorManager.primary
                                    : ColorManager.purple,
                              )),
                              Container(
                                height: 10,
                                width: 10,
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    color: item.currentStage == "Complete"
                                        ? ColorManager.primary
                                        : ColorManager.purple,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: REdgeInsetsDirectional.only(
                                start: 16, end: 16, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  txt: AppStrings.inPreparation,
                                  txtColor: ColorManager.dark,
                                  fontSize: 14,
                                ),
                                CustomText(
                                  txt: AppStrings.deliveryIsUnderway,
                                  txtColor: ColorManager.dark,
                                  fontSize: 14,
                                ),
                                CustomText(
                                  txt: AppStrings.delivered,
                                  txtColor: ColorManager.dark,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorManager.primary),
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}

class RatingCubit extends Cubit<RatingState> {
  AuthRepo? _authRepo;
  RatingCubit() :_authRepo = AuthRepo(), super(RatingState());

  static RatingCubit get(context) => BlocProvider.of(context);

  void orderTrackingCubit() async {
    emit(RatingState(loading: true));
    e.Either<String, List<OrderTrackingModel>> result =
    await _authRepo!.orderTracking();
    result.fold((l) {
      emit(RatingState(loading: false));
      //show error
    }, (r) {
      emit(RatingState(list:r ,loading: false));
      //save user
    });
  }

  void refreshOrderTrackingCubit() async {
    e.Either<String, List<OrderTrackingModel>> result =
    await _authRepo!.orderTracking();
    result.fold((l) {
      emit(RatingState(loading: false));
      //show error
    }, (r) {
      emit(RatingState(list:r ,loading: false));
      //save user
    });
  }
}

class RatingState{
  List<OrderTrackingModel>? list;
  bool loading;

  RatingState({
    this.list = const [],
    this.loading = false,
  });
}
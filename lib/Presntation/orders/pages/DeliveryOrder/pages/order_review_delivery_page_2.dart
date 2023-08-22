import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/orders/pages/DeliveryOrder/pages/order_review_delivery_page_1.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import 'dart:ui' as ui;
import 'package:day_night_time_picker/day_night_time_picker.dart';

import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../resources/routes_manager.dart';
import '../cubit/delivery_cubit.dart';

class OrderReviewDeliveryPage2 extends StatefulWidget {
  const OrderReviewDeliveryPage2({Key? key}) : super(key: key);

  @override
  State<OrderReviewDeliveryPage2> createState() =>
      _OrderReviewDeliveryPage2State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewDeliveryPage2State extends State<OrderReviewDeliveryPage2> {
  String timeSelected = options[0];
  String destination = choices[0];
  bool? check1 = false, check2 = true, check3 = false, check4 = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  int weight = 1;
  var destinationController;
  var sourceController;
  var noteController;

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    InitialCubit.get(context).orderCheckCubit(
        DeliveryCubit.get(context).idDestinationCubit,
        DeliveryCubit.get(context).idSourceCubit);
    destinationController = TextEditingController(
        text:
            '${AppStrings.destinationText}${DeliveryCubit.get(context).nameDestinationCubit}');
    sourceController = TextEditingController(
        text:
            '${AppStrings.sourceText}${DeliveryCubit.get(context).nameSourceCubit}');
    noteController =
        TextEditingController(text: DeliveryCubit.get(context).noteCubit);
    weight = DeliveryCubit.get(context).weightCubit;
    super.initState(); //set the initial value of text field
    super.initState();
  }

  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Padding(
          padding: REdgeInsetsDirectional.only(
            start: 0,
            end: 0,
            top: 61,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    txt: AppStrings.orderBeforeAdd,
                    fontSize: 30.sp,
                    txtColor: ColorManager.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  20.verticalSpace,
                 OrderDateTime(initVal: DeliveryCubit.get(context).scheduleDate, onChange: (val){
                   DeliveryCubit.get(context).setScheduleDate(value: val);
                 }),
                  CustomText(
                      txt: AppStrings.weightOfPassenger,
                      fontSize: 20.sp,
                      txtColor: ColorManager.dark,
                      fontWeight: FontWeight.w400),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              weight += 10;
                            });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: ColorManager.primary,
                          )),
                      CustomText(
                          txt: DeliveryCubit.get(context)
                              .weightCubit
                              .toString()),
                      IconButton(
                          onPressed: () {
                            if (weight != 0) {
                              setState(() {
                                weight -= 10;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove_circle_outlined,
                            color: ColorManager.primary,
                          )),
                    ],
                  ),
                  30.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: sourceController,
                      readOnly: true,
                      lableText: AppStrings.labelSource,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: destinationController,
                      readOnly: true,
                      lableText: AppStrings.labelDestination,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: noteController,
                      readOnly: false,
                      lableText: AppStrings.textField5,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
              Container(
                margin: REdgeInsetsDirectional.only(top: 650, end: 0, start: 0),
                padding: REdgeInsetsDirectional.only(start: 20, end: 20),
                width: double.infinity,
                height: 117.h,
                decoration: BoxDecoration(
                  color: ColorManager.purple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(46.r),
                    topLeft: Radius.circular(46.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    15.horizontalSpace,
                    Expanded(
                        child: CustomGeneralButton(
                      onTap: () async {
                        final val = await DeliveryCubit.get(context)
                            .deliveryPointCubit();
                        if (val) {
                          Navigator.pushNamed(
                              context, Routes.confirmationPassengerRoute);
                        } else {
                          BotToast.showText(text: 'حدث خطأ ما!');
                        }
                      },
                      text: AppStrings.confBtn,
                    )),
                    const Spacer(),
                    Expanded(child: BlocBuilder<InitialCubit, InitialStates>(
                        builder: (context, state) {
                      if (state is OrderCheckSuccessState) {
                        return Padding(
                          padding: REdgeInsetsDirectional.only(
                            top: 20,
                          ),
                          child: Column(
                            children: [
                              const CustomText(txt: AppStrings.costDelivery),
                              CustomText(
                                  txtColor: ColorManager.dark,
                                  fontWeight: FontWeight.w400,
                                  txt:
                                      '${state.listOrder.deliveryCoast.toString()}ل.س '),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ),
                        );
                      }
                    })),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

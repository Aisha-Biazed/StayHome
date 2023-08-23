import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import 'dart:ui' as ui;
import 'package:day_night_time_picker/day_night_time_picker.dart';

import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../resources/routes_manager.dart';
import '../../DeliveryOrder/pages/order_review_delivery_page_1.dart';
import '../cubit/passenger_cubit.dart';

class OrderReviewPassengerPage1 extends StatefulWidget {
  const OrderReviewPassengerPage1({Key? key}) : super(key: key);

  @override
  State<OrderReviewPassengerPage1> createState() => _OrderReviewPassengerPage1State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewPassengerPage1State extends State<OrderReviewPassengerPage1> {
  String timeSelected = options[0];
  String destination = choices[0];
  TextEditingController dateinput = TextEditingController(text: "");
  TextEditingController timeinput = TextEditingController(text: "");
  TextEditingController noteController = TextEditingController(text: "");
  TextEditingController sourceController = TextEditingController(text: "");
  TextEditingController destinationController = TextEditingController(text: "");
  int number = 1;

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = ""; //set the initial value of text field
    sourceController.text = PassengerCubit.get(context).nameSourceCubit;
    destinationController.text = PassengerCubit.get(context).nameDestinationCubit;
    super.initState(); //set the initial value of text field
    super.initState();
  }

  String? selectedTime;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
      selectedTime = '${newTime.hour}:${newTime.minute}';
    });
  }

  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<PassengerCubit, PassengerState>(
        builder: (context, state) {
          return BlocListener<PassengerCubit, PassengerState>(
            listener: (context, state) {
              // if (state is OrderPassengerSuccessState) {
              //   Navigator.pushNamed(context, Routes.orderReviewPassengerRoute2);
              // }
            },
            child: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: Padding(
                padding: REdgeInsetsDirectional.only(
                  start: 0,
                  end: 0,
                  top: 61,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      txt: AppStrings.orderBeforeAdd,
                      fontSize: 30.sp,
                      txtColor: ColorManager.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    20.verticalSpace,
                    OrderDateTime(initVal: PassengerCubit.get(context).scheduleDate, onChange: (val){
                      PassengerCubit.get(context).setScheduleDate(value: val);
                    }),
                    CustomText(txt: AppStrings.numberOfPassenger, fontSize: 20.sp, txtColor: ColorManager.dark, fontWeight: FontWeight.w400),
                    5.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                number++;
                              });
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: ColorManager.primary,
                            )),
                        CustomText(txt: number.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                number--;
                              });
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
                        controller: sourceController..text = PassengerCubit.get(context).nameSourceCubit,

                        onTap: () {
                          Navigator.pushNamed(context, Routes.addressSourcePassengerRoute);
                        },
                        readOnly: true,
                        hintText:
                            PassengerCubit.get(context).nameSourceCubit == '' ? AppStrings.textField3 : PassengerCubit.get(context).nameSourceCubit,
                        color: ColorManager.secondaryGrey,
                        lableText: AppStrings.textField3,
                      ),
                    ),
                    30.verticalSpace,
                    Container(
                      margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                      decoration: ThemeHelper().inputBoxDecorationShadow(),
                      child: CustomTextFormField(
                        controller: destinationController..text = PassengerCubit.get(context).nameDestinationCubit,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.addressDestinationPassengerRoute);
                        },
                        readOnly: true,
                        hintText: PassengerCubit.get(context).nameDestinationCubit == ''
                            ? AppStrings.textField3
                            : PassengerCubit.get(context).nameDestinationCubit,
                        lableText: AppStrings.textField4,
                        color: ColorManager.secondaryGrey,
                      ),
                    ),
                    30.verticalSpace,
                    Container(
                      margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                      decoration: ThemeHelper().inputBoxDecorationShadow(),
                      child: CustomTextFormField(
                        onTap: () {
                          PassengerCubit.get(context).getNote(value: noteController.text.toString());
                        },
                        controller: noteController,
                        readOnly: false,
                        lableText: AppStrings.textField5,
                        color: ColorManager.secondaryGrey,
                      ),
                    ),
                    30.verticalSpace,
                    Container(
                      margin: REdgeInsetsDirectional.only(start: 40, end: 40),
                      child: CustomGeneralButton(
                        text: AppStrings.requestBtn,
                        onTap: () {
                          print(PassengerCubit.get(context).sourceStreetCubit);
                          print(PassengerCubit.get(context).detailsSourceCubit);
                          print(PassengerCubit.get(context).idSourceCubit);
                          print(PassengerCubit.get(context).destinationStreetCubit);
                          print(PassengerCubit.get(context).detailsDestinationCubit);
                          print(PassengerCubit.get(context).idDestinationCubit);
                          PassengerCubit.get(context).getNumber(value: number);
                          PassengerCubit.get(context).getNote(value: noteController.text.toString());
                          if(PassengerCubit.get(context).idSourceCubit==''){
                            Navigator.pushNamed(context, Routes.addressSourcePassengerRoute);
                          } else if(PassengerCubit.get(context).idDestinationCubit==''){
                            Navigator.pushNamed(context, Routes.addressDestinationPassengerRoute);
                          }else {
                            Navigator.pushNamed(context, Routes.orderReviewPassengerRoute2);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

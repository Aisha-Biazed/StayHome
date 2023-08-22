import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import 'dart:ui' as ui;
import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../login/cubit/cubit.dart';
import '../../../../ratings/widgets/custom_buttons.dart';
import '../../../../resources/routes_manager.dart';

class OrderReviewForShopPage2 extends StatefulWidget {
  const OrderReviewForShopPage2({Key? key}) : super(key: key);

  @override
  State<OrderReviewForShopPage2> createState() =>
      _OrderReviewForShopPage2State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewForShopPage2State extends State<OrderReviewForShopPage2> {
  String timeSelected = options[0];
  String destination = choices[0];
  bool? check1 = false, check2 = true, check3 = false, check4 = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  var noteController = TextEditingController(text: "");
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
    super.initState();
  }

  Time _time = Time(hour: 11, minute: 30, second: 20);
  String? selectedTime;
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
      selectedTime = '${newTime.hour}:${newTime.minute}';
    });
  }

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).orderCheckCubit(
        ShippingCubit.get(context).idDestinationCubit,
        ShippingCubit.get(context).shopIdCubit);
    var noteController =
        TextEditingController(text: ShippingCubit.get(context).noteCubit);
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
                  15.verticalSpace,
                  CustomText(
                      txt: AppStrings.chooseTheTime,
                      fontSize: 20.sp,
                      txtColor: ColorManager.dark,
                      fontWeight: FontWeight.w400),
                  15.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          activeColor: ColorManager.primary,
                          title: CustomText(
                            txt: AppStrings.fastTime,
                            txtColor: ColorManager.dark,
                            fontSize: 17,
                          ),
                          value: options[0],
                          groupValue: timeSelected,
                          onChanged: (value) {
                            setState(() {
                              timeSelected = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: ColorManager.primary,
                          title: CustomText(
                            txt: AppStrings.selectTime,
                            txtColor: ColorManager.dark,
                            fontSize: 17,
                          ),
                          value: options[1],
                          groupValue: timeSelected,
                          onChanged: (value) {
                            setState(() {
                              timeSelected = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Visibility(
                    visible: timeSelected == options[1],
                    child: Container(
                      margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                      decoration: ThemeHelper().inputBoxDecorationShadow(),
                      child: CustomTextFormField(
                        controller: dateinput,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        suffexIcon: Icon(
                          Icons.date_range,
                          color: ColorManager.primary,
                        ),
                        lableText: AppStrings.textField1,
                        color: ColorManager.secondaryGrey,
                        readOnly: true,
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Visibility(
                    visible: timeSelected == options[1],
                    child: Container(
                      margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                      decoration: ThemeHelper().inputBoxDecorationShadow(),
                      child: CustomTextFormField(
                        controller: timeinput,
                        readOnly: false,
                        onTap: () async {
                          TimeOfDay now = TimeOfDay.now();
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: now,
                          );
                          if (pickedTime != null) {
                            String formattedTime = DateFormat('h:mm a').format(
                              DateTime(2023, 1, 1, pickedTime.hour,
                                  pickedTime.minute),
                            );
                            setState(() {
                              selectedTime = formattedTime;
                              timeinput.text = formattedTime;
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                        lableText: AppStrings.textField2,
                        color: ColorManager.secondaryGrey,
                        suffexIcon: Icon(
                          Icons.access_time_rounded,
                          color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  15.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      readOnly: false,
                      lableText: AppStrings.deliveryText_2,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      readOnly: false,
                      lableText: AppStrings.note1,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: noteController,
                      readOnly: false,
                      lableText: AppStrings.note,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                ],
              ),
              Container(
                margin: REdgeInsetsDirectional.only(top: 570, end: 0, start: 0),
                padding: REdgeInsetsDirectional.only(
                    start: 20, end: 20, bottom: 10, top: 10),
                width: double.infinity,
                height: 230.h,
                decoration: BoxDecoration(
                  color: ColorManager.purple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(46.r),
                    topLeft: Radius.circular(46.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        CustomText(
                          txt: AppStrings.numberOfProducts,
                          fontSize: 14,
                        ),
                        Spacer(),
                        CustomText(
                          txt: AppStrings.n6,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    DottedLine(
                      dashColor: ColorManager.lineGrey,
                      lineThickness: 2,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          txt: AppStrings.totalCost,
                          fontSize: 14,
                        ),
                        const Spacer(),
                        CustomText(
                          txt: ShippingCubit.get(context).totalCubit.toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                    DottedLine(
                      dashColor: ColorManager.lineGrey,
                      lineThickness: 2,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          txt: AppStrings.costDelivery,
                          fontSize: 14,
                        ),
                        const Spacer(),
                        BlocBuilder<InitialCubit, InitialStates>(
                          builder: (context, state) {
                            if (state is OrderCheckSuccessState) {
                              return CustomText(
                                txt: state.listOrder.deliveryCoast.toString(),
                                fontSize: 14,
                              );
                            } else {
                              return SizedBox(
                                height: 2,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.primary,
                                    strokeWidth: 2,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      dashGradient: [
                        ColorManager.primary,
                        ColorManager.lineGrey
                      ],
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapGradient: [
                        ColorManager.primary,
                        ColorManager.lineGrey
                      ],
                      dashGapRadius: 0.0,
                    ),
                    Row(
                      children: const [
                        CustomText(
                          txt: AppStrings.finalCost,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        CustomText(
                          txt: AppStrings.n700,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: CustomButtons(
                          onPressed: () {
                            print(
                                ShippingCubit.get(context).idDestinationCubit);
                            // Navigator.pushNamed(
                            //     context, Routes.addressDestinationRoute);
                          },
                          text: AppStrings.confBtn,
                          color: ColorManager.primary,
                        )),
                        const Spacer(),
                        Expanded(
                            child: CustomButtons(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.addressDestinationRoute);
                          },
                          text: AppStrings.cartBtn,
                          color: ColorManager.secondary1,
                        )),
                      ],
                    ),
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

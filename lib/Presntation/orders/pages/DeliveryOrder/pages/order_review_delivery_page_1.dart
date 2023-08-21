import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'dart:ui' as ui;
import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../cubit/delivery_cubit.dart';
import 'add_address_source_delivery_page.dart';

class OrderReviewDeliveryPage1 extends StatefulWidget {
  const OrderReviewDeliveryPage1({Key? key}) : super(key: key);

  @override
  State<OrderReviewDeliveryPage1> createState() => _OrderReviewDeliveryPage1State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewDeliveryPage1State extends State<OrderReviewDeliveryPage1> {
  String timeSelected = options[0];
  String destination = choices[0];
  bool? check1 = false, check2 = true, check3 = false, check4 = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController shopIdController = TextEditingController(text: "");
  TextEditingController destinationController = TextEditingController(text: "");
  var destinationAreaIdController = TextEditingController(text: "");
  var destinationStreetController = TextEditingController(text: "");
  var destinationAdditionalController = TextEditingController(text: "");
  var noteController = TextEditingController(text: "");
  int weight = 0;

  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = ""; //set the initial value of text field
    DeliveryCubit.get(context).reset();
    super.initState(); //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var destinationController = TextEditingController(text: '${AppStrings.destinationText}${DeliveryCubit.get(context).nameDestinationCubit}');
    var sourceController = TextEditingController(text: '${AppStrings.sourceText}${DeliveryCubit.get(context).nameSourceCubit}');
    var noteController = TextEditingController(text: DeliveryCubit.get(context).noteCubit);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<DeliveryCubit, DeliveryState>(
        builder: (context, state) {
          return BlocListener<DeliveryCubit, DeliveryState>(
            listener: (context, state) {
              // if (state is OrderDeliverySuccessState) {
              //   Navigator.pushNamed(context, Routes.orderReviewDeliveryRoute2);
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
                      fontWeight: FontWeight.w700,
                    ),
                    20.verticalSpace,
                    CustomText(txt: AppStrings.chooseTheTime, fontSize: 20.sp, txtColor: ColorManager.dark, fontWeight: FontWeight.w400),
                    10.verticalSpace,
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
                    20.verticalSpace,
                    if (timeSelected == options[1])
                      Column(
                        children: [
                          Container(
                            margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                            decoration: ThemeHelper().inputBoxDecorationShadow(),
                            child: CustomTextFormField(
                              controller: dateinput,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement
                                  setState(() {
                                    dateinput.text = formattedDate; //set output date to TextField value.
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
                          20.verticalSpace,
                          Container(
                            margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                            decoration: ThemeHelper().inputBoxDecorationShadow(),
                            child: CustomTextFormField(
                              controller: timeinput,
                              readOnly: false,
                              onTap: () async {
                                // TimeOfDay now = TimeOfDay.now();
                                // TimeOfDay? pickedTime = await showTimePicker(
                                //   context: context,
                                //   initialTime: now,
                                // );
                                // if (pickedTime != null) {
                                //   String formattedTime =
                                //   DateFormat('h:mm a').format(
                                //     DateTime(2023, 1, 1, pickedTime.hour,
                                //         pickedTime.minute),
                                //   );
                                //   setState(() {
                                //     selectedTime = formattedTime;
                                //     timeinput.text = formattedTime;
                                //   });
                                // } else {
                                //   print("Time is not selected");
                                // }
                              },
                              lableText: AppStrings.textField2,
                              color: ColorManager.secondaryGrey,
                              suffexIcon: Icon(
                                Icons.access_time_rounded,
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                          20.verticalSpace,
                        ],
                      ).animate().fadeIn(),
                    CustomText(txt: AppStrings.weightOfPassenger, fontSize: 20.sp, txtColor: ColorManager.dark, fontWeight: FontWeight.w400),
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
                        CustomText(txt: weight.toString()),
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
                        onTap: () {
                          DeliveryCubit.get(context).setNote(value: noteController.text.toString());
                          DeliveryCubit.get(context).setWeight(value: weight);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressSourceDeliveryPage()));
                        },
                        readOnly: true,
                        hintText:
                            DeliveryCubit.get(context).nameSourceCubit == '' ? AppStrings.textField3 : DeliveryCubit.get(context).nameSourceCubit,
                        color: ColorManager.secondaryGrey,
                        lableText: AppStrings.textField3,
                      ),
                    ),
                    30.verticalSpace,
                    Container(
                      margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                      decoration: ThemeHelper().inputBoxDecorationShadow(),
                      child: CustomTextFormField(
                        controller: destinationController,
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, Routes.addressDestinationDeliveryRoute);
                        },
                        readOnly: false,
                        hintText: DeliveryCubit.get(context).nameDestinationCubit == ''
                            ? AppStrings.textField3
                            : DeliveryCubit.get(context).nameDestinationCubit,
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
                          DeliveryCubit.get(context).setNote(value: noteController.text.toString());
                        },
                        controller: noteController,
                        readOnly: false,
                        lableText: AppStrings.textField5,
                        color: ColorManager.secondaryGrey,
                      ),
                    ),
                    30.verticalSpace,
                    // Container(
                    //   margin: REdgeInsetsDirectional.only(start: 40, end: 40),
                    //   child: CustomGeneralButton(
                    //     text: AppStrings.requestBtn,
                    //     onTap: () {
                    //       print(DeliveryCubit.get(context).sourceStreetCubit);
                    //       print(DeliveryCubit.get(context).detailsSourceCubit);
                    //       print(DeliveryCubit.get(context).idSourceCubit);
                    //       print(DeliveryCubit.get(context).destinationStreetCubit);
                    //       print(DeliveryCubit.get(context).detailsDestinationCubit);
                    //       print(DeliveryCubit.get(context).idDestinationCubit);
                    //       // DeliveryCubit.get(context).getNumber(value: number);
                    //
                    //       // Navigator.pushNamed(context, Routes.orderReviewDeliveryRoute2);
                    //       // DeliveryCubit.get(context).orderDeliveryCubit(
                    //       //   sourceAreaID:
                    //       //       DeliveryCubit.get(context).idSourceCubit,
                    //       //   destinationAreaID:
                    //       //       DeliveryCubit.get(context).idDestinationCubit,
                    //       //   note: DeliveryCubit.get(context).noteCubit,
                    //       //   numberOfDelivery:
                    //       //       DeliveryCubit.get(context).numberCubit,
                    //       //   sourceStreet:
                    //       //       DeliveryCubit.get(context).sourceStreetCubit,
                    //       //   destinationStreet: DeliveryCubit.get(context)
                    //       //       .destinationStreetCubit,
                    //       //   sourceAdditional:
                    //       //       DeliveryCubit.get(context).detailsSourceCubit,
                    //       //   destinationAdditional: DeliveryCubit.get(context)
                    //       //       .detailsDestinationCubit,
                    //       //   // scheduleDate: ,
                    //       // );
                    //     },
                    //   ),
                    // ),
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
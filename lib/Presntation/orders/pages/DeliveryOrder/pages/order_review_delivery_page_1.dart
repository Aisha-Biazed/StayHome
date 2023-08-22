import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
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

class _OrderReviewDeliveryPage1State extends State<OrderReviewDeliveryPage1> {
  TextEditingController shopIdController = TextEditingController(text: "");
  TextEditingController destinationController = TextEditingController(text: "");
  var destinationAreaIdController = TextEditingController(text: "");
  var destinationStreetController = TextEditingController(text: "");
  var destinationAdditionalController = TextEditingController(text: "");
  var noteController = TextEditingController(text: "");
  int weight = 0;

  @override
  void initState() {
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
            listener: (context, state) {},
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
                    OrderDateTime(),
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

class OrderDateTime extends StatefulWidget {
  const OrderDateTime({Key? key}) : super(key: key);

  @override
  State<OrderDateTime> createState() => _OrderDateTimeState();
}

class _OrderDateTimeState extends State<OrderDateTime> {
  List<String> options = ['fastTime', 'selectTime'];

  TextEditingController dateinput = TextEditingController();

  TextEditingController timeinput = TextEditingController();

  late String timeSelected;
  Time val = Time(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = DateFormat('HH:mm a').format(
      DateTime(2023, 1, 1, val.hour, val.minute),
    );
    timeSelected = options[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    DateTime? pickedDate =
                        await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        dateinput.text = formattedDate;
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
                  readOnly: true,
                  onTap: () async {
                    Navigator.of(context).push(await showPicker(
                      context: context,
                      value: val ,
                      onChange: (time) {
                        setState(() {
                          val = time;
                        });
                        print('valval');
                        print(val);
                        final pickedTime = val;
                        String formattedTime = DateFormat('HH:mm a').format(
                          DateTime(2023, 1, 1, pickedTime.hour, pickedTime.minute),
                        );
                        setState(() {
                          timeinput.text = formattedTime;
                        });
                        setState(() {

                        });
                      },
                    ));

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
      ],
    );
  }
}

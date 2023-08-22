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
import '../cubit/passenger_cubit.dart';

class OrderReviewPassengerPage1 extends StatefulWidget {
  const OrderReviewPassengerPage1({Key? key}) : super(key: key);

  @override
  State<OrderReviewPassengerPage1> createState() =>
      _OrderReviewPassengerPage1State();
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
    destinationController.text =
        PassengerCubit.get(context).nameDestinationCubit;
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
                    CustomText(
                        txt: AppStrings.chooseTheTime,
                        fontSize: 20.sp,
                        txtColor: ColorManager.dark,
                        fontWeight: FontWeight.w400),
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
                            margin:
                                REdgeInsetsDirectional.only(start: 21, end: 21),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
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
                          20.verticalSpace,
                          Container(
                            margin:
                                REdgeInsetsDirectional.only(start: 21, end: 21),
                            decoration:
                                ThemeHelper().inputBoxDecorationShadow(),
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
                                  String formattedTime =
                                      DateFormat('h:mm a').format(
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
                          20.verticalSpace,
                        ],
                      ).animate().fadeIn(),
                    CustomText(
                        txt: AppStrings.numberOfPassenger,
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
                        controller: sourceController,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.addressSourcePassengerRoute);
                        },
                        readOnly: true,
                        hintText:
                            PassengerCubit.get(context).nameSourceCubit == ''
                                ? AppStrings.textField3
                                : PassengerCubit.get(context).nameSourceCubit,
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
                          Navigator.pushNamed(
                              context, Routes.addressDestinationPassengerRoute);
                        },
                        readOnly: false,
                        hintText: PassengerCubit.get(context)
                                    .nameDestinationCubit ==
                                ''
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
                          PassengerCubit.get(context)
                              .getNote(value: noteController.text.toString());
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
                          print(PassengerCubit.get(context)
                              .destinationStreetCubit);
                          print(PassengerCubit.get(context)
                              .detailsDestinationCubit);
                          print(PassengerCubit.get(context).idDestinationCubit);
                          PassengerCubit.get(context).getNumber(value: number);
                          PassengerCubit.get(context)
                              .getNote(value: noteController.text.toString());
                          Navigator.pushNamed(
                              context, Routes.orderReviewPassengerRoute2);
                          // PassengerCubit.get(context).orderPassengerCubit(
                          //   sourceAreaID:
                          //       PassengerCubit.get(context).idSourceCubit,
                          //   destinationAreaID:
                          //       PassengerCubit.get(context).idDestinationCubit,
                          //   note: PassengerCubit.get(context).noteCubit,
                          //   numberOfPassenger:
                          //       PassengerCubit.get(context).numberCubit,
                          //   sourceStreet:
                          //       PassengerCubit.get(context).sourceStreetCubit,
                          //   destinationStreet: PassengerCubit.get(context)
                          //       .destinationStreetCubit,
                          //   sourceAdditional:
                          //       PassengerCubit.get(context).detailsSourceCubit,
                          //   destinationAdditional: PassengerCubit.get(context)
                          //       .detailsDestinationCubit,
                          //   // scheduleDate: ,
                          // );
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                showPicker(
                  context: context,
                  isInlinePicker: true,
                  elevation: 1,
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: TimePickerInterval.FIVE,
                  iosStylePicker: iosStyle,
                  minHour: DateTime.now().hour.toDouble(),
                  minMinute: DateTime.now().minute.toDouble(),
                  maxHour: 21,
                  is24HrFormat: false,
                ),
                Text(
                  "IOS Style",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Switch(
                  value: iosStyle,
                  onChanged: (newVal) {
                    setState(() {
                      iosStyle = newVal;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

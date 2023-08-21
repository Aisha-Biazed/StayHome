import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
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

class OrderReviewPassengerPage2 extends StatefulWidget {
  const OrderReviewPassengerPage2({Key? key}) : super(key: key);

  @override
  State<OrderReviewPassengerPage2> createState() =>
      _OrderReviewPassengerPage2State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewPassengerPage2State extends State<OrderReviewPassengerPage2> {
  String timeSelected = options[0];
  String destination = choices[0];
  bool? check1 = false, check2 = true, check3 = false, check4 = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  int number = 1;
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
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
    InitialCubit.get(context).orderCheckCubit(
        PassengerCubit.get(context).idDestinationCubit,
        PassengerCubit.get(context).idSourceCubit);
    var destinationController = TextEditingController(
        text:
            '${AppStrings.destinationText}${PassengerCubit.get(context).nameDestinationCubit}');
    var sourceController = TextEditingController(
        text:
            '${AppStrings.sourceText}${PassengerCubit.get(context).nameSourceCubit}');
    var noteController =
        TextEditingController(text: PassengerCubit.get(context).noteCubit);
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
                    fontWeight: FontWeight.w700,
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
                  if(timeSelected == options[1])
                  Column(
                    children: [
                      Container(
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
                      20.verticalSpace,
                      Container(
                        margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                        decoration: ThemeHelper().inputBoxDecorationShadow(),
                        child: CustomTextFormField(
                          controller: timeinput,
                          readOnly: true,
                          // onTap: () async {
                          //   TimeOfDay now = TimeOfDay.now();
                          //   TimeOfDay? pickedTime = await showTimePicker(
                          //     context: context,
                          //     initialTime: now,
                          //   );
                          //   if (pickedTime != null) {
                          //     print(pickedTime.format(context)); //output 10:51 PM
                          //     DateTime parsedTime = DateFormat.jm()
                          //         .parse(pickedTime.format(context).toString());
                          //     //converting to DateTime so that we can further format on different pattern.
                          //     print(parsedTime); //output 1970-01-01 22:53:00.000
                          //     String formattedTime =
                          //         DateFormat('HH:mm:ss').format(parsedTime);
                          //     print(formattedTime); //output 14:59:00
                          //     //DateFormat() is from intl package, you can format the time on any pattern you need.
                          //     setState(() {
                          //       timeinput.text =
                          //           formattedTime; //set the value of text field.
                          //     });
                          //   } else {
                          //     print("Time is not selected");
                          //   }
                          // },
                          lableText: AppStrings.textField2,
                          color: ColorManager.secondaryGrey,
                          suffexIcon: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.showpicker);
                            },
                            child: Icon(
                              Icons.access_time_rounded,
                              color: ColorManager.primary,
                            ),
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
                      CustomText(
                          txt: PassengerCubit.get(context)
                              .numberCubit
                              .toString()),
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
                        final val  = await PassengerCubit.get(context).orderPassengerCubit();
                        if(val) {
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

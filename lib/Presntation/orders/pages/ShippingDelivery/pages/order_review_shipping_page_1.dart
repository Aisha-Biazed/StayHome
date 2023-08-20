import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';

import '../../../../../core/utils/theme_helper.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../resources/routes_manager.dart';
import 'dart:ui' as ui;
import 'package:day_night_time_picker/day_night_time_picker.dart';

class OrderReviewShippingPage1 extends StatefulWidget {
  const OrderReviewShippingPage1({Key? key}) : super(key: key);

  @override
  State<OrderReviewShippingPage1> createState() =>
      _OrderReviewShippingPage1State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewShippingPage1State extends State<OrderReviewShippingPage1> {
  String timeSelected = options[0];
  String destination = choices[0];
  TextEditingController dateinput = TextEditingController(text: "");
  TextEditingController timeinput = TextEditingController(text: "");

  // TextEditingController destinationController = TextEditingController(text: "");
  // TextEditingController sourceController = TextEditingController(text: "");
  double weight = 100.0;
  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = ""; //set the initial value of text field
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
    TextEditingController noteController = TextEditingController(text: "");
    TextEditingController sourceController = TextEditingController(
        text: "${ShippingCubit.get(context).nameSourceCubit}");
    TextEditingController destinationController = TextEditingController(
        text: "${ShippingCubit.get(context).nameDestinationCubit}");
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
            child: Form(
              key: formkey,
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
                  20.verticalSpace,
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
                  // Visibility(
                  //   visible: timeSelected == options[1],
                  //   child: Container(
                  //     margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                  //     decoration: ThemeHelper().inputBoxDecorationShadow(),
                  //     child: CustomTextFormField(
                  //       initialValue: selectedTime,
                  //       inputType: TextInputType.datetime,
                  //       controller: timeinput,
                  //       readOnly: false,
                  //       lableText: AppStrings.textField2,
                  //       color: ColorManager.secondaryGrey,
                  //       suffexIcon: GestureDetector(
                  //         onTap: () {
                  //           Navigator.pushNamed(context, Routes.showpicker);
                  //         },
                  //         child: Icon(
                  //           Icons.access_time_rounded,
                  //           color: ColorManager.primary,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  50.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: sourceController,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.shippingAddressSourceRoute);
                      },
                      readOnly: true,
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
                            context, Routes.shippingAddressDestinationRoute);
                      },
                      readOnly: false,
                      hintText:
                          ShippingCubit.get(context).nameDestinationCubit == ''
                              ? AppStrings.textField3
                              : ShippingCubit.get(context).nameDestinationCubit,
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
                        ShippingCubit.get(context)
                            .getNote(value: noteController.text.toString());
                      },
                      controller: noteController,
                      readOnly: false,
                      lableText: AppStrings.textField5,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          icon: Icon(
                            Icons.remove_circle_outlined,
                            color: ColorManager.primary,
                          )),
                      const CustomText(txt: AppStrings.kg),
                      CustomText(txt: weight.toString()),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: ColorManager.primary,
                          )),
                    ],
                  ),
                  30.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 40, end: 40),
                    child: BlocBuilder<ShippingCubit, ShippingState>(
                      builder: (context, state) {
                        return CustomGeneralButton(
                          text: AppStrings.requestBtn,
                          onTap: () {
                            print(ShippingCubit.get(context).sourceStreetCubit);
                            print(
                                ShippingCubit.get(context).detailsSourceCubit);
                            print(ShippingCubit.get(context).idSourceCubit);
                            print("mmmmmmmmmmmmmmmmmmmmmmmmmm");
                            print(ShippingCubit.get(context)
                                .destinationStreetCubit);
                            print(ShippingCubit.get(context)
                                .detailsDestinationCubit);
                            print(
                                ShippingCubit.get(context).idDestinationCubit);
                            ShippingCubit.get(context).getWeight(value: weight);
                            ShippingCubit.get(context)
                                .getNote(value: noteController.text.toString());
                            if (formkey.currentState!.validate()) {
                              ShippingCubit.get(context).shippingOrderCubit(
                                note: ShippingCubit.get(context).noteCubit,
                                sourceStreet: ShippingCubit.get(context)
                                    .sourceStreetCubit,
                                destinationStreet: ShippingCubit.get(context)
                                    .destinationStreetCubit,
                                sourceAdditional: ShippingCubit.get(context)
                                    .detailsSourceCubit,
                                destinationAdditional:
                                    ShippingCubit.get(context)
                                        .detailsDestinationCubit,
                                destinationAreaId: ShippingCubit.get(context)
                                    .idDestinationCubit,
                                sourceAreaId:
                                    ShippingCubit.get(context).idSourceCubit,
                                weight: ShippingCubit.get(context).weightCubit,

                                // scheduleDate: ,
                              );
                              Navigator.pushNamed(
                                  context, Routes.reviewShippingRoute_2);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
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

//
// class OrderReviewShippingPage1 extends StatefulWidget {
//   const OrderReviewShippingPage1({Key? key}) : super(key: key);
//
//   @override
//   State<OrderReviewShippingPage1> createState() =>
//       _OrderReviewShippingPage1State();
// }
//
// List<String> options = ['fastTime', 'selectTime'];
// List<String> choices = ['point', 'store'];
//
// class _OrderReviewShippingPage1State extends State<OrderReviewShippingPage1> {
//   String timeSelected = options[0];
//   String destination = choices[0];
//   bool? check1 = false, check2 = true, check3 = false, check4 = false;
//   bool checkedValue = false;
//   bool checkboxValue = false;
//   int weight = 100;
//   TextEditingController dateinput = TextEditingController();
//   TextEditingController timeinput = TextEditingController();
//   var destinationAreaIdController = TextEditingController(text: "");
//   var destinationStreetController = TextEditingController(text: "");
//   var destinationAdditionalController = TextEditingController(text: "");
//   var noteController = TextEditingController(text: "");
//   var sourceAreaIdController = TextEditingController(text: "");
//   var sourceStreetController = TextEditingController(text: "");
//   var sourceAdditionalController = TextEditingController(text: "");
//   var weightController = TextEditingController(text: "");
//
//   //text editing controller for text field
//
//   @override
//   void initState() {
//     dateinput.text = "";
//     timeinput.text = ""; //set the initial value of text field
//     super.initState(); //set the initial value of text field
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: REdgeInsetsDirectional.only(
//             start: 0,
//             end: 0,
//             top: 40,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomText(
//                 txt: AppStrings.orderBeforeAdd,
//                 fontSize: 30.sp,
//                 txtColor: ColorManager.primary,
//                 fontWeight: FontWeight.w700,
//               ),
//               20.verticalSpace,
//               CustomText(
//                   txt: AppStrings.chooseTheTime,
//                   fontSize: 20.sp,
//                   txtColor: ColorManager.dark,
//                   fontWeight: FontWeight.w400),
//               10.verticalSpace,
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile(
//                       activeColor: ColorManager.primary,
//                       title: CustomText(
//                         txt: AppStrings.selectTime,
//                         txtColor: ColorManager.dark,
//                         fontSize: 17,
//                       ),
//                       value: options[0],
//                       groupValue: timeSelected,
//                       onChanged: (value) {
//                         setState(() {
//                           timeSelected = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile(
//                       activeColor: ColorManager.primary,
//                       title: CustomText(
//                         txt: AppStrings.fastTime,
//                         txtColor: ColorManager.dark,
//                         fontSize: 17,
//                       ),
//                       value: options[1],
//                       groupValue: timeSelected,
//                       onChanged: (value) {
//                         setState(() {
//                           timeSelected = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               30.verticalSpace,
//               Visibility(
//                 visible: timeSelected == options[0],
//                 child: Container(
//                   margin: REdgeInsetsDirectional.only(start: 21, end: 21),
//                   decoration: ThemeHelper().inputBoxDecorationShadow(),
//                   child: CustomTextFormField(
//                     controller: dateinput,
//                     onTap: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime.now(),
//                           lastDate: DateTime(2101));
//
//                       if (pickedDate != null) {
//                         print(
//                             pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                         String formattedDate =
//                             DateFormat('yyyy-MM-dd').format(pickedDate);
//                         print(
//                             formattedDate); //formatted date output using intl package =>  2021-03-16
//                         //you can implement different kind of Date Format here according to your requirement
//                         setState(() {
//                           dateinput.text =
//                               formattedDate; //set output date to TextField value.
//                         });
//                       } else {
//                         print("Date is not selected");
//                       }
//                     },
//                     suffexIcon: Icon(
//                       Icons.date_range,
//                       color: ColorManager.primary,
//                     ),
//                     lableText: AppStrings.textField1,
//                     color: ColorManager.secondaryGrey,
//                     readOnly: true,
//                   ),
//                 ),
//               ),
//               20.verticalSpace,
//               Visibility(
//                 visible: timeSelected == options[0],
//                 child: Container(
//                   margin: REdgeInsetsDirectional.only(start: 21, end: 21),
//                   decoration: ThemeHelper().inputBoxDecorationShadow(),
//                   child: CustomTextFormField(
//                     controller: timeinput,
//                     readOnly: true,
//                     onTap: () async {
//                       TimeOfDay now = TimeOfDay.now();
//                       TimeOfDay? pickedTime = await showTimePicker(
//                         context: context,
//                         initialTime: now,
//                       );
//                       if (pickedTime != null) {
//                         print(pickedTime.format(context)); //output 10:51 PM
//                         DateTime parsedTime = DateFormat.jm()
//                             .parse(pickedTime.format(context).toString());
//                         //converting to DateTime so that we can further format on different pattern.
//                         print(parsedTime); //output 1970-01-01 22:53:00.000
//                         String formattedTime =
//                             DateFormat('HH:mm:ss').format(parsedTime);
//                         print(formattedTime); //output 14:59:00
//                         //DateFormat() is from intl package, you can format the time on any pattern you need.
//                         setState(() {
//                           timeinput.text =
//                               formattedTime; //set the value of text field.
//                         });
//                       } else {
//                         print("Time is not selected");
//                       }
//                     },
//                     lableText: AppStrings.textField2,
//                     color: ColorManager.secondaryGrey,
//                     suffexIcon: Icon(
//                       Icons.access_time_rounded,
//                       color: ColorManager.primary,
//                     ),
//                   ),
//                 ),
//               ),
//               20.verticalSpace,
//               CustomText(
//                   txt: AppStrings.direction,
//                   fontSize: 20.sp,
//                   txtColor: ColorManager.dark,
//                   fontWeight: FontWeight.w400),
//               Padding(
//                 padding: REdgeInsetsDirectional.only(start: 20, end: 0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: RadioListTile(
//                         activeColor: ColorManager.primary,
//                         title: const CustomText(
//                           txt: AppStrings.point,
//                           fontSize: 17,
//                         ),
//                         value: choices[0],
//                         groupValue: destination,
//                         onChanged: (value) {
//                           setState(() {
//                             destination = value.toString();
//                           });
//                         },
//                       ),
//                     ),
//                     20.horizontalSpace,
//                     Expanded(
//                       child: RadioListTile(
//                         activeColor: ColorManager.primary,
//                         title: const CustomText(
//                           txt: AppStrings.dept,
//                           fontSize: 17,
//                         ),
//                         value: choices[1],
//                         groupValue: destination,
//                         onChanged: (value) {
//                           setState(() {
//                             destination = value.toString();
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               20.verticalSpace,
//               Container(
//                 margin: REdgeInsetsDirectional.only(start: 21, end: 21),
//                 decoration: ThemeHelper().inputBoxDecorationShadow(),
//                 child: CustomTextFormField(
//                   controller: destinationAreaIdController,
//                   readOnly: false,
//                   lableText: AppStrings.textField3,
//                   color: ColorManager.secondaryGrey,
//                   onTap: () {
//                     Navigator.pushNamed(
//                         context, Routes.shippingAddressSourceRoute);
//                   },
//                 ),
//               ),
//               20.verticalSpace,
//               Container(
//                 margin: REdgeInsetsDirectional.only(start: 21, end: 21),
//                 decoration: ThemeHelper().inputBoxDecorationShadow(),
//                 child: CustomTextFormField(
//                   readOnly: false,
//                   lableText: AppStrings.textField4,
//                   color: ColorManager.secondaryGrey,
//                   onTap: () {
//                     Navigator.pushNamed(
//                         context, Routes.shippingAddressDestinationRoute);
//                   },
//                 ),
//               ),
//               20.verticalSpace,
//               Container(
//                 margin: REdgeInsetsDirectional.only(start: 21, end: 21),
//                 decoration: ThemeHelper().inputBoxDecorationShadow(),
//                 child: CustomTextFormField(
//                   controller: noteController,
//                   readOnly: false,
//                   lableText: AppStrings.textField5,
//                   color: ColorManager.secondaryGrey,
//                 ),
//               ),
//
//               20.verticalSpace,
//               Container(
//                 margin: REdgeInsetsDirectional.only(start: 71, end: 71),
//                 child: BlocBuilder<InitialCubit, InitialStates>(
//                   builder: (context, state) {
//                     return CustomGeneralButton(
//                       text: AppStrings.requestBtn,
//                       onTap: () {
//                         // ShippingCubit.get(context).addShoppingOrderCubit(
//                         //     destinationAreaId:
//                         //         destinationAreaIdController.text.toString(),
//                         //     destinationStreet:
//                         //         destinationStreetController.text.toString(),
//                         //     destinationAdditional:
//                         //         destinationAdditionalController.text.toString(),
//                         //     note: noteController.text.toString(),
//                         //     sourceAreaId:
//                         //         sourceAreaIdController.text.toString(),
//                         //     sourceStreet:
//                         //         sourceStreetController.text.toString(),
//                         //     sourceAdditional:
//                         //         sourceAdditionalController.text.toString(),
//                         //     weight: weightController.text.toString());
//                         Navigator.pushNamed(
//                             context, Routes.reviewShippingRoute_2);
//                       },
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

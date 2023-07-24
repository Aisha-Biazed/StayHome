import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import 'dart:ui' as ui;
import '../../../core/utils/theme_helper.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../resources/routes_manager.dart';

class OrderReviewPage3 extends StatefulWidget {
  const OrderReviewPage3({Key? key}) : super(key: key);

  @override
  State<OrderReviewPage3> createState() => _OrderReviewPage3State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewPage3State extends State<OrderReviewPage3> {
  String timeSelected = options[0];
  String destination = choices[0];
  bool? check1 = false, check2 = true, check3 = false, check4 = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = ""; //set the initial value of text field
    super.initState(); //set the initial value of text field
    super.initState();
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
            end: 10,
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
                    readOnly: false,
                    lableText: AppStrings.textField2,
                    color: ColorManager.secondaryGrey,
                    suffexIcon: Icon(
                      Icons.access_time_rounded,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              CustomText(
                  txt: AppStrings.direction,
                  fontSize: 20.sp,
                  txtColor: ColorManager.dark,
                  fontWeight: FontWeight.w400),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      activeColor: ColorManager.primary,
                      title: const CustomText(
                        txt: AppStrings.dept,
                        fontSize: 17,
                      ),
                      value: choices[0],
                      groupValue: destination,
                      onChanged: (value) {
                        setState(() {
                          destination = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: ColorManager.primary,
                      title: const CustomText(
                        txt: AppStrings.point,
                        fontSize: 17,
                      ),
                      value: choices[1],
                      groupValue: destination,
                      onChanged: (value) {
                        setState(() {
                          destination = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField3_2,
                  color: ColorManager.secondaryGrey,
                ),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField3,
                  color: ColorManager.secondaryGrey,
                ),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField4,
                  color: ColorManager.secondaryGrey,
                ),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 71, end: 71),
                child: CustomGeneralButton(
                  text: AppStrings.confBtn,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.confirmationRoute);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

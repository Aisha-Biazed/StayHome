import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';

import '../../common/theme_helper.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_field.dart';
import '../resources/routes_manager.dart';

class OrderReviewPage2 extends StatefulWidget {
  const OrderReviewPage2({Key? key}) : super(key: key);

  @override
  State<OrderReviewPage2> createState() => _OrderReviewPage2State();
}

class _OrderReviewPage2State extends State<OrderReviewPage2> {
  String? gender;
  bool? check1 = false, check2 = true, check3 = false, check4 = false;
  bool checkedValue = false;
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: TextDirection.rtl,
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
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
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
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                child: CustomTextFormField(
                  readOnly: false,
                  suffexIcon: Icon(
                    Icons.date_range,
                    color: ColorManager.primary,
                  ),
                  lableText: AppStrings.textField1,
                  color: ColorManager.secondaryGrey,
                ),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField2,
                  color: ColorManager.secondaryGrey,
                  suffexIcon: Icon(
                    Icons.access_time_rounded,
                    color: ColorManager.primary,
                  ),
                ),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
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
                      value: "a",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
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
                      value: "b",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField3_2,
                  color: ColorManager.secondaryGrey,
                ),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField3,
                  color: ColorManager.secondaryGrey,
                ),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                child: CustomTextFormField(
                  readOnly: false,
                  lableText: AppStrings.textField4,
                  color: ColorManager.secondaryGrey,
                ),
                decoration: ThemeHelper().inputBoxDecorationShadow(),
              ),
              20.verticalSpace,
              Container(
                margin: REdgeInsetsDirectional.only(start: 71, end: 71),
                child: CustomGeneralButton(
                  text: AppStrings.requestBtn,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.addressRoute);
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

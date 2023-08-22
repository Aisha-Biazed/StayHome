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
import '../../../../resources/routes_manager.dart';
import '../../DeliveryOrder/pages/order_review_delivery_page_1.dart';
import '../cubit/shipping_cubit.dart';
import 'add_address_destination_shipping_page.dart';
import 'add_address_source_shipping_page.dart';

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
    ShippingCubit.get(context).reset();
    super.initState(); //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var destinationController = TextEditingController(text: '${AppStrings.destinationText}${ShippingCubit.get(context).nameDestinationCubit}');
    var sourceController = TextEditingController(text: '${AppStrings.sourceText}${ShippingCubit.get(context).nameSourceCubit}');
    var noteController = TextEditingController(text: ShippingCubit.get(context).noteCubit);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<ShippingCubit, ShippingState>(
        builder: (context, state) {
          return BlocListener<ShippingCubit, ShippingState>(
            listener: (context, state) {
              // if (state is OrderShippingSuccessState) {
              //   Navigator.pushNamed(context, Routes.orderReviewShippingRoute2);
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
                    OrderDateTime(initVal: ShippingCubit.get(context).scheduleDate, onChange: (val){
                      ShippingCubit.get(context).setScheduleDate(value: val);
                    }),
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
                          ShippingCubit.get(context).setNote(value: noteController.text.toString());
                          ShippingCubit.get(context).setWeight(value: weight);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressSourceShippingPage()));
                        },
                        readOnly: true,
                        hintText:
                            ShippingCubit.get(context).nameSourceCubit == '' ? AppStrings.textField3 : ShippingCubit.get(context).nameSourceCubit,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressDestinationShippingPage(fromShop: false,)));
                        },
                        readOnly: true,
                        hintText: ShippingCubit.get(context).nameDestinationCubit == ''
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
                          ShippingCubit.get(context).setNote(value: noteController.text.toString());
                        },
                        controller: noteController,
                        readOnly: false,
                        lableText: AppStrings.textField5,
                        color: ColorManager.secondaryGrey,
                      ),
                    ),
                    30.verticalSpace,
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

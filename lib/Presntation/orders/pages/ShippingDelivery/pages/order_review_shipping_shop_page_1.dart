import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import 'package:stay_home/Presntation/orders/store/Cubit/my_cart_cubit.dart';
import 'package:stay_home/Presntation/ratings/widgets/custom_buttons.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
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
import 'add_address_destination_shipping_page.dart';

class OrderReviewShippingShopPage1 extends StatefulWidget {
  const OrderReviewShippingShopPage1({Key? key}) : super(key: key);

  @override
  State<OrderReviewShippingShopPage1> createState() => _OrderReviewShippingShopPage1State();
}

List<String> options = ['fastTime', 'selectTime'];

class _OrderReviewShippingShopPage1State extends State<OrderReviewShippingShopPage1> {
  String timeSelected = options[0];
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController noteController = TextEditingController(text: "");
  TextEditingController destinationController = TextEditingController(text: "");

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
    super.initState();
  }

  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
  String? selectedTime;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
      selectedTime = '${newTime.hour}:${newTime.minute}';
    });
  }

  @override
  Widget build(BuildContext context) {
    var shopIdController = TextEditingController(text: "${AppStrings.sourceText}${ShippingCubit.get(context).shoppNameCubit}");
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
                  20.verticalSpace,
                  OrderDateTime(initVal: ShippingCubit.get(context).scheduleDate, onChange: (val){
                    ShippingCubit.get(context).setScheduleDate(value: val);
                  }),
                  20.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: shopIdController,
                      readOnly: true,
                      lableText: AppStrings.labelSource,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: destinationController,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressDestinationShippingPage(fromShop: true,)));
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
                ],
              ),
              Container(
                margin: REdgeInsetsDirectional.only(top: 640, end: 0, start: 0),
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
                    Expanded(
                        child: CustomButtons(
                      onPressed: () {
                        print(ShippingCubit.get(context).shopIdCubit);
                        // final result = ShippingCubit.get(context).shippingShopCubit(
                        //   cart: MyCartCubit.get(context).getCart(),
                        // );
                        Navigator.pushNamed(context, Routes.orderReviewRoute3);
                      },
                      text: AppStrings.requestBtn,
                      color: ColorManager.primary,
                    )),
                    const Spacer(),
                    Expanded(
                        child: CustomButtons(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.myCartRoute);
                      },
                      text: AppStrings.cartBtn,
                      color: ColorManager.secondary1,
                    )),
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

class ShowPickerPage extends StatefulWidget {
  const ShowPickerPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowPickerPageState createState() => _ShowPickerPageState();
}

class _ShowPickerPageState extends State<ShowPickerPage> {
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

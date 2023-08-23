import 'package:bot_toast/bot_toast.dart';
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
import '../../../store/Cubit/my_cart_cubit.dart';
import '../../../store/pages/my_cart_page.dart';
import '../../DeliveryOrder/pages/order_review_delivery_page_1.dart';

class OrderReviewShippingShopPage2 extends StatefulWidget {
  const OrderReviewShippingShopPage2({Key? key}) : super(key: key);

  @override
  State<OrderReviewShippingShopPage2> createState() => _OrderReviewShippingShopPage2State();
}

List<String> options = ['fastTime', 'selectTime'];
List<String> choices = ['point', 'store'];

class _OrderReviewShippingShopPage2State extends State<OrderReviewShippingShopPage2> {
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
    InitialCubit.get(context).orderCheckShopCubit(ShippingCubit.get(context).idDestinationCubit, ShippingCubit.get(context).shopIdCubit);
    var noteController = TextEditingController(text: ShippingCubit.get(context).noteCubit);
    var shopIdController = TextEditingController(text: "${AppStrings.sourceText}${ShippingCubit.get(context).shoppNameCubit}");
    var destinationController = TextEditingController(text: "${AppStrings.destinationText}${ShippingCubit.get(context).nameDestinationCubit}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Padding(
          padding: REdgeInsetsDirectional.only(
            start: 0,
            end: 0,
            top: 31,
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
                  15.verticalSpace,
                  OrderDateTime(initVal: ShippingCubit.get(context).scheduleDate, onChange: (val){
                    ShippingCubit.get(context).setScheduleDate(value: val);
                  }),
                  15.verticalSpace,
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
                  15.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: destinationController,
                      readOnly: true,
                      lableText: AppStrings.textField4,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    margin: REdgeInsetsDirectional.only(start: 21, end: 21),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                    child: CustomTextFormField(
                      controller: noteController,
                      onChanged: (val) {
                        ShippingCubit.get(context).setNote(value: val);
                      },
                      readOnly: false,
                      lableText: AppStrings.textField5,
                      color: ColorManager.secondaryGrey,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BlocBuilder<MyCartCubit, MyCartState>(
                  builder: (context, state) {
                    return Container(
                      padding: REdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10, top: 10),
                      width: double.infinity,
                      height: 200.h,
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
                            children: [
                              const CustomText(
                                txt: AppStrings.numberOfProducts,
                                fontSize: 14,
                              ),
                              const Spacer(),
                              CustomText(
                                txt: context.read<MyCartCubit>().getTotalProductsCount().toString(),
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
                                txt: MyCartCubit.get(context).getTotalProductsPrice().toString(),
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
                                      height: 16,
                                      width: 16,
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
                            dashGradient: [ColorManager.primary, ColorManager.lineGrey],
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                            dashGapColor: Colors.transparent,
                            dashGapGradient: [ColorManager.primary, ColorManager.lineGrey],
                            dashGapRadius: 0.0,
                          ),
                          Row(
                            children: [
                              const CustomText(
                                txt: AppStrings.finalCost,
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              BlocBuilder<InitialCubit, InitialStates>(
                                builder: (context, state) {
                                  if (state is OrderCheckSuccessState) {
                                    return CustomText(
                                      txt: (MyCartCubit.get(context).getTotalProductsPrice() + (state.listOrder.deliveryCoast ?? 0)).toString(),
                                      fontSize: 14,
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 16,
                                      width: 16,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: CustomButtons(
                                onPressed: () async {
                                  print(ShippingCubit.get(context).idDestinationCubit);
                                  final result = await ShippingCubit.get(context).shippingShopCubit(
                                    cart: MyCartCubit.get(context).getCart(),
                                  );
                                  if (result) {
                                    Navigator.pushNamed(context, Routes.confirmationPassengerRoute);
                                  } else {
                                    BotToast.showText(text: 'حدث خطأ ما!');
                                  }
                                },
                                text: AppStrings.confBtn,
                                color: ColorManager.primary,
                              )),
                              const Spacer(),
                              Expanded(
                                  child: CustomButtons(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MyCartPage(
                                        isReview: true,
                                      ),
                                    ),
                                  );
                                },
                                text: AppStrings.cartBtn,
                                color: ColorManager.secondary1,
                              )),
                            ],
                          ),
                        ],
                      ),
                    );
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

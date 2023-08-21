import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../orders/pages/DeliveryOrder/pages/order_review_delivery_page_1.dart';
import '../../orders/store/pages/store_page.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../widget/card_item.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(200.r), bottomLeft: Radius.circular(200.r))),
                  child: Image.asset(
                    ImageAssets.servicesImg,
                  ),
                ),
                Padding(
                  padding: REdgeInsetsDirectional.only(start: 127, end: 30, top: 65),
                  child: CustomText(
                    txt: AppStrings.service,
                    txtColor: ColorManager.white,
                    fontSize: 40.sp,
                  ),
                ),
              ],
            ),
            RSizedBox(
              height: 500.h,
              child: Padding(
                  padding: REdgeInsetsDirectional.only(start: 44, end: 25),
                  child: ListView(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: REdgeInsetsDirectional.only(top: 20, end: 30, start: 30),
                                height: 200.0,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        color: ColorManager.primary,
                                        width: 84.w,
                                        height: 3.h,
                                      ),
                                    ),
                                    20.verticalSpace,
                                    CustomGeneralButton(
                                      text: AppStrings.point,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const OrderReviewDeliveryPage1(),
                                          ),
                                        );
                                      },
                                    ),
                                    20.verticalSpace,
                                    CustomGeneralButton(
                                      text: AppStrings.dept,
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => StorePage()));
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const CardItem2(
                          title: AppStrings.serviceText1,
                          img: ImageAssets.serviceImg1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.orderReview1PassengerRoute);
                        },
                        child: const CardItem2(
                          title: AppStrings.serviceText2,
                          img: ImageAssets.serviceImg2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.orderReview1Route);
                        },
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: REdgeInsetsDirectional.only(top: 20, end: 30, start: 30),
                                  height: 200.0,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          color: ColorManager.primary,
                                          width: 84.w,
                                          height: 3.h,
                                        ),
                                      ),
                                      20.verticalSpace,
                                      CustomGeneralButton(
                                        text: AppStrings.point,
                                        onTap: () {
                                          Navigator.pushNamed(context, Routes.reviewShippingRoute_1);
                                        },
                                      ),
                                      20.verticalSpace,
                                      CustomGeneralButton(
                                        text: AppStrings.dept,
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const StorePage()));
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const CardItem2(
                            title: AppStrings.serviceText3,
                            img: ImageAssets.serviceImg3,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

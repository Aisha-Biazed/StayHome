import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../../core/widgets/custom_buttons.dart';
import '../../resources/routes_manager.dart';

class MyBasketPage extends StatelessWidget {
  const MyBasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              20.verticalSpace,
              Center(
                  child: CustomText(
                txt: AppStrings.myBasketTitle,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              )),
              Stack(
                children: [
                  Container(
                      padding: REdgeInsetsDirectional.only(
                          top: 40, start: 27, end: 27),
                      width: double.infinity,
                      height: 660,
                      decoration: BoxDecoration(
                          color: ColorManager.purple,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(46.r),
                            topLeft: Radius.circular(46.r),
                          )),
                      child: Column(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            color: ColorManager.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageAssets.basketImg1,
                                  width: 80.w,
                                  height: 75.h,
                                ),
                                Column(
                                  children: [
                                    const CustomText(
                                        txt: AppStrings.sportShose),
                                    40.verticalSpace,
                                    const CustomText(
                                        txt: AppStrings.priceShose),
                                  ],
                                ),
                                100.horizontalSpace,
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                    CustomText(txt: "1"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Card(
                            color: ColorManager.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageAssets.basketImg2,
                                  width: 80.w,
                                  height: 75.h,
                                ),
                                Column(
                                  children: [
                                    const CustomText(
                                        txt: AppStrings.sportT_shirt),
                                    40.verticalSpace,
                                    const CustomText(
                                        txt: AppStrings.priceShose),
                                  ],
                                ),
                                100.horizontalSpace,
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                    CustomText(txt: "1"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Card(
                            color: ColorManager.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageAssets.basketImg3,
                                  width: 80.w,
                                  height: 75.h,
                                ),
                                Column(
                                  children: [
                                    const CustomText(txt: AppStrings.sportBag),
                                    40.verticalSpace,
                                    const CustomText(
                                        txt: AppStrings.priceShose),
                                  ],
                                ),
                                100.horizontalSpace,
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                    CustomText(txt: "1"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Card(
                            color: ColorManager.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageAssets.basketImg4,
                                  width: 80.w,
                                  height: 75.h,
                                ),
                                Column(
                                  children: [
                                    const CustomText(txt: AppStrings.sportHot),
                                    40.verticalSpace,
                                    const CustomText(
                                        txt: AppStrings.priceShose),
                                  ],
                                ),
                                100.horizontalSpace,
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                    CustomText(txt: "1"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          color: ColorManager.primary,
                                          // size: 25.w,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                    margin: REdgeInsetsDirectional.only(top: 599),
                    padding: REdgeInsetsDirectional.only(start: 20, end: 20),
                    width: 375.w,
                    height: 117.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.secondaryGrey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(46.r),
                        topLeft: Radius.circular(46.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        15.horizontalSpace,
                        const Expanded(
                            child: CustomGeneralButton(
                          text: AppStrings.requestBtn,
                        )),
                        110.horizontalSpace,
                        const Expanded(
                            child: CustomText(txt: AppStrings.storePrice))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

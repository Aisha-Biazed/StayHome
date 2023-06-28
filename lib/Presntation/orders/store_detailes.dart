import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';

import '../../core/widgets/custom_text.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../home/widget/item_store_details.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'شرقي',
      'غربي',
      'صندويش',
      'سلطات',
      'مشروبات',
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Stack(
        children: [
          Image.asset(
            ImageAssets.hum,
            height: 270.h,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: REdgeInsetsDirectional.only(top: 240),
              child: RSizedBox(
                height: 700.h,
                child: Container(
                  padding:
                      REdgeInsetsDirectional.only(top: 20, start: 27, end: 27),
                  width: double.infinity,
                  height: 509.h,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(46.r),
                        topLeft: Radius.circular(46.r),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Center(
                        child: Container(
                          color: ColorManager.purple,
                          width: 84.w,
                          height: 3.h,
                        ),
                      ),
                      10.verticalSpace,
                      CustomText(
                        txt: AppStrings.storeText1,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: ColorManager.green,
                          ),
                          6.horizontalSpace,
                          CustomText(
                              txt: AppStrings.open,
                              txtColor: ColorManager.secondaryGrey),
                          10.horizontalSpace,
                          Icon(
                            Icons.location_on_outlined,
                            color: ColorManager.secondaryGrey,
                          ),
                          CustomText(
                            txt: AppStrings.aleppo,
                            txtColor: ColorManager.secondaryGrey,
                          ),
                          10.horizontalSpace,
                          Container(
                            color: ColorManager.secondaryGrey,
                            child: const VerticalDivider(
                              color: Colors.black, //color of divider
                              width: 2, //width space of divider
                              thickness: 1, //thickness of divier line
                              indent: 10, //Spacing at the top of divider.
                              endIndent: 12, //Spacing at the bottom of divider.
                            ),
                          ),
                          4.horizontalSpace,
                          Icon(
                            Icons.update_outlined,
                            color: ColorManager.secondaryGrey,
                          ),
                          6.horizontalSpace,
                          CustomText(
                            txt: AppStrings.date,
                            txtColor: ColorManager.secondaryGrey,
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          const ItemStoreDetails(
                            img: ImageAssets.pizza,
                            subTxt: AppStrings.pricePizza,
                            titleTxt: AppStrings.pizza,
                          ),
                          20.horizontalSpace,
                          const ItemStoreDetails(
                            img: ImageAssets.barbecue,
                            subTxt: AppStrings.priceBarbecue,
                            titleTxt: AppStrings.barbecueStore,
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          const ItemStoreDetails(
                            img: ImageAssets.strawberry,
                            subTxt: AppStrings.priceStrawberry,
                            titleTxt: AppStrings.strawberryStore,
                          ),
                          20.horizontalSpace,
                          const ItemStoreDetails(
                            img: ImageAssets.salad,
                            subTxt: AppStrings.priceSalad,
                            titleTxt: AppStrings.saladStore,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: REdgeInsetsDirectional.only(top: 725),
            padding: REdgeInsetsDirectional.only(start: 20, end: 20),
            width: 375.w,
            height: 88.h,
            decoration: BoxDecoration(
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.secondaryGrey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(46.r),
                topLeft: Radius.circular(46.r),
                // bottomLeft: Radius.circular(46.r),
                // bottomRight: Radius.circular(46.r)
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.myBasketRoute);
                  },
                  child: Icon(
                    Icons.local_grocery_store_outlined,
                    size: 35.w,
                    color: ColorManager.dark,
                  ),
                ),
                FloatingActionButton.extended(
                  backgroundColor: ColorManager.secondary,
                  // splashColor: ColorManager.secondary,
                  // hoverColor: ColorManager.secondary,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.orderReview2Route);
                  },
                  label: CustomText(
                    txt: AppStrings.addToTrash,
                    txtColor: ColorManager.white,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

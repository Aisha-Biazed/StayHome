import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/ratings/widgets/custom_buttons.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../resources/routes_manager.dart';

class DeliveryRatingPage extends StatelessWidget {
  const DeliveryRatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: REdgeInsetsDirectional.only(start: 10, end: 10, top: 50),
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) {
              return 20.verticalSpace;
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: REdgeInsetsDirectional.only(
                    start: 6, end: 6, top: 40, bottom: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 1.0, color: ColorManager.primary),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: REdgeInsetsDirectional.only(end: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: ColorManager.purple,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorManager.purple,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                              backgroundColor: ColorManager.purple,
                              child: Image.asset(
                                ImageAssets.box,
                                width: 40,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              txt: AppStrings.order,
                              txtColor: ColorManager.dark,
                            ),
                            CustomText(
                              txt: AppStrings.elements,
                              txtColor: ColorManager.dark,
                            ),
                            CustomText(
                              txt: AppStrings.priceRating,
                              txtColor: ColorManager.dark,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomButtons(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.ratingRoute);
                          },
                          text: AppStrings.ratingBtnDelivery,
                          color: ColorManager.primary,
                          colorText: ColorManager.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: 16, end: 16, top: 16),
                      child: Row(children: <Widget>[
                        Container(
                          height: 10,
                          width: 10,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: ColorManager.purple,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: ColorManager.purple,
                        )),
                        Container(
                          height: 10,
                          width: 10,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: ColorManager.purple,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                          color: ColorManager.primary,
                        )),
                        Container(
                          height: 10,
                          width: 10,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: REdgeInsetsDirectional.only(
                          start: 16, end: 16, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            txt: AppStrings.delivered,
                            txtColor: ColorManager.dark,
                            fontSize: 14,
                          ),
                          CustomText(
                            txt: AppStrings.deliveryIsUnderway,
                            txtColor: ColorManager.dark,
                            fontSize: 14,
                          ),
                          CustomText(
                            txt: AppStrings.inPreparation,
                            txtColor: ColorManager.dark,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
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
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(200.r),
                          bottomLeft: Radius.circular(200.r))),
                  child: Image.asset(
                    ImageAssets.servicesImg,
                  ),
                ),
                Padding(
                  padding: REdgeInsetsDirectional.only(
                      start: 150, end: 25, top: 100),
                  child: CustomText(
                    txt: AppStrings.store2,
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
                    children: const <Widget>[
                      CardItem2(
                        title: AppStrings.serviceText1,
                        img: ImageAssets.serviceImg1,
                        subtitle: '',
                      ),
                      CardItem2(
                        title: AppStrings.serviceText2,
                        img: ImageAssets.serviceImg2,
                        subtitle: '',
                      ),
                      CardItem2(
                        title: AppStrings.serviceText3,
                        img: ImageAssets.serviceImg3,
                        subtitle: '',
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
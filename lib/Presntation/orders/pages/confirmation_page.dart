import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 47, top: 152, end: 51),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.confirmationImg,
              height: 262.24.h,
              width: 277.w,
            ),
            80.verticalSpace,
            CustomText(
              txt: AppStrings.requestReceived1,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            CustomText(
              txt: AppStrings.requestReceived2,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}

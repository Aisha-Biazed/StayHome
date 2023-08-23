import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../Presntation/home/pages/home_body_view.dart';
import '../../Presntation/resources/assets_manager.dart';
import '../../Presntation/resources/routes_manager.dart';

class CustomConfirmationPage extends StatelessWidget {
  const CustomConfirmationPage({
    Key? key,
    required this.titleText,
    required this.subTitleText,
    this.onTap,
  }) : super(key: key);
  final String titleText;
  final String subTitleText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) => const HomeBodyView()),
                (Route<dynamic> route) => false
        );
        Navigator.pushReplacementNamed(context, Routes.homesRoute);
        return true;
      },
      child: Scaffold(
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
                txt: titleText,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
              CustomText(
                txt: subTitleText,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
              ),
              40.verticalSpace,
              if (onTap != null)
                CustomGeneralButton(
                  text: 'تتبع الطلب',
                  onTap: onTap,
                )
            ],
          ),
        ),
      ),
    );
  }
}

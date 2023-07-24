import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';
class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, this.title, this.subTitle, this.image}) : super(key: key);
  final String? title;
  final String? subTitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsetsDirectional.only(start: 20, end: 20 ,top: 55),
      child: Column(
        children: [
          RSizedBox(
            height: 450,
              child: Image.asset(image!,)),
          // const VerticalSpace(5),
          // 30.verticalSpace,
          Text(
              title!,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              color: ColorManager.primary
            ),
          ),
          Text(
            subTitle!,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 20.sp,
              color: Color(0xff78787c)
            ),
          )
        ],
      ),
    );
  }
}

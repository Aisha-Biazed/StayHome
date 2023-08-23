import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';

import '../../../core/widgets/custom_text.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

AppBar CustomAppBar() => AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 60.h,
      backgroundColor: ColorManager.white,
      title: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                allowDrawingOutsideViewBox: true,
                ImageAssets.logo,
                width: 40,
                height: 40,
              ).animate(onComplete: (c)=>c.repeat()).shimmer(delay: Duration(milliseconds: 4000),duration: Duration(milliseconds: 2500)),
              50.horizontalSpace,
              CustomText(
                txt: AppStrings.appbarHome1,
                txtColor: ColorManager.dark,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                txt: AppStrings.appbarHome2,
                txtColor: ColorManager.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
              10.horizontalSpace,
            ],
          ),
          // 20.verticalSpace,
          // Padding(

          //   padding: REdgeInsetsDirectional.only(start: 55,),

          //   child: Container(
          //     width: 293.w,
          //     height:47.h,
          //     decoration: BoxDecoration(
          //         color: ColorManager.purple,
          //         borderRadius: BorderRadius.circular(23)),
          //     child:  TextField(
          //       autocorrect: true,
          //       textAlign: TextAlign.right,
          //       decoration: InputDecoration(
          //           enabledBorder: UnderlineInputBorder(
          //               borderSide: BorderSide(color: ColorManager.white)),
          //           focusedBorder: UnderlineInputBorder(
          //               borderSide: BorderSide(color:  ColorManager.white)),
          //           hintText: AppStrings.search,
          //           suffixIcon: const Icon(Icons.search,size: 30,)),
          //     ),
          //   ),
          // ),
        ],
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
    );

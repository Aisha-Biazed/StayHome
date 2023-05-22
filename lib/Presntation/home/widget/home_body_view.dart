import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.white,
      ),
      actions: [
        Container(
          margin: REdgeInsetsDirectional.only(end: 16, top: 40),
          child: Stack(
            children: <Widget>[
              Icon(
                Icons.notifications_none_rounded,
                color: ColorManager.secondaryGrey,
                size: 32,
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6)),
                    constraints:
                        const BoxConstraints(minWidth: 12, minHeight: 12),
                  )),
            ],
          ),
        )
      ],
      toolbarHeight: 157.h,
      backgroundColor: ColorManager.white,
      title: Column(
        children: [
          Row(
            children: [
              CustomText(
                txt: AppStrings.appbarHome1,
                txtColor: ColorManager.dark,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
              5.horizontalSpace,
              CustomText(
                txt: AppStrings.appbarHome2,
                txtColor: ColorManager.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
        20.verticalSpace,
          Padding(
            padding: REdgeInsetsDirectional.only(start: 55,),
            child: Container(
              width: 293.w,
              height:47.h,
              decoration: BoxDecoration(
                  color: ColorManager.purple,
                  borderRadius: BorderRadius.circular(23)),
              child:  TextField(
                autocorrect: true,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.white)),
                    focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:  ColorManager.white)),
                    hintText: AppStrings.search,
                    suffixIcon: const Icon(Icons.search,size: 30,)),
              ),
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(30))),
    )
//
        );
  }
}

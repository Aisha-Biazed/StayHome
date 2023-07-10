import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_text.dart';
import '../../resources/color_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.text, required this.icon, this.onTap})
      : super(key: key);
  final String text;
  final Icon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 61.h,
        width: 200.w,
        decoration: BoxDecoration(
            color: ColorManager.primary,
            border: Border.all(
              color: ColorManager.primary, //color of border
              width: 2, //width of border
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: REdgeInsetsDirectional.only(start: 0, end: 10),
              child: icon,
            ),
            CustomText(
              txt: text,
              textAlign: TextAlign.center,
              txtColor: ColorManager.white,
            ),
          ],
        ),
      ),
    );
  }
}

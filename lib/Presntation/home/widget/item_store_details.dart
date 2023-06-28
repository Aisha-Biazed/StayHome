import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

class ItemStoreDetails extends StatelessWidget {
  const ItemStoreDetails(
      {Key? key,
      required this.subTxt,
      required this.img,
      required this.titleTxt})
      : super(key: key);
  final String titleTxt;
  final String subTxt;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          img,
          height: 134.h,
          width: 145.w,
        ),
        Padding(
          padding: REdgeInsetsDirectional.only(start: 10),
          child: CustomText(
            txt: titleTxt,
          ),
        ),
        Row(children: [
          CustomText(
            txt: subTxt,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outline_sharp,
                color: ColorManager.primary,
                size: 25.w,
              ))
        ]),
      ],
    );
  }
}

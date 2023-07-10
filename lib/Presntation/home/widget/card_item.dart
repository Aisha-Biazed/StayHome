import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

class CardItem2 extends StatelessWidget {
  const CardItem2({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsetsDirectional.only(bottom: 20, top: 10),
          color: ColorManager.white,
          shadowColor: Colors.grey,
          child: RSizedBox(
            height: 110,
            width: 290,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.5 / 3,
                  child: Container(
                    margin: REdgeInsetsDirectional.only(start: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: AssetImage(img))),
                  ),
                ),
                Padding(
                  padding: REdgeInsetsDirectional.only(start: 14, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: title,
                        txtColor: ColorManager.dark,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

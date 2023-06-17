import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_text.dart';
import '../../resources/color_manager.dart';
class CardItem2 extends StatelessWidget {
  const CardItem2({Key? key, required this.img, required this.title, required this.subtitle, this.icon}) : super(key: key);
final String img;
final String title;
  final String subtitle;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsetsDirectional.only(bottom: 20, top: 10),
      color: ColorManager.white,
      child:  Row(
        children: [
          RSizedBox(
            height: 110,
            width: 290,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.7 / 3,
                  child: Container(
                    padding: REdgeInsetsDirectional.only(start:20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage(img))),
                  ),
                ),
                Padding(
                  padding: REdgeInsetsDirectional.only(start: 14, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(txt: title,
                        txtColor: ColorManager.dark,
                      ),
                      CustomText(txt:subtitle,
                        txtColor: ColorManager.secondaryGrey,

                      ),
                      Row(
                        children: [
                          // Icon(Icons.star , color: ColorManager.secondary,),
                          Icon(icon,color: ColorManager.secondary,),
                          Icon(icon,color: ColorManager.secondary,),
                          Icon(icon,color: ColorManager.secondary,),
                          Icon(icon,color: ColorManager.secondary,),

                          // Icon(Icons.star , color: ColorManager.secondary,),
                          // Icon(Icons.star , color: ColorManager.secondary,),
                          // Icon(Icons.star , color: ColorManager.secondary,),
                          // Icon(Icons.star , color: ColorManager.secondary,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

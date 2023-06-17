import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';

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
             Image.asset(ImageAssets.servicesImg),
           ],
         ),
            SizedBox(
              height:500.h,
              child: Padding(
                  padding:  REdgeInsetsDirectional.only(start: 44 ,end: 25),
                  child: ListView(
                    children: const <Widget>[
                      CardItem2(
                        title: AppStrings.serviceText1,
                        img: ImageAssets.serviceImg1, subtitle: '',
                      ),
                      CardItem2(
                        title: AppStrings.serviceText2,
                        img: ImageAssets.serviceImg2, subtitle: '',
                      ),
                      CardItem2(
                        title: AppStrings.serviceText3,
                        img: ImageAssets.serviceImg3, subtitle: '',
                      ),
                    ],
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}

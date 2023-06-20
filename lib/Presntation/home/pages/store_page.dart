import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(ImageAssets.storeLogo),
              Padding(
                padding:
                    REdgeInsetsDirectional.only(start: 55, top: 40, end: 55),
                child: Container(
                  width: 293.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                      color: ColorManager.purple,
                      borderRadius: BorderRadius.circular(23)),
                  child: TextField(
                    autocorrect: true,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.primary)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.primary)),
                        hintText: AppStrings.search,
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 30,
                        )),
                  ),
                ),
              ),
            ],
          ),
          RSizedBox(
            width: 200,
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: ColorManager.primary,
                  height: 50,
                ),
                Container(
                  color: Colors.red,
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

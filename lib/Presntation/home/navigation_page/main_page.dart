import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../resources/routes_manager.dart';
import '../widget/card_item.dart';
import '../widget/catogary_item.dart';
import '../widget/custom_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CardItem> items = [
    CardItem(urlImage: ImageAssets.homeImg2),
    CardItem(urlImage: ImageAssets.homeImg1),
    CardItem(urlImage: ImageAssets.homeImg3),
  ];
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  // final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsetsDirectional.only(start: 22, top: 10),
                child: CustomText(
                  txt: AppStrings.service,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
              RSizedBox(
                height: 256.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: REdgeInsetsDirectional.all(16),
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) =>
                      const RSizedBox(
                    width: 12,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return buildCard(item: items[index]);
                  },
                ),
              ),
              Padding(
                padding:
                    REdgeInsetsDirectional.only(top: 20, start: 44, end: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryItem(
                        text: AppStrings.store,
                        icon: Icon(
                          Icons.departure_board_outlined,
                          color: ColorManager.secondaryGrey,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.serviceRoute);
                        }),
                    20.verticalSpace,
                    CustomText(
                      txt: AppStrings.homeText,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CategoryItem(
              //         text: AppStrings.store,
              //         icon: Icon(
              //           Icons.storefront,
              //           color: ColorManager.primary,
              //         ),
              //         onTap: () {
              //           Navigator.pushNamed(context, Routes.storeRoute);
              //         }),
              //     20.horizontalSpace,
              //     CategoryItem(
              //         text: AppStrings.service,
              //         icon: Icon(
              //           Icons.border_all_outlined,
              //           color: ColorManager.primary,
              //         ),
              //         onTap: () {
              //           Navigator.pushNamed(context, Routes.serviceRoute);
              //         }),
              //   ],
              // ),
              // 20.verticalSpace,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CategoryItem(
              //         text: AppStrings.driver,
              //         icon: Icon(
              //           Icons.fire_truck_sharp,
              //           color: ColorManager.primary,
              //         )),
              //     20.horizontalSpace,
              //     CategoryItem(
              //         text: AppStrings.orders,
              //         icon: Icon(
              //           Icons.shopping_cart,
              //           color: ColorManager.primary,
              //         )),
              //   ],
              // ),
              RSizedBox(
                height: 300,
                child: Padding(
                    padding: REdgeInsetsDirectional.only(start: 44, end: 25),
                    child: ListView(
                      children: const <Widget>[
                        CardItem2(
                          title: AppStrings.pizza,
                          subtitle: AppStrings.mario,
                          img: ImageAssets.store1,
                        ),
                        CardItem2(
                          title: AppStrings.hodi,
                          subtitle: AppStrings.shadowsTxt,
                          img: ImageAssets.store2,
                        ),
                      ],
                    )),
              ),
              // child: CustomText(txt: AppStrings.homeText,
              // fontWeight: FontWeight.w600,
              //   fontSize: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard({
  required CardItem item,
}) =>
    Container(
      width: 250.w,
      child: Column(
        children: [
          Expanded(
              child: AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );

class CardItem {
  final String urlImage;
  CardItem({required this.urlImage});
}
//Scaffold(
//       body:Padding(
//           padding: REdgeInsetsDirectional.only(start: 21, top: 26),

//     );

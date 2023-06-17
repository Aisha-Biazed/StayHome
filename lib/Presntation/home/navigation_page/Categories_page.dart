import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';

import '../../resources/routes_manager.dart';
import '../widget/card_item.dart';
import '../widget/catogary_item.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CardItem> items = [
    CardItem(
    urlImage:ImageAssets.home_img2
    ),
    CardItem(
        urlImage:ImageAssets.home_img1
    )
  ];
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 256.h,
                child:  ListView.separated(
                  scrollDirection:Axis.horizontal,
                  padding: REdgeInsetsDirectional.all(16),
                  itemCount: 2,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 12,),
                  itemBuilder: (BuildContext context, int index) {
                    return buildCard(item: items[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryItem(text:AppStrings.store1, icon:  Icon(Icons.storefront, color: ColorManager.primary,),
                  ),
                  20.horizontalSpace,
                  CategoryItem(text:AppStrings.store2, icon:  Icon(Icons.border_all_outlined, color: ColorManager.primary,),
                      onTap:(){
                      Navigator.pushNamed(context, Routes.serviceRoute);
                           }
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryItem(text:AppStrings.store3, icon:  Icon(Icons.fire_truck_sharp, color: ColorManager.primary,)),
                  20.horizontalSpace,
                  CategoryItem(text:AppStrings.store4, icon:  Icon(Icons.shopping_cart, color: ColorManager.primary,)),
                ],
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding:  REdgeInsetsDirectional.only(start: 44 ,end: 25),
                    child: ListView(
                      children:  const <Widget>[
                        CardItem2(
                          title: AppStrings.pizza,
                          subtitle: AppStrings.mario,
                          img: ImageAssets.store1,
                          icon: (Icons.star) ,

                        ),
                        CardItem2(
                          icon: (Icons.star) ,
                          title: AppStrings.hodi,
                          subtitle: AppStrings.shadowsTxt,
                          img: ImageAssets.store2,
                        ),
                      ],
                    )
                ),
              ),
                // child: CustomText(txt: AppStrings.homeText,
                // fontWeight: FontWeight.w600,
                //   fontSize: 20,
                // ),

            ],
          ),
        ),
      );
  }
}






 Widget buildCard ({
  required CardItem item,
} )=> Container(
   width:  250.w,
   child: Column(
     children: [
     Expanded(child: AspectRatio(
       aspectRatio: 4/3,
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
class CardItem{
  final String urlImage;
  CardItem({required this.urlImage});
}
//Scaffold(
//       body:Padding(
//           padding: REdgeInsetsDirectional.only(start: 21, top: 26),

//     );
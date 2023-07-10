import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).shopCubit();
    final List<String> items = [
      'الأثاث',
      'المجوهرات',
      'الملابس',
      'الأطعمة',
    ];
    final List<String> images = [
      ImageAssets.storeImg1,
      ImageAssets.storeImg2,
      ImageAssets.storeImg3,
      ImageAssets.storeImg4,
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:
            BlocBuilder<InitialCubit, InitialStates>(builder: (context, state) {
          if (state is ShopSuccessState) {
            return Column(
              children: [
                Stack(
                  children: [
                    Image.asset(ImageAssets.storeLogo),
                  ],
                ),
                20.verticalSpace,
                Padding(
                  padding: REdgeInsetsDirectional.only(end: 10, start: 10),
                  child: RSizedBox(
                    width: 400,
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final item = state.listShop[index];
                        return Container(
                          padding:
                              REdgeInsetsDirectional.only(top: 20, bottom: 10),
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  ColorManager.secondaryGrey.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                images[index],
                                width: 30.25.w,
                                height: 30.25.h,
                              ),
                              Center(
                                  child: Text(
                                item.id!,
                                style: TextStyle(
                                    fontSize: 18, color: ColorManager.dark),
                              )),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.horizontalSpace;
                      },
                      itemCount: 4,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    // controller: ,
                    itemCount: state.listShop.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Center(
                          child: Text(
                            '${items[_selectedItemIndex]} page ${state.listShop[index].shops}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return Container(
              height: 100,
              color: Colors.green,
            );
          }
        }),
      ),
    );
  }
}

// Padding(
//                             padding: REdgeInsetsDirectional.only(
//                                 start: 27, end: 28, top: 20, bottom: 0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const CustomText(
//                                   txt: AppStrings.storeText,
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                                 Container(
//                                   margin: REdgeInsetsDirectional.only(
//                                       top: 0, bottom: 25, end: 0, start: 0),
//                                   width: 322.w,
//                                   height: 240.h,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(
//                                       color:
//                                       ColorManager.secondaryGrey.withOpacity(0.3),
//                                       width: 1,
//                                     ),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       GestureDetector(
//                                         child: Image.asset(
//                                           ImageAssets.storeHum,
//                                           width: 320.w,
//                                           height: 159.h,
//                                           fit: BoxFit.fitWidth,
//                                         ),
//                                         onTap: () {
//                                           Navigator.pushNamed(
//                                               context, Routes.storeDetailsRoute);
//                                         },
//                                       ),
//                                       Padding(
//                                         padding: REdgeInsetsDirectional.only(start: 20),
//                                         child: CustomText(
//                                           txt: AppStrings.storeText1,
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 24.sp,
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           10.horizontalSpace,
//                                           Icon(
//                                             Icons.circle,
//                                             color: ColorManager.green,
//                                           ),
//                                           6.horizontalSpace,
//                                           CustomText(
//                                             txt: AppStrings.open,
//                                             txtColor: ColorManager.secondaryGrey,
//                                           ),
//                                           10.horizontalSpace,
//                                           Icon(
//                                             Icons.location_on_outlined,
//                                             color: ColorManager.secondaryGrey,
//                                           ),
//                                           CustomText(
//                                             txt: AppStrings.aleppo,
//                                             txtColor: ColorManager.secondaryGrey,
//                                           ),
//                                           10.horizontalSpace,
//                                           Container(
//                                             color: ColorManager.secondaryGrey,
//                                             child: const VerticalDivider(
//                                               color: Colors.black, //color of divider
//                                               width: 2, //width space of divider
//                                               thickness: 1, //thickness of divier line
//                                               indent:
//                                               10, //Spacing at the top of divider.
//                                               endIndent:
//                                               12, //Spacing at the bottom of divider.
//                                             ),
//                                           ),
//                                           4.horizontalSpace,
//                                           Icon(
//                                             Icons.update_outlined,
//                                             color: ColorManager.secondaryGrey,
//                                           ),
//                                           6.horizontalSpace,
//                                           CustomText(
//                                             txt: AppStrings.date,
//                                             txtColor: ColorManager.secondaryGrey,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 RSizedBox(
//                                   height: 300,
//                                   width: 320,
//                                   child: Container(
//                                     margin: REdgeInsetsDirectional.only(
//                                         top: 0, bottom: 25, end: 0, start: 0),
//                                     width: 322.w,
//                                     height: 240.h,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       border: Border.all(
//                                         color:
//                                         ColorManager.secondaryGrey.withOpacity(0.3),
//                                         width: 1,
//                                       ),
//                                     ),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Image.asset(
//                                           ImageAssets.storeGirl,
//                                           width: 317.w,
//                                           height: 170.h,
//                                           fit: BoxFit.fitWidth,
//                                         ),
//                                         Padding(
//                                           padding: REdgeInsetsDirectional.only(
//                                               start: 19, top: 0),
//                                           child: CustomText(
//                                             txt: AppStrings.storeText2,
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 24.sp,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             10.horizontalSpace,
//                                             Icon(
//                                               Icons.circle,
//                                               color: ColorManager.green,
//                                             ),
//                                             6.horizontalSpace,
//                                             CustomText(
//                                               txt: AppStrings.open,
//                                               txtColor: ColorManager.secondaryGrey,
//                                             ),
//                                             10.horizontalSpace,
//                                             Icon(
//                                               Icons.location_on_outlined,
//                                               color: ColorManager.secondaryGrey,
//                                             ),
//                                             CustomText(
//                                               txt: AppStrings.aleppo,
//                                               txtColor: ColorManager.secondaryGrey,
//                                             ),
//                                             10.horizontalSpace,
//                                             Container(
//                                               color: ColorManager.secondaryGrey,
//                                               child: const VerticalDivider(
//                                                 color: Colors.black, //color of divider
//                                                 width: 2, //width space of divider
//                                                 thickness: 1, //thickness of divier line
//                                                 indent:
//                                                 10, //Spacing at the top of divider.
//                                                 endIndent:
//                                                 12, //Spacing at the bottom of divider.
//                                               ),
//                                             ),
//                                             4.horizontalSpace,
//                                             Icon(
//                                               Icons.update_outlined,
//                                               color: ColorManager.secondaryGrey,
//                                             ),
//                                             6.horizontalSpace,
//                                             CustomText(
//                                               txt: AppStrings.date,
//                                               txtColor: ColorManager.secondaryGrey,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );

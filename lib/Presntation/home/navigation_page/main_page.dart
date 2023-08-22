import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import '../../../core/network/dio_factory.dart';
import '../../../model/home_model.dart';
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

  // final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).homeCubit();
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
                  fontWeight: FontWeight.w500,
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
                    Padding(
                      padding: REdgeInsetsDirectional.only(start: 60),
                      child: CategoryItem(
                          text: AppStrings.store,
                          icon: Icon(
                            Icons.departure_board_outlined,
                            color: ColorManager.white,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.serviceRoute);
                            // InitialCubit.get(context).getAllCitiesCubit();
                          }),
                    ),
                    20.verticalSpace,
                    CustomText(
                      txt: AppStrings.homeText,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: REdgeInsetsDirectional.only(start: 33, end: 25),
                  child: BlocBuilder<InitialCubit, InitialStates>(
                      builder: (context, state) {
                    if (state is HomeSuccessState) {
                      print(state.result);
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.result.length,
                        itemBuilder: (context, index) {
                          final item = state.result[index];
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 1.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: ColorManager.white,
                            shadowColor: Colors.grey,
                            child: RSizedBox(
                                height: 110,
                                width: 290,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 3 / 2.3,
                                      child: Container(
                                        height: 110.h,
                                        margin: REdgeInsetsDirectional.only(
                                            end: 5,
                                            start: 5,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18.r),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "http://finalstayhome-001-site1.atempurl.com/${item.imageUrl}"))),
                                      ),
                                    ),
                                    Padding(
                                      padding: REdgeInsetsDirectional.only(
                                          top: 20, bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(txt: item.name),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                size: 16,
                                                color: item.isOnline
                                                    ? ColorManager.green
                                                    : Colors.red,
                                              ),
                                              6.horizontalSpace,
                                              CustomText(
                                                txt: item.isOnline
                                                    ? AppStrings.open
                                                    : AppStrings.close,
                                                txtColor:
                                                    ColorManager.secondaryGrey,
                                              ),
                                              10.horizontalSpace,
                                              Icon(
                                                Icons.location_on_outlined,
                                                color:
                                                    ColorManager.secondaryGrey,
                                              ),
                                              CustomText(
                                                txt: item.area,
                                                txtColor:
                                                    ColorManager.secondaryGrey,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const RSizedBox(
                            height: 20,
                          );
                        },
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(ColorManager.primary),
                      ));
                    }
                  }))
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

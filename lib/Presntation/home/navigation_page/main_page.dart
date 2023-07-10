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
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
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
                            // InitialCubit.get(context).profileCubit();
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
              RSizedBox(
                  height: 300,
                  child: Padding(
                      padding: REdgeInsetsDirectional.only(start: 44, end: 25),
                      child: BlocBuilder<InitialCubit, InitialStates>(
                          builder: (context, state) {
                        if (state is HomeSuccessState) {
                          print(state.result);
                          return ListView.separated(
                            itemCount: state.result.length,
                            itemBuilder: (context, index) {
                              final item = state.result[index];
                              return Card(
                                color: ColorManager.white,
                                shadowColor: Colors.grey,
                                child: RSizedBox(
                                    height: 110,
                                    width: 290,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 3 / 2.3,
                                          child: Container(
                                            margin: REdgeInsetsDirectional.only(
                                                end: 10,
                                                start: 20,
                                                top: 0,
                                                bottom: 30),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "http://stayhome22-001-site1.ftempurl.com/${item.imageUrl}"))),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(txt: item.name),
                                            40.verticalSpace,
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  color: item.isOnline
                                                      ? ColorManager.green
                                                      : Colors.red,
                                                ),
                                                6.horizontalSpace,
                                                CustomText(
                                                  txt: item.isOnline
                                                      ? AppStrings.open
                                                      : AppStrings.close,
                                                  txtColor: ColorManager
                                                      .secondaryGrey,
                                                ),
                                                10.horizontalSpace,
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: ColorManager
                                                      .secondaryGrey,
                                                ),
                                                CustomText(
                                                  txt: item.area,
                                                  txtColor: ColorManager
                                                      .secondaryGrey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    )),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const RSizedBox(
                                height: 20,
                              );
                            },
                          );
                        } else if (state is HomeErrorState) {
                          print(state);
                          return Container(
                            color: Colors.teal,
                          );
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                ColorManager.primary),
                          ));
                        }
                      })))

              // ListView(
              //   children: const <Widget>[
              //     CardItem2(
              //       title: AppStrings.pizza,
              //       subtitle: AppStrings.mario,
              //       img: ImageAssets.store1,
              //     ),
              //     CardItem2(
              //       title: AppStrings.hodi,
              //       subtitle: AppStrings.shadowsTxt,
              //       img: ImageAssets.store2,
              //     ),
              //   ],
              // )),
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

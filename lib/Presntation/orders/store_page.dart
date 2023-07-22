import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/orders/store_detailes.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import 'dart:ui' as ui;

import 'package:stay_home/model/shope_model.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

class StorePage extends StatefulWidget {
  // final String shopId;
  const StorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedItemIndex = 0;
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).shopCubit();
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        body:
            BlocBuilder<InitialCubit, InitialStates>(builder: (context, state) {
          if (state is ShopSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 500,
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final item = state.listShop[index];
                        return GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            padding: REdgeInsetsDirectional.only(
                                top: 20, bottom: 10),
                            width: 120.w,
                            height: 100.h,
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
                                Expanded(
                                  child: Image.network(
                                    fit: BoxFit.contain,
                                    "http://finalstayhome-001-site1.atempurl.com/${item.imageUrl}",
                                    // width: 100.w,
                                    // height: 50.h,
                                  ),
                                ),
                                Center(
                                    child: Text(
                                  item.name!,
                                  style: TextStyle(
                                      fontSize: 16, color: ColorManager.dark),
                                )),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.horizontalSpace;
                      },
                      itemCount: state.listShop.length,
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsetsDirectional.only(end: 27, start: 27),
                  child: const CustomText(
                    txt: AppStrings.storeText,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.listShop.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = state.listShop[index].shops;
                        if (items.isEmpty) {
                          return Padding(
                            padding: REdgeInsetsDirectional.only(
                                bottom: 100, top: 40, end: 35, start: 35),
                            child: Card(
                              color: ColorManager.purple,
                              child: const Center(
                                child: CustomText(
                                  txt: AppStrings.cardEmpty,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: state.listShop[index].shops.length,
                            itemBuilder: (BuildContext v, int shop) {
                              final items = state.listShop[index].shops[shop];
                              return Padding(
                                padding: REdgeInsetsDirectional.only(
                                    start: 27, end: 28, top: 20, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: REdgeInsetsDirectional.only(
                                          top: 20,
                                          bottom: 25,
                                          end: 0,
                                          start: 0),
                                      width: 400.w,
                                      height: 280.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: ColorManager.secondaryGrey
                                              .withOpacity(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            child: RSizedBox(
                                              height: 180.h,
                                              width: double.infinity,
                                              child: Image.network(
                                                fit: BoxFit.fitHeight,
                                                "http://finalstayhome-001-site1.atempurl.com/${items.imageUrl}",
                                                width: double.infinity,
                                                // height: 159.h,
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          StoreDetails(
                                                              shopId:
                                                                  items.id!)));
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                REdgeInsetsDirectional.only(
                                                    start: 20),
                                            child: CustomText(
                                              txt: items.name!,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24.sp,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  10.horizontalSpace,
                                                  Icon(
                                                    Icons.circle,
                                                    color: items.isOnline!
                                                        ? ColorManager.green
                                                        : Colors.red,
                                                  ),
                                                  3.horizontalSpace,
                                                  CustomText(
                                                    txt: items.isOnline!
                                                        ? AppStrings.open
                                                        : AppStrings.close,
                                                    txtColor: ColorManager
                                                        .secondaryGrey,
                                                  ),
                                                  3.horizontalSpace,
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: ColorManager
                                                        .secondaryGrey,
                                                  ),
                                                  CustomText(
                                                    txt: items.address!,
                                                    txtColor: ColorManager
                                                        .secondaryGrey,
                                                  ),
                                                  10.horizontalSpace,
                                                  Container(
                                                    color: ColorManager
                                                        .secondaryGrey,
                                                    child:
                                                        const VerticalDivider(
                                                      color: Colors
                                                          .black, //color of divider
                                                      width:
                                                          2, //width space of divider
                                                      thickness:
                                                          1, //thickness of divier line
                                                      indent:
                                                          10, //Spacing at the top of divider.
                                                      endIndent:
                                                          12, //Spacing at the bottom of divider.
                                                    ),
                                                  ),
                                                  4.horizontalSpace,
                                                  Icon(
                                                    Icons.update_outlined,
                                                    color: ColorManager
                                                        .secondaryGrey,
                                                  ),
                                                  CustomText(
                                                    txt: items.startTime
                                                                ?.isNotEmpty ==
                                                            true
                                                        ? DateFormat(
                                                                'dd/MM/yyyy HH:mm')
                                                            .format(DateTime
                                                                .parse(items
                                                                    .startTime))
                                                        : '',
                                                    txtColor: ColorManager
                                                        .secondaryGrey,
                                                  ),
                                                  CustomText(
                                                    txt: items.endTime
                                                                ?.isNotEmpty ==
                                                            true
                                                        ? DateFormat(
                                                                'dd/MM/yyyy HH:mm')
                                                            .format(DateTime
                                                                .parse(items
                                                                    .endTime))
                                                        : '',
                                                    txtColor: ColorManager
                                                        .secondaryGrey,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      }),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            );
          }
        }),
      ),
    );
  }
}

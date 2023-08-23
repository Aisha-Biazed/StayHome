import 'dart:async';
import 'dart:core';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import '../../../core/network/dio_factory.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../model/home_model.dart';
import '../../orders/pages/DeliveryOrder/cubit/delivery_cubit.dart';
import '../../orders/pages/DeliveryOrder/pages/order_review_delivery_page_1.dart';
import '../../orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import '../../orders/pages/passenger/cubit/passenger_cubit.dart';
import '../../orders/store/pages/store_detailes.dart';
import '../../orders/store/pages/store_page.dart';
import '../../resources/routes_manager.dart';
import '../widget/catogary_item.dart';
import '../widget/custom_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              Slider(),
              Padding(
                padding: REdgeInsetsDirectional.only(top: 20, start: 16, end: 16),
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
                    ).animate().flipV(),
                    20.verticalSpace,
                    CustomText(
                      txt: AppStrings.homeText,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ).animate().slideX(begin: 0.5, end: 0),
                    12.verticalSpace,
                  ],
                ),
              ),
              Padding(
                  padding: REdgeInsetsDirectional.only(start: 16, end: 16),
                  child: BlocBuilder<InitialCubit, InitialStates>(builder: (context, state) {
                    if (state is HomeSuccessState) {
                      print(state.result);
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.result.length,
                        itemBuilder: (context, index) {
                          final item = state.result[index];
                          return GestureDetector(
                            onTap: () {
                              if (item.isOnline) {
                                DeliveryCubit.get(context).setShopId(value: item.id, name: item.name);
                                print(item.name);
                                print(item.id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoreDetails(
                                      shopId: item.id,
                                      dest: true,
                                      fromHome: true,
                                    ),
                                  ),
                                );
                              } else {
                                BotToast.showText(text: 'هذا المتجر مغلق حالياً');
                              }
                            },
                            child: Card(
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
                                          margin: REdgeInsetsDirectional.only(end: 5, start: 5, top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(18.r),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage("http://finalstayhome-001-site1.atempurl.com/${item.imageUrl}"))),
                                        ),
                                      ),
                                      Padding(
                                        padding: REdgeInsetsDirectional.only(top: 20, bottom: 10, start: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(txt: item.name),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                  size: 16,
                                                  color: item.isOnline ? ColorManager.green : Colors.red,
                                                ),
                                                6.horizontalSpace,
                                                CustomText(
                                                  txt: item.isOnline ? AppStrings.open : AppStrings.close,
                                                  txtColor: ColorManager.secondaryGrey,
                                                ),
                                                10.horizontalSpace,
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: ColorManager.secondaryGrey,
                                                ),
                                                CustomText(
                                                  txt: item.area,
                                                  txtColor: ColorManager.secondaryGrey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                            ).animate().fadeIn(),
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
                        valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
                      ));
                    }
                  })),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem {
  final String urlImage;

  CardItem({required this.urlImage});
}

class Slider extends StatefulWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  List<CardItem> items = [
    CardItem(urlImage: ImageAssets.homeImg2),
    CardItem(urlImage: ImageAssets.homeImg1),
    CardItem(urlImage: ImageAssets.homeImg3),
  ];

  late final Timer timer;

  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.82);
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage == items.length) {
        currentPage = 0;
        controller.animateToPage(0, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
      } else {
        controller.animateToPage(currentPage++, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 220.h,
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(item: items[index], index: index);
        },
        onPageChanged: (index) {
          setState(() {});
        },
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
    required int index,
  }) =>
      GestureDetector(
        onTap: () {
          if (index == 0) {
            DeliveryCubit.get(context).reset();
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: REdgeInsetsDirectional.only(top: 20, end: 30, start: 30),
                  height: 200.0,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          color: ColorManager.primary,
                          width: 84.w,
                          height: 3.h,
                        ),
                      ),
                      20.verticalSpace,
                      CustomGeneralButton(
                        text: AppStrings.point,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderReviewDeliveryPage1(),
                            ),
                          );
                        },
                      ),
                      20.verticalSpace,
                      CustomGeneralButton(
                        text: AppStrings.dept,
                        onTap: () {
                          Navigator.pop(context);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StorePage(
                                        dest: true,
                                      )));
                        },
                      )
                    ],
                  ),
                );
              },
            );
          } else if (index == 1) {
            Navigator.pop(context);
            PassengerCubit.get(context).reset();
            Navigator.pushNamed(context, Routes.orderReview1PassengerRoute);
          } else {
            ShippingCubit.get(context).reset();
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: REdgeInsetsDirectional.only(top: 20, end: 30, start: 30),
                  height: 200.0,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          color: ColorManager.primary,
                          width: 84.w,
                          height: 3.h,
                        ),
                      ),
                      20.verticalSpace,
                      CustomGeneralButton(
                        text: AppStrings.point,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, Routes.reviewShippingRoute_1);
                        },
                      ),
                      20.verticalSpace,
                      CustomGeneralButton(
                        text: AppStrings.dept,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StorePage(
                                        dest: false,
                                      )));
                        },
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
        child: Container(
          width: 250,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            item.urlImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black45, Colors.transparent, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              index == 0
                                  ? AppStrings.serviceText1
                                  : index == 1
                                      ? AppStrings.serviceText2
                                      : AppStrings.serviceText3,
                              style: TextStyle(color: ColorManager.white, fontSize: 20),
                            ),
                            16.verticalSpace
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

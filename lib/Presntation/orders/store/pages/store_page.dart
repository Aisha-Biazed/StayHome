import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import 'package:stay_home/Presntation/orders/store/pages/store_detailes.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';
import 'dart:ui' as ui;

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../pages/DeliveryOrder/cubit/delivery_cubit.dart';

class StorePage extends StatefulWidget {
  // true => go to delivery
  // false => go to shipping
  // null => go to nav page
  final bool? dest;
  final bool fromHome;
  const StorePage({
    Key? key,
    this.dest,
    this.fromHome = false,
  }) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    InitialCubit.get(context).shopCubit();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<InitialCubit, InitialStates>(builder: (context, state) {
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
                            padding: REdgeInsetsDirectional.only(top: 0, bottom: 5),
                            width: 120.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: ColorManager.secondaryGrey.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                                    child: Image.network(
                                      fit: BoxFit.cover,
                                      "http://finalstayhome-001-site1.atempurl.com/${item.imageUrl}",
                                      height: 50.h,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                5.verticalSpace,
                                Center(
                                    child: Text(
                                  item.name!,
                                  style: TextStyle(fontSize: 16, color: ColorManager.dark),
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
                  padding: REdgeInsetsDirectional.only(end: 27, start: 27, top: 20),
                  child: const CustomText(
                    txt: AppStrings.storeText,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
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
                            padding: REdgeInsetsDirectional.only(bottom: 100, top: 40, end: 35, start: 35),
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
                                padding: REdgeInsetsDirectional.only(start: 27, end: 28, top: 0, bottom: 0),
                                child: Container(
                                  margin: REdgeInsetsDirectional.only(top: 0, bottom: 25, end: 0, start: 0),
                                  width: 400.w,
                                  // height: 290.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ColorManager.secondaryGrey.withOpacity(0.3),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                                          child: RSizedBox(
                                            height: 190.h,
                                            width: double.infinity,
                                            child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              "http://finalstayhome-001-site1.atempurl.com/${items.imageUrl}",
                                              // height: 159.h,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          if (items.isOnline!) {
                                            if (widget.dest!) {
                                              DeliveryCubit.get(context).setShopId(value: items.id!, name: items.name!);
                                            } else {
                                              ShippingCubit.get(context).setShopId(value: items.id!, name: items.name!);
                                            }
                                            print(items.name);
                                            print(items.id);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => StoreDetails(
                                                      shopId: items.id!,
                                                      dest: widget.dest,
                                                       fromHome: widget.fromHome,
                                                    )));
                                          } else{
                                            BotToast.showText(text: 'هذا المتجر مغلق حالياً');
                                          }

                                        },
                                      ),
                                      const SizedBox(height: 4,),
                                      Padding(
                                        padding: REdgeInsetsDirectional.only(start: 20),
                                        child: CustomText(
                                          txt: items.name!,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  10.horizontalSpace,
                                                  Icon(
                                                    Icons.circle,
                                                    size: 16,
                                                    color: items.isOnline! ? ColorManager.green : Colors.red,
                                                  ),
                                                  3.horizontalSpace,
                                                  CustomText(
                                                    txt: items.isOnline! ? AppStrings.open : AppStrings.close,
                                                    txtColor: ColorManager.secondaryGrey,
                                                  ),
                                                  3.horizontalSpace,
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: ColorManager.secondaryGrey,
                                                  ),
                                                  CustomText(
                                                    txt: items.address!,
                                                    txtColor: ColorManager.secondaryGrey,
                                                  ),
                                                  10.horizontalSpace,
                                                  Container(
                                                    color: ColorManager.secondaryGrey,
                                                    child: const VerticalDivider(
                                                      color: Colors.black,
                                                      width: 2,
                                                      thickness: 1,
                                                      indent: 10,
                                                      endIndent: 12,
                                                    ),
                                                  ),
                                                  4.horizontalSpace,
                                                ],
                                              ),
                                            ),
                                            if(items.isOnline!)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.update_outlined,
                                                    color: ColorManager.secondaryGrey,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  CustomText(
                                                    txt: items.startTime?.isNotEmpty == true ? items.startTime!.toString().split(':').take(2).join(':') : '',
                                                    txtColor: ColorManager.secondaryGrey,
                                                  ),
                                                  CustomText(
                                                    txt: ' -> ',
                                                    txtColor: ColorManager.secondaryGrey,
                                                  ),
                                                  CustomText(
                                                    txt: items.endTime?.isNotEmpty == true ? items.endTime!.toString().split(':').take(2).join(':') : '',
                                                    txtColor: ColorManager.secondaryGrey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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

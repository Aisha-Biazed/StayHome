import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../Cubit/my_cart_cubit.dart';

class StoreDetails extends StatefulWidget {
  final String shopId;

  const StoreDetails({
    Key? key,
    required this.shopId,
  }) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  void initState() {
    super.initState();
    final mycubit = context.read<InitialCubit>();
    mycubit.detailsShopCubit(widget.shopId);
  }

  @override
  Widget build(BuildContext context) {
    InitialCubit.get(context).detailsShopCubit(widget.shopId);
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(body: BlocBuilder<InitialCubit, InitialStates>(
        builder: (context, state) {
          if (state is DetailsShopSuccessState) {
            final details = state.listIdShop;
            return Stack(
              children: [
                Image.network(
                  "http://finalstayhome-001-site1.atempurl.com/${details.imageUrl}",
                  // height: 250.h,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: REdgeInsetsDirectional.only(top: 240),
                    child: RSizedBox(
                      // height: 700.h,
                      width: double.infinity,
                      child: Container(
                        padding: REdgeInsetsDirectional.only(
                            top: 20, start: 20, end: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(46.r),
                              topLeft: Radius.circular(46.r),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Center(
                              child: Container(
                                color: ColorManager.purple,
                                width: 84.w,
                                height: 3.h,
                              ),
                            ),
                            CustomText(
                              txt: details.name!,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: details.isOnline!
                                      ? ColorManager.green
                                      : Colors.red,
                                ),
                                3.horizontalSpace,
                                CustomText(
                                    txt: details.isOnline!
                                        ? AppStrings.open
                                        : AppStrings.close,
                                    txtColor: ColorManager.secondaryGrey),
                                3.horizontalSpace,
                                Icon(
                                  Icons.location_on_outlined,
                                  color: ColorManager.secondaryGrey,
                                ),
                                CustomText(
                                  txt: details.address!,
                                  txtColor: ColorManager.secondaryGrey,
                                ),
                                10.horizontalSpace,
                                Container(
                                  color: ColorManager.secondaryGrey,
                                  child: const VerticalDivider(
                                    color: Colors.black,
                                    //color of divider
                                    width: 2,
                                    //width space of divider
                                    thickness: 1,
                                    //thickness of divier line
                                    indent: 10,
                                    //Spacing at the top of divider.
                                    endIndent:
                                        12, //Spacing at the bottom of divider.
                                  ),
                                ),
                                4.horizontalSpace,
                                Icon(
                                  Icons.update_outlined,
                                  color: ColorManager.secondaryGrey,
                                ),
                                6.horizontalSpace,
                                CustomText(
                                  txt: details.startTime?.isNotEmpty == true
                                      ? DateFormat('dd/MM/yyyy HH:mm').format(
                                          DateTime.parse(details.startTime))
                                      : ' ',
                                  txtColor: ColorManager.secondaryGrey,
                                ),
                                CustomText(
                                  txt: details.endTime?.isNotEmpty == true
                                      ? DateFormat('dd/MM/yyyy HH:mm').format(
                                          DateTime.parse(details.endTime))
                                      : ' ',
                                  txtColor: ColorManager.secondaryGrey,
                                ),
                              ],
                            ),
                            20.verticalSpace,
                            SingleChildScrollView(
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                clipBehavior: Clip.none,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 20.h,
                                  mainAxisSpacing: 1.h,
                                ),
                                physics: const ClampingScrollPhysics(),
                                itemCount: state.listIdShop.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      RSizedBox(
                                        height: 150,
                                        child: Image.network(
                                          fit: BoxFit.contain,
                                          "http://finalstayhome-001-site1.atempurl.com/${details.products[index].imageUrl}",
                                          // width: 100.w,
                                          // height: 50.h,
                                          height: 134.h,
                                          width: 145.w,
                                        ),
                                      ),
                                      Container(
                                        padding: REdgeInsetsDirectional.only(
                                            start: 3, bottom: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              txt:
                                                  details.products[index].name!,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    txt: details
                                                        .products[index].cost!
                                                        .toString(),
                                                  ),
                                                  40.horizontalSpace,
                                                  BlocProvider(
                                                    create: (context) =>
                                                        MyCartCubit(),
                                                    child: BlocBuilder<
                                                        MyCartCubit,
                                                        MyCartState>(
                                                      builder:
                                                          (context, state) {
                                                        return IconButton(
                                                            onPressed: () {
                                                              final cartCubit =
                                                                  BlocProvider.of<
                                                                          MyCartCubit>(
                                                                      context);
                                                              final cart =
                                                                  cartCubit
                                                                      .getCart();
                                                              final product =
                                                                  ProductCart(
                                                                id: details
                                                                    .products[
                                                                        index]
                                                                    .id!,
                                                                name: details
                                                                    .products[
                                                                        index]
                                                                    .name!,
                                                                imageUrl:
                                                                    "http://finalstayhome-001-site1.atempurl.com/${details.products[index].imageUrl}",
                                                                cost: details
                                                                    .products[
                                                                        index]
                                                                    .cost!,
                                                                counter: 1,
                                                              );
                                                              cartCubit
                                                                  .addToCart(
                                                                      cart,
                                                                      product);
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .add_circle_outline_sharp,
                                                              color:
                                                                  ColorManager
                                                                      .primary,
                                                              size: 25.w,
                                                            ));
                                                      },
                                                    ),
                                                  )
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            const RSizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: REdgeInsetsDirectional.only(top: 725),
                  padding: REdgeInsetsDirectional.only(start: 20, end: 20),
                  width: 375.w,
                  height: 88.h,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.secondaryGrey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(46.r),
                      topLeft: Radius.circular(46.r),
                      // bottomLeft: Radius.circular(46.r),
                      // bottomRight: Radius.circular(46.r)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.myBasketRoute);
                        },
                        child: Icon(
                          Icons.local_grocery_store_outlined,
                          size: 35.w,
                          color: ColorManager.dark,
                        ),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: ColorManager.secondary,
                        // splashColor: ColorManager.secondary,
                        // hoverColor: ColorManager.secondary,
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.myBasketRoute);
                        },
                        label: CustomText(
                          txt: AppStrings.addToTrash,
                          txtColor: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
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
        },
      )),
    );
  }
}

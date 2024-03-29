import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/orders/store/pages/store_page.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../Cubit/my_cart_cubit.dart';
import 'my_cart_page.dart';

class StoreDetails extends StatefulWidget {
  final String shopId;
  final bool? dest;
  final bool fromHome;

  const StoreDetails({
    Key? key,
    required this.shopId,
    this.dest,
    this.fromHome = false,
  }) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  void initState() {
    InitialCubit.get(context).detailsShopCubit(widget.shopId);
    MyCartCubit.get(context).clearCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => Directionality(
            textDirection: ui.TextDirection.rtl,
            child: AlertDialog(
              title: Text('حذف السلة'),
              content: Text('بالمتابعة فإنه سيتم حذف كافة منتجات السلة'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);

                    },
                    child: Text('إلغاء')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('حذف')),
              ],
            ),
          ),
        );
        if (context.mounted) {
          if (result!) {
            if (widget.fromHome) {
              InitialCubit.get(context).shopCubit();
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => StorePage(
                    dest: widget.dest,
                  ),
                ),
              );
            }
          }
        }
        return result!;
      },
      child: Directionality(
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
                          padding: REdgeInsetsDirectional.only(top: 20, start: 20, end: 20),
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
                              Center(
                                child: Container(
                                  color: ColorManager.purple,
                                  width: 84.w,
                                  height: 3.h,
                                ),
                              ),
                              10.verticalSpace,
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
                                    color: details.isOnline! ? ColorManager.green : Colors.red,
                                  ),
                                  3.horizontalSpace,
                                  CustomText(txt: details.isOnline! ? AppStrings.open : AppStrings.close, txtColor: ColorManager.secondaryGrey),
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
                                      width: 2,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 12,
                                    ),
                                  ),
                                  4.horizontalSpace,
                                ],
                              ),
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
                                      txt: details.startTime?.isNotEmpty == true ? details.startTime!.toString().split(':').take(2).join(':') : '',
                                      txtColor: ColorManager.secondaryGrey,
                                    ),
                                    CustomText(
                                      txt: ' -> ',
                                      txtColor: ColorManager.secondaryGrey,
                                    ),
                                    CustomText(
                                      txt: details.endTime?.isNotEmpty == true ? details.endTime!.toString().split(':').take(2).join(':') : '',
                                      txtColor: ColorManager.secondaryGrey,
                                    ),
                                  ],
                                ),
                              ),
                              20.verticalSpace,
                              SingleChildScrollView(
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  clipBehavior: Clip.none,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                                          child: RSizedBox(
                                            height: 150,
                                            child: Image.network(
                                              fit: BoxFit.cover,
                                              "http://finalstayhome-001-site1.atempurl.com/${details.products[index].imageUrl}",
                                              height: 134.h,
                                              width: 145.w,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: REdgeInsetsDirectional.only(start: 10, end: 10, bottom: 0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                txt: details.products[index].name!,
                                              ),
                                              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                CustomText(
                                                  txt: details.products[index].cost!.toString(),
                                                ),
                                                const Spacer(),
                                                BlocBuilder<MyCartCubit, MyCartState>(
                                                  builder: (context, state) {
                                                    return IconButton(
                                                        onPressed: () {
                                                          final cartCubit = BlocProvider.of<MyCartCubit>(context);
                                                          final cart = cartCubit.getCart();
                                                          print(cart);
                                                          final product = ProductCart(
                                                            id: details.products[index].id!,
                                                            name: details.products[index].name!,
                                                            imageUrl:
                                                                "http://finalstayhome-001-site1.atempurl.com/${details.products[index].imageUrl}",
                                                            cost: details.products[index].cost!,
                                                            counter: 1,
                                                          );
                                                          cartCubit.addToCart(cart, product);
                                                          print("${product.cost} ");
                                                          if (RegExp(r'^[a-z]').hasMatch(details.products[index].name!)) {
                                                            BotToast.showText(text: ' للسلة ${details.products[index].name} تمت إضافة ');
                                                          } else {
                                                            BotToast.showText(text: ' تمت إضافة ${details.products[index].name} للسلة ');
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.add_circle_outline_sharp,
                                                          color: ColorManager.primary,
                                                          size: 25.w,
                                                        ));
                                                  },
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
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(46.r),
                        topLeft: Radius.circular(46.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            // onTap: () {
                            //   Navigator.pushNamed(context, Routes.myCartRoute);
                            // },
                            child: Image.asset(
                          ImageAssets.cart,
                          width: 70,
                        )),
                        FloatingActionButton.extended(
                          backgroundColor: ColorManager.secondary1,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MyCartPage(
                                          dest: widget.dest,
                                          isReview: false,
                                        )));
                          },
                          label: CustomText(
                            txt: AppStrings.cartBtn,
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
      ),
    );
  }
}

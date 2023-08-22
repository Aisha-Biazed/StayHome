import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/cubit/shipping_cubit.dart';
import 'package:stay_home/Presntation/orders/store/Cubit/my_cart_cubit.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../../../core/widgets/custom_buttons.dart';
import '../../../resources/routes_manager.dart';
import '../../pages/DeliveryOrder/cubit/delivery_cubit.dart';
import '../../pages/DeliveryOrder/pages/order_review_delivery_shop_page_1.dart';
import '../../pages/ShippingDelivery/pages/order_review_shipping_shop_page_1.dart';

class MyCartPage extends StatefulWidget {
  final bool? dest;
  final bool isReview;

  const MyCartPage({
    Key? key,
    this.dest,
    required this.isReview,
  }) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int total = 0;
  String idProduct = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Column(
              children: [
                20.verticalSpace,
                Center(
                    child: CustomText(
                  txt: AppStrings.myBasketTitle,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                )),
                BlocBuilder<MyCartCubit, MyCartState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Container(
                          padding: REdgeInsetsDirectional.only(top: 40, start: 20, end: 27),
                          width: double.infinity,
                          height: 660,
                          decoration: BoxDecoration(
                              color: ColorManager.purple,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(46.r),
                                topLeft: Radius.circular(46.r),
                              )),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.productsCart.length,
                            itemBuilder: (BuildContext context, int index) {
                              final cartCubit = BlocProvider.of<MyCartCubit>(context);
                              final cart = state.productsCart[index];
                              return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: ColorManager.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: REdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          cart.imageUrl!,
                                          width: 80.w,
                                          height: 75.h,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: REdgeInsetsDirectional.only(
                                        top: 20,
                                        bottom: 5,
                                      ),
                                      child: Column(
                                        children: [
                                          CustomText(txt: cart.name!),
                                          30.verticalSpace,
                                          CustomText(txt: cart.cost.toString()),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: REdgeInsetsDirectional.only(start: 5, end: 5),
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                final cart = cartCubit.getCart();
                                                final product = ProductCart(
                                                  id: cart[index].id!,
                                                  name: cart[index].name!,
                                                  imageUrl: "http://finalstayhome-001-site1.atempurl.com/${cart[index].imageUrl}",
                                                  cost: cart[index].cost!,
                                                  counter: cart[index].counter,
                                                );
                                                cartCubit.addToCart(cart, product);
                                                idProduct = product.id!;
                                                total = 0;
                                                for (var element in cart) {
                                                  var mul = element.counter! * element.cost!;
                                                  total += mul;
                                                  print(mul);
                                                }
                                                print(total);
                                              },
                                              icon: Icon(
                                                Icons.add_circle,
                                                color: ColorManager.primary,
                                              )),
                                          CustomText(txt: cart.counter.toString()),
                                          IconButton(
                                              onPressed: () {
                                                final cart = cartCubit.getCart();
                                                final product = ProductCart(
                                                  id: cart[index].id!,
                                                  name: cart[index].name!,
                                                  imageUrl: "http://finalstayhome-001-site1.atempurl.com/${cart[index].imageUrl}",
                                                  cost: cart[index].cost!,
                                                  counter: cart[index].counter,
                                                );
                                                idProduct = product.id!;
                                                cartCubit.decreaseFromCart(cart, product);
                                                total = 0;
                                                for (var element in cart) {
                                                  var mul = element.counter! * element.cost!;
                                                  total += mul;
                                                  print(mul);
                                                }
                                                print(total);
                                              },
                                              icon: Icon(
                                                Icons.remove_circle_outlined,
                                                color: ColorManager.primary,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        if(!widget.isReview)
                        Container(
                          margin: REdgeInsetsDirectional.only(top: 599),
                          padding: REdgeInsetsDirectional.only(start: 20, end: 20),
                          width: 375.w,
                          height: 117.h,
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
                              15.horizontalSpace,
                              IconButton(
                                icon: const Icon(Icons.delete_outline_outlined),
                                iconSize: 40,
                                color: ColorManager.primary,
                                onPressed: () {
                                  final cartCubit = BlocProvider.of<MyCartCubit>(context);
                                  cartCubit.clearCart(state.productsCart);
                                },
                              ),
                              15.horizontalSpace,
                              Expanded(child: CustomText(txt: total.toString())),
                              Expanded(
                                  child: CustomGeneralButton(
                                onTap: () {
                                  // ShippingCubit.get(context).getTotalPrice(value: total);
                                  // print(ShippingCubit.get(context).totalCubit);
                                  final cartCubit = BlocProvider.of<MyCartCubit>(context);
                                  if (widget.dest!) {
                                    final deliveryCubit = DeliveryCubit.get(context);
                                    deliveryCubit.setTotalPrice(
                                      value: total,
                                    );
                                    print(DeliveryCubit.get(context).totalCubit);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderReviewDeliveryShopPage1()));
                                  } else{
                                    final shippingCubit = ShippingCubit.get(context);
                                    shippingCubit.setTotalPrice(
                                      value: total,
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderReviewShippingShopPage1()));
                                  }

                                },
                                text: AppStrings.requestBtn,
                              )),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/pages/home_view.dart';
import 'package:stay_home/Presntation/home/pages/service_page.dart';
import 'package:stay_home/Presntation/orders/pages/ShippingDelivery/pages/add_address_source_shipping_page.dart';
import 'package:stay_home/Presntation/orders/pages/passenger/pages/order_review_passenger_page_1.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import '../login/pages/login_view.dart';
import '../onboarding/presentaion/pages/on_boarding_view.dart';
import '../orders/pages/DeliveryOrder/add_address_destinationpage.dart';
import '../orders/pages/DeliveryOrder/add_address_source_page.dart';
import '../orders/pages/DeliveryOrder/confirmation_page.dart';
import '../orders/pages/ShippingDelivery/pages/order_review_for_shop_page_1.dart';
import '../orders/pages/ShippingDelivery/pages/order_review_for_shop_page_2.dart';
import '../orders/pages/ShippingDelivery/pages/add_address_destination_shipping_page.dart';
import '../orders/pages/ShippingDelivery/pages/order_review_shipping_page_1.dart';
import '../orders/pages/ShippingDelivery/pages/order_review_shipping_page_2.dart';
import '../orders/pages/passenger/pages/add_address_destinationpage_passenger_page.dart';
import '../orders/pages/passenger/pages/add_address_source_passenger_page.dart';
import '../orders/pages/passenger/pages/confirmation_for_passenger_page.dart';
import '../orders/pages/passenger/pages/order_review_passenger_page_2.dart';
import '../orders/store/pages/my_cart_page.dart';
import '../login/pages/registartion_page.dart';
import '../login/pages/profile_page.dart';
import '../ratings/pages/rating_page.dart';
import '../splash/pages/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String verificationRoute = "/verification";
  static const String profilesRoute = "/profile";
  static const String addressDestinationRoute = "/destination";
  static const String addressDestinationPassengerRoute = "/destination_pass";
  static const String reviewShippingRoute_1 = "/shipping_1";
  static const String reviewShippingRoute_2 = "/shipping_2";
  static const String shippingAddressDestinationRoute = "/destination_shipping";
  static const String shippingAddressSourceRoute = "/source_shipping";
  static const String addressSourceRoute = "/source";
  static const String addressSourcePassengerRoute = "/source_pass";
  static const String orderReview1PassengerRoute = "/order_review_1";
  static const String orderReviewPassengerRoute2 = "/order_review_2";

  static const String homesRoute = "/home";
  static const String serviceRoute = "/service";
  static const String storeRoute = "/store";
  static const String storeDetailsRoute = "/store_details";
  static const String orderReview1Route = "/goods1";
  static const String orderReviewRoute2 = "/goods2";
  static const String orderReviewRoute3 = "/goods3";
  static const String confirmationRoute = "/confirmation";
  static const String confirmationPassengerRoute = "/confirmation_passenger";
  static const String myCartRoute = "/basket";
  static const String showPicker = "/showpicker";
  static const String ratingRoute = "/rating";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterationPage());
      case Routes.profilesRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.addressDestinationRoute:
        return MaterialPageRoute(
            builder: (_) => const AddAddressDestinationPage());
      case Routes.addressDestinationPassengerRoute:
        return MaterialPageRoute(
            builder: (_) => const AddAddressDestinationPassengerPage());
      case Routes.addressSourceRoute:
        return MaterialPageRoute(builder: (_) => const AddAddressSourcePage());
      case Routes.addressSourcePassengerRoute:
        return MaterialPageRoute(
            builder: (_) => const AddAddressSourcePassengerPage());
      case Routes.homesRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.serviceRoute:
        return MaterialPageRoute(builder: (_) => const ServicePage());
      // case Routes.storeRoute:
      //   final shopId = settings.arguments as ShopModel;
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => InitialCubit(),
      //             child: const StorePage(),
      //           ));

      // case Routes.storeDetailsRoute:
      //   return MaterialPageRoute(
      //       builder: (_) =>  const StoreDetails());
      // case Routes.orderReview1Route:
      //   return MaterialPageRoute(builder: (_) => const OrderReviewPage1());

      //Shipping Pages
      case Routes.reviewShippingRoute_1:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewShippingPage1());
      case Routes.reviewShippingRoute_2:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewShippingPage2());
      case Routes.shippingAddressSourceRoute:
        return MaterialPageRoute(
            builder: (_) => const AddAddressSourceShippingPage());
      case Routes.shippingAddressDestinationRoute:
        return MaterialPageRoute(
            builder: (_) => const AddAddressDestinationShippingPage());
      // Passenger Pages
      case Routes.orderReview1PassengerRoute:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewPassengerPage1());
      case Routes.orderReviewPassengerRoute2:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewPassengerPage2());
      case Routes.orderReviewRoute2:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewForShopPage1());
      case Routes.showPicker:
        return MaterialPageRoute(builder: (_) => const ShowPickerPage());
      case Routes.orderReviewRoute3:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewForShopPage2());
      case Routes.confirmationRoute:
        return MaterialPageRoute(builder: (_) => const ConfirmationPage());
      case Routes.confirmationPassengerRoute:
        return MaterialPageRoute(
            builder: (_) => const ConfirmationForPassengerPage());
      case Routes.myCartRoute:
        return MaterialPageRoute(builder: (_) => const MyCartPage());
      case Routes.ratingRoute:
        return MaterialPageRoute(builder: (_) => const RatingsPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}

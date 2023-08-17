import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/pages/home_view.dart';
import 'package:stay_home/Presntation/home/pages/service_page.dart';
import 'package:stay_home/Presntation/orders/pages/passenger/order_review_passenger_page_1.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import '../login/pages/login_view.dart';
import '../onboarding/presentaion/pages/on_boarding_view.dart';
import '../orders/pages/delivery/order_review_deliver_page_1.dart';
import '../orders/pages/delivery/order_review_deliver_page_2.dart';
import '../orders/pages/passenger/add_address_destinationpage_passenger_page.dart';
import '../orders/pages/passenger/add_address_source_passenger_page.dart';
import '../orders/pages/passenger/confirmation_for_passenger_page.dart';
import '../orders/pages/passenger/order_review_passenger_page_2.dart';
import '../orders/pages/shopping/add_address_destinationpage.dart';
import '../orders/pages/shopping/add_address_source_page.dart';
import '../orders/pages/shopping/confirmation_page.dart';
import '../orders/pages/shopping/order_review_page_1.dart';
import '../orders/pages/shopping/order_review_page_2.dart';
import '../orders/pages/shopping/order_review_page_3.dart';
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
  static const String reviewDelivery_1Route = "/delivery_1";
  static const String reviewDelivery_2Route = "/delivery_2";
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
  static const String myBasketRoute = "/basket";
  static const String showpicker = "/showpicker";
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
      case Routes.orderReview1Route:
        return MaterialPageRoute(builder: (_) => const OrderReviewPage1());
      case Routes.orderReview1PassengerRoute:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewPassengerPage1());
      case Routes.reviewDelivery_1Route:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewDeliveryPage1());
      case Routes.reviewDelivery_2Route:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewDeliveryPage2());
      case Routes.orderReviewPassengerRoute2:
        return MaterialPageRoute(
            builder: (_) => const OrderReviewPassengerPage2());
      case Routes.orderReviewRoute2:
        return MaterialPageRoute(builder: (_) => const OrderReviewPage2());
      case Routes.showpicker:
        return MaterialPageRoute(builder: (_) => const ShowPickerPage());
      case Routes.orderReviewRoute3:
        return MaterialPageRoute(builder: (_) => const OrderReviewPage3());
      case Routes.confirmationRoute:
        return MaterialPageRoute(builder: (_) => const ConfirmationPage());
      case Routes.confirmationPassengerRoute:
        return MaterialPageRoute(
            builder: (_) => const ConfirmationForPassengerPage());
      case Routes.myBasketRoute:
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

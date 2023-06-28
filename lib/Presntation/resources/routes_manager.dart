import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/home_view.dart';
import 'package:stay_home/Presntation/home/pages/service_page.dart';
import 'package:stay_home/Presntation/orders/confirmation_page.dart';
import 'package:stay_home/Presntation/orders/store_detailes.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import '../orders/order_review_page_1.dart';
import '../home/pages/my_basket_page.dart';
import '../orders/order_review_page_2.dart';
import '../orders/order_review_page_3.dart';
import '../orders/store_page.dart';
import '../orders/add_address_page.dart';
import '../login/login_view.dart';
import '../login/registartion_page.dart';
import '../login/widgets/profile_page.dart';
import '../onBoarding/presentaion/on_boarding_view.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String verificationRoute = "/verification";
  static const String profilesRoute = "/profile";
  static const String addressRoute = "/address";
  static const String homesRoute = "/home";
  static const String serviceRoute = "/service";
  static const String storeRoute = "/store";
  static const String storeDetailsRoute = "/store_details";
  static const String orderReview1Route = "/goods1";
  static const String orderReview2Route = "/goods2";
  static const String orderReview3Route = "/goods3";
  static const String confirmationRoute = "/confirmation";
  static const String myBasketRoute = "/basket";
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
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case Routes.profilesRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.addressRoute:
        return MaterialPageRoute(builder: (_) => const AddAddressPage());
      case Routes.homesRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.serviceRoute:
        return MaterialPageRoute(builder: (_) => const ServicePage());
      case Routes.storeRoute:
        return MaterialPageRoute(builder: (_) => const StorePage());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetails());
      case Routes.orderReview1Route:
        return MaterialPageRoute(builder: (_) => const OrderReviewPage1());
      case Routes.orderReview2Route:
        return MaterialPageRoute(builder: (_) => const OrderReviewPage2());
      case Routes.orderReview3Route:
        return MaterialPageRoute(builder: (_) => const OrderReviewPage3());
      case Routes.confirmationRoute:
        return MaterialPageRoute(builder: (_) => const ConfirmationPage());
      case Routes.myBasketRoute:
        return MaterialPageRoute(builder: (_) => const MyBasketPage());
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

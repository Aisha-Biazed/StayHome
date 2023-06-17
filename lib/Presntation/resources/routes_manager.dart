import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/home_view.dart';
import 'package:stay_home/Presntation/home/pages/service_page.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';

// import '../Auth/presentation/pages/login/add_address_page.dart';
// import '../Auth/presentation/pages/login/forgot_password_page.dart';
// import '../Auth/presentation/pages/login/forgot_password_verification_page.dart';
// import '../Auth/presentation/pages/login/login_view.dart';
// import '../Auth/presentation/pages/login/registartion_page.dart';
// import '../Auth/presentation/pages/login/widgets/profile_page.dart';
import '../login/add_address_page.dart';
import '../login/forgot_password_page.dart';
import '../login/forgot_password_verification_page.dart';
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
  static const String homesRoute = "/home";
  static const String serviceRoute = "/service";
  static const String addressRoute = "/address";
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
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case Routes.verificationRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordVerificationPage());
      case Routes.profilesRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.homesRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.serviceRoute:
        return MaterialPageRoute(builder: (_) => const ServicePage());
      case Routes.addressRoute:
        return MaterialPageRoute(builder: (_) => const AddAddressPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}

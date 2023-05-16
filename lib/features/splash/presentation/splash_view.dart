import 'package:flutter/material.dart';
import 'package:stay_home/features/splash/presentation/widgets/splash_body.dart';
class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffffffff),
    body: SplashViewBody(),
    );
  }
}

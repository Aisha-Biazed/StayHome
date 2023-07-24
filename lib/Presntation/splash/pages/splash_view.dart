import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/splash/pages/splash_body.dart';

import '../../resources/color_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const SplashViewBody(),
    );
  }
}

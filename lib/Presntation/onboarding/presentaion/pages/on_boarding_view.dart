import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/onboarding/presentaion/pages/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}

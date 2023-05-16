import 'package:flutter/material.dart';
import 'package:stay_home/features/onBoarding/presentaion/widgets/on_boarding_body.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}

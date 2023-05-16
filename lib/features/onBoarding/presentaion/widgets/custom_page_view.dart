import 'package:flutter/material.dart';
import 'package:stay_home/features/onBoarding/presentaion/widgets/page_view_item.dart';
import 'package:stay_home/resources/strings_manager.dart';
class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, required this.pageController}) : super(key: key);
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children:  const [
        PageViewItem(
          image: 'assets/images/onboarding3.png',
          title: 'أهلا بكم في ستاي هوم',
        ),
      PageViewItem(
        image: 'assets/images/onboarding2.png',
        title: AppStrings.onBoardingSubTitle1,
      ),
        PageViewItem(
          image: 'assets/images/onboarding1.png',
          title: AppStrings.onBoardingTitle2,
        ),
    ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/onboarding/presentaion/widgets/page_view_item.dart';
import 'package:stay_home/Presntation/resources/assets_manager.dart';

import '../../../resources/strings_manager.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, required this.pageController})
      : super(key: key);
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        Padding(
          padding: REdgeInsetsDirectional.only(top: 40),
          child: const PageViewItem(
            image: ImageAssets.onboardingLogo3,
            title: AppStrings.onBoardingTitle,
            subTitle: '',
          ),
        ),
        const PageViewItem(
          image: ImageAssets.confirmationImg,
          title: AppStrings.onBoardingTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
        ),
        const PageViewItem(
          image: ImageAssets.onboardingLogo1,
          title: AppStrings.onBoardingTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
        ),
      ],
    );
  }
}

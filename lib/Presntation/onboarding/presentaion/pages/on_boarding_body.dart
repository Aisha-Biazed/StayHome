import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_home/core/utils/size_config.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import '../../../login/pages/login_view.dart';
import '../../../resources/strings_manager.dart';
import '../widgets/custom_indicator.dart';
import '../widgets/custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.defaultSize! * 15,
            child: CustomIndicator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            )),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 5,
          child: CustomGeneralButton(
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Get.to(() => LoginView(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500));
              }
            },
            text: pageController!.hasClients
                ? (pageController?.page == 2
                    ? AppStrings.onBoardingButton3
                    : AppStrings.onBoardingButton1)
                : 'ابدأ الآن',
          ),
        )
      ],
    );
  }
}

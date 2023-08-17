import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/core/utils/size_config.dart';
import '../../onboarding/presentaion/pages/on_boarding_view.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fadingAnimation;

  @override
  initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        const Spacer(),
        AnimatedBuilder(
          animation: fadingAnimation!,
          builder: (context, _) => Opacity(
            opacity: fadingAnimation?.value,
            child: Text(
              AppStrings.splashTitle,
              style: TextStyle(
                  fontSize: 51,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.splash),
            ),
          ),
        ),
        Image.asset(ImageAssets.splashLogo),
        const Spacer()
      ],
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => OnBoardingView(), transition: Transition.fade);
    });
  }
}

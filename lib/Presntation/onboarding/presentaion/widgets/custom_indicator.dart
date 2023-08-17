import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key, required this.dotIndex}) : super(key: key);
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          size: const Size(31, 5),
          activeSize: const Size(10, 5),
          activeColor: ColorManager.primary,
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: ColorManager.primary)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: ColorManager.primary))),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}

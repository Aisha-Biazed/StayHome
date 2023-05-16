import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_home/core/utils/size_config.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';
import 'package:stay_home/features/onBoarding/presentaion/widgets/custom_indicator.dart';
import 'package:stay_home/pages/login_page.dart';
import '../../../../resources/strings_manager.dart';
import 'custom_page_view.dart';
class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  @override
  void initState(){
    pageController = PageController(
      initialPage: 0
    )..addListener(() {
      setState((){
      });
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
            bottom: SizeConfig.defaultSize! * 17,
            child: CustomIndicator(
              dotIndex: pageController!.hasClients ? pageController?.page :0,)
        ),
        Visibility(
          visible:pageController!.hasClients ? (pageController?.page ==2 ? false: true):true,
          child: Positioned(
            top: SizeConfig.defaultSize! *10,
              right: 32,
              child:  Text(
                '',
                style: TextStyle(
                  fontFamily: 'Popins',
                  fontSize: 14,
                  color: Color(0xff898989)
                ),
                textAlign: TextAlign.left,
          )),
        ),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 8,
            child: CustomGeneralButton(
              onTap: (){
                if(pageController!.page! <2)
                  {
                    pageController?.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  }else{
                  Get.to(()=>LoginPage(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 500));
                }
              },
              text: pageController!.hasClients ?(pageController?.page ==2 ? 'ابدأ الآن' : 'التالي'):'التالي',
            ))
      ],
    );
  }
}

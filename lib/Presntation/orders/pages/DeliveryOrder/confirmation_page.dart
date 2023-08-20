import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../../../core/widgets/custom_confirmation.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomConfirmationPage(
      titleText: AppStrings.requestReceived1,
      subTitleText: AppStrings.requestReceived2,
    ));
  }
}

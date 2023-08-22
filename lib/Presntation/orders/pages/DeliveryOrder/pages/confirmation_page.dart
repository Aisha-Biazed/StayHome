import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_confirmation.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomConfirmationPage(
      titleText: AppStrings.requestReceived1,
      subTitleText: AppStrings.requestReceived2,
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.homesRoute);
      },
    ));
  }
}

import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_confirmation.dart';
import '../../../resources/strings_manager.dart';

class ConfirmationForPassengerPage extends StatelessWidget {
  const ConfirmationForPassengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomConfirmationPage(
      titleText: AppStrings.sendNotice1,
      subTitleText: AppStrings.sendNotice2,
    ));
  }
}

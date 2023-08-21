import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_confirmation.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';

class ConfirmationForPassengerPage extends StatelessWidget {
  const ConfirmationForPassengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomConfirmationPage(
        titleText: AppStrings.sendNotice1,
        subTitleText: AppStrings.sendNotice2,
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.homesRoute);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/pages/home_body_view.dart';
import '../../../../../core/widgets/custom_confirmation.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';

class ConfirmationForPassengerPage extends StatelessWidget {
  const ConfirmationForPassengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomConfirmationPage(
        titleText: AppStrings.requestReceived1,
        subTitleText: '',
        onTap: () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (BuildContext context) => const HomeBodyView()),
                  (Route<dynamic> route) => false
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeBodyView(initPage: 2,)));
        },
      ),
    );
  }
}

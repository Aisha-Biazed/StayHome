import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/widget/home_body_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBodyView(),
    );
  }
}

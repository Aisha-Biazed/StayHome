import 'package:flutter/material.dart';
import 'package:stay_home/Presntation/home/widget/custom_appbar.dart';
import 'package:stay_home/Presntation/home/widget/home_body_view.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: const HomeBodyView(),
    );
  }
}

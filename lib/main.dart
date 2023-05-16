import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'features/splash/presentation/splash_view.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Color _primarColor = HexColor('#6659B3');
  Color _accentColor = HexColor('#8A02AE');
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
        primaryColor: _primarColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
        accentColor: _accentColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

//MaterialApp(theme: ThemeData(
// //         primaryColor: _primarColor,
// //         scaffoldBackgroundColor: Colors.grey.shade100,
// //         primarySwatch: Colors.grey,
// //         accentColor: _accentColor,
// //       ),
//
//       debugShowCheckedModeBanner: false,
//       title: 'Login UI - Flutter',
//       home: SplashScreen(title: '',),
//     );
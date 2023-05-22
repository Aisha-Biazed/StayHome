import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/home/widget/home_body_view.dart';
import 'Presntation/resources/routes_manager.dart';
import 'Presntation/splash/splash_view.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Color _primarColor = HexColor('#6659B3');
  Color _accentColor = HexColor('#8A02AE');
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return GetMaterialApp(
          title: 'Localizations Sample App',
          localizationsDelegates: const[
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', "AE"), // EnglishSpanish
          ],
          theme: ThemeData(
            fontFamily: 'Inter',
            primaryColor: _primarColor,
            scaffoldBackgroundColor: Colors.grey.shade100,
            primarySwatch: Colors.grey,
            accentColor: _accentColor,
          ),
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          debugShowCheckedModeBanner: false,
          home: HomeBodyView(),
        );

      },

    );
  }
}

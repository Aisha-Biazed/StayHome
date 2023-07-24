import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/home/navigation_page/orders_page.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import '../../login/pages/profile_page.dart';
import '../../orders/store/store_page.dart';
import '../../resources/strings_manager.dart';
import '../navigation_page/main_page.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  int selectedPageIndex = 0;
  int pageIndex = 0;
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    StorePage(),
    OrderPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 23.33.w,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: AppStrings.homeNavLabel_1,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront),
              label: AppStrings.homeNavLabel_2,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: AppStrings.homeNavLabel_3),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppStrings.homeNavLabel_4,
            )
          ],
          currentIndex: _currentIndex,
          selectedItemColor: ColorManager.primary,
          selectedIconTheme: IconThemeData(
            color: ColorManager.primary,
          ),
          unselectedIconTheme: IconThemeData(
            color: ColorManager.secondaryGrey,
          ),
          unselectedItemColor: ColorManager.secondaryGrey,
          enableFeedback: true,
          onTap: _ChangeItem,
        ),
      ),
    );
  }

  void _ChangeItem(int value) {
    setState(() {
      print(value);
      _currentIndex = value;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import 'header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: const Text('Profile Page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  ColorManager.primary,
                  ColorManager.primary,
                  // Theme.of(context).primaryColor , Theme.of(context).accentColor
                ])),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 100,
                child: const HeaderWidget(100, false, Icons.house_rounded),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 5, color: Colors.white),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(5, 5)),
                        ],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      txt: AppStrings.hiba,
                      txtColor: ColorManager.dark,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    65.verticalSpace,
                    Card(
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            ...ListTile.divideTiles(color: Colors.grey, tiles: [
                              GestureDetector(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  leading: Icon(Icons.my_location,
                                      color: ColorManager.primary),
                                  title: const CustomText(
                                      txt: AppStrings.addAddress),
                                  subtitle: Text("سوريا"),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.addressRoute);
                                  },
                                ),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                leading: Icon(Icons.email,
                                    color: ColorManager.primary),
                                title: const CustomText(
                                    txt: AppStrings.usernameHint),
                                subtitle: Text("mishubiazed@gmail.com"),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                leading: Icon(Icons.phone,
                                    color: ColorManager.primary),
                                title: const CustomText(
                                    txt: AppStrings.mobileNumber),
                                subtitle: Text("+963 956 186 397"),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                leading: Icon(
                                  Icons.calendar_month_outlined,
                                  color: ColorManager.primary,
                                ),
                                title: const CustomText(
                                    txt: AppStrings.bairthdatehit),
                                subtitle: const CustomText(
                                    txt: AppStrings.profiledate),
                              ),
                            ])
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

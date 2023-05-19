import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stay_home/Presntation/resources/color_manager.dart';
import 'package:stay_home/Presntation/resources/strings_manager.dart';
import 'package:stay_home/core/constants.dart';
import 'package:stay_home/core/widgets/custom_text.dart';

import '../../splash/splash_view.dart';
import '../forgot_password_page.dart';
import '../forgot_password_verification_page.dart';
import '../login_view.dart';
import '../registartion_page.dart';
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
               colors: <Color>[
                kMainColor,
                kMainColor,
                // Theme.of(context).primaryColor , Theme.of(context).accentColor
              ])
            ),
          ),
          actions: [
            Container(
              margin: REdgeInsetsDirectional.only(end: 16,top: 16),
              child: Stack(
                children: <Widget>[
                  const Icon(Icons.notifications),
                  Positioned(
                    right:0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
                        constraints: const BoxConstraints(minWidth: 12, minHeight: 12),
                        child: const Text('5',style: TextStyle(color: Colors.white,fontSize: 8),
                        textAlign: TextAlign.center,),
                      ))
                ],

              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: 100,
              child: const HeaderWidget(100,false,Icons.house_rounded),),
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
                        boxShadow: const [BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5,5)
                        ),],
                      ),
                      child:  Icon(Icons.person, size: 80,color: Colors.grey.shade300,),
                    ),
                    const SizedBox(height: 20,),
                    const Text('Mr.Joudi & Hiba',style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold
                    ),),

                    65.verticalSpace,
                    Card(
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                          ...ListTile.divideTiles(
                            color:Colors.grey,
                              tiles: [
                                 ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,vertical: 4,),
                                  leading: Icon(Icons.my_location,color:ColorManager.primary),
                                  title: const CustomText(txt:  AppStrings.addAddress),
                                  subtitle: Text("سوريا"),
                                ),
                                 ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,vertical: 4,),
                                  leading: Icon(Icons.email,color:ColorManager.primary),
                                  title: const CustomText(txt:  AppStrings.usernameHint),
                                  subtitle: Text("mishubiazed@gmail.com"),
                                ),
                                   ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,vertical: 4,),
                                leading: Icon(Icons.phone ,color:ColorManager.primary),
                                title: CustomText(txt:  AppStrings.mobileNumber),
                                subtitle: Text("+963 956 186 397"),
                                ),
                                 ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,vertical: 4,),
                                  leading: Icon(Icons.person,color: ColorManager.primary,),
                                  title:  CustomText(txt:  AppStrings.bairthdatehit),
                                  subtitle:CustomText(txt:  AppStrings.profiledate),
                                ),
                              ]
                          )
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

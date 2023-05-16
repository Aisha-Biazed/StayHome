import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stay_home/core/constants.dart';
import 'package:stay_home/features/splash/presentation/splash_view.dart';
import 'package:stay_home/pages/login_page.dart';
import 'package:stay_home/pages/widgets/header_widget.dart';

import '../forgot_password_page.dart';
import '../forgot_password_verification_page.dart';
import '../registartion_page.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize =24;
  double _drawerFontSize = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
            margin: const EdgeInsets.only(top: 16,right: 16),
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
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0 , 1.0],
              colors: [
                kMainColor.withOpacity(0.2),
                Theme.of(context).primaryColor.withOpacity(0.7)
              ]
            )
          ),
          child: ListView(
            children: [
           DrawerHeader(
             decoration: BoxDecoration(
               color: Theme.of(context).primaryColor,
               gradient: LinearGradient(
                 begin: Alignment.bottomLeft,
                 stops: [0.0, 1.0],
                 colors: [Theme.of(context).primaryColor,kMainColor.withOpacity(0.5)]
               )
             ),
               child: const Text('StayHome',
               style: TextStyle(fontSize: 25, color: Colors.white,
               fontWeight: FontWeight.bold
               ),
               )
           ),
              ListTile(
                leading: Icon(Icons.screen_lock_landscape_rounded,size:_drawerIconSize,color: Theme.of(context).primaryColor,),
                title: Text('Splash Screen ',style:TextStyle(fontSize:_drawerFontSize, color:Theme.of(context).primaryColor)),
                onTap: (){
                  Get.to(()=>const SplashView(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                },
              ),
              Divider(color:Theme.of(context).primaryColor,height: 1,),
              ListTile(
                leading: Icon(Icons.login_rounded,size:_drawerIconSize,color: Theme.of(context).primaryColor,),
                title: Text('Login Page ',style:TextStyle(fontSize:_drawerFontSize, color:Theme.of(context).primaryColor)),
                onTap: (){
                  Get.to(()=>const LoginPage(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                },
              ),
              Divider(color:Theme.of(context).primaryColor,height: 1,),
              ListTile(
                leading: Icon(Icons.person_add_alt_1_rounded,size:_drawerIconSize,color: Theme.of(context).primaryColor,),
                title: Text('Registration Page  ',style:TextStyle(fontSize:_drawerFontSize, color:Theme.of(context).primaryColor)),
                onTap: (){
                  Get.to(()=> RegistrationPage(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                },
              ),
              Divider(color:Theme.of(context).primaryColor,height: 1,),
              ListTile(
                leading: Icon(Icons.password_rounded,size:_drawerIconSize,color: Theme.of(context).primaryColor,),
                title: Text('Forgot Password Page ',style:TextStyle(fontSize:_drawerFontSize, color:Theme.of(context).primaryColor)),
                onTap: (){
                  Get.to(()=> const ForgotPasswordPage(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                },
              ),
              Divider(color:Theme.of(context).primaryColor,height: 1,),
              ListTile(
                leading: Icon(Icons.verified_user_sharp,size:_drawerIconSize,color: Theme.of(context).primaryColor,),
                title: Text('Verification Page',style:TextStyle(fontSize:_drawerFontSize, color:Theme.of(context).primaryColor)),
                onTap: (){
                  Get.to(()=> const ForgotPasswordVerificationPage(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                },
              ),
              Divider(color:Theme.of(context).primaryColor,height: 1,),
              ListTile(
                leading: Icon(Icons.login_rounded,size:_drawerIconSize,color: Theme.of(context).primaryColor,),
                title: Text('Logout',style:TextStyle(fontSize:_drawerFontSize, color:Theme.of(context).primaryColorLight)),
                onTap: (){
                SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
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
                  const SizedBox(height: 20,),
                  const Text('Programmer',style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0,bottom: 4.0),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "معلومات المستخدم",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                      textAlign:TextAlign.center ,
                    ),
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                        ...ListTile.divideTiles(
                          color:Colors.grey,
                            tiles: [
                              const ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,vertical: 4,),
                                leading: Icon(Icons.my_location),
                                title: Text("الموقع"),
                                subtitle: Text("سوريا"),
                              ),
                              const ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,vertical: 4,),
                                leading: Icon(Icons.email),
                                title: Text("البريد الإلكتروني"),
                                subtitle: Text("mishubiazed@gmail.com"),
                              ),
                                const ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,vertical: 4,),
                              leading: Icon(Icons.phone),
                              title: Text("رقم الموبايل"),
                              subtitle: Text("+963 956 186 397"),
                              ),
                              const ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12,vertical: 4,),
                                leading: Icon(Icons.person),
                                title: Text("معلوماتي"),
                                subtitle: Text("this about me link and you can know about me in this section "),
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
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_home/pages/registartion_page.dart';
import 'package:stay_home/pages/widgets/header_widget.dart';
import 'package:stay_home/pages/widgets/profile_page.dart';

import '../common/theme_helper.dart';
import '../core/constants.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 double _headerHeight = 250;
 Key _formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight,true, Icons.login_rounded),
            ),
            SafeArea(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Text(
                       'مرحبا',
                        style: TextStyle(
                          fontSize: 60, fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        key: _formkey,
                        child:Column(
                          children: [
                            TextField(
                            decoration: ThemeHelper().textInputDecoration('اسم المستخدم', 'أدخل اسمك أو بريدك الإلكتروني'),
                            ),
                            const SizedBox(height: 30.0,),
                            TextField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration('كلمة المرور', 'أدخل  كلمة المرور')),
                            const SizedBox(height: 15.0),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                              alignment: Alignment.topRight,
                              child: const Text('Forget your password?'),
                            ),

                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Sign In', style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),),
                                ),
                                onPressed: () {
                                  Get.to(()=>const ProfilePage(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                                },

                              )
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: 'Don\'t have an account? Create? '),
                                    TextSpan(
                                      text: 'Create?',
                                      recognizer:TapGestureRecognizer()
                                        ..onTap =(){
                                        Get.to(()=>RegistrationPage(),transition: Transition.rightToLeft,duration: const Duration(milliseconds: 500));
                                        },
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kMainColor
                                      )
                                    ),
                                  ]
                                )
                              ) ,
                            )
                          ],
                        ),

                      )
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stay_home/Presntation/login/widgets/header_widget.dart';
import 'package:stay_home/core/widgets/custom_buttons.dart';



import '../../common/theme_helper.dart';
import '../../core/widgets/custom_text.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';


class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 150,
                child: const HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding:  REdgeInsetsDirectional.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              alignment: Alignment.center,
                              child: CustomText(txt:AppStrings.registerText , fontSize: 25, txtColor: ColorManager.primary,
                              fontWeight: FontWeight.w600,)),
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(AppStrings.firstname,),
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          30.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(AppStrings.bairthdate,),
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),

                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(AppStrings.usernameHint,),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                  return "Enter a valid email address";
                                }
                                return null;
                              },
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                         20.verticalSpace,
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.mobileNumber,
                                  AppStrings.mobileNumber),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                  return "Enter a valid phone number";
                                }
                                return null;
                              },
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                         20.verticalSpace,
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  AppStrings.passwordHint,),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                            ),
                            decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                       // 15.verticalSpace,
                       //    FormField<bool>(
                       //      builder: (state) {
                       //        return Column(
                       //          children: <Widget>[
                       //            Row(
                       //              children: <Widget>[
                       //                Checkbox(
                       //                    value: checkboxValue,
                       //                    onChanged: (value) {
                       //                      setState(() {
                       //                        checkboxValue = value!;
                       //                        state.didChange(value);
                       //                      });
                       //                    }),
                       //               // const Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                       //              ],
                       //            ),
                       //            Container(
                       //              child: Text(
                       //                state.errorText ?? '',
                       //                textAlign: TextAlign.right,
                       //                style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                       //              ),
                       //            )
                       //          ],
                       //        );
                       //      },
                       //      validator: (value) {
                       //        if (!checkboxValue) {
                       //          return 'You need to accept terms and conditions';
                       //        } else {
                       //          return null;
                       //        }
                       //      },
                       //    ),
                        50.verticalSpace,
                          Container(
                            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: CustomGeneralButton(
                              text: AppStrings.registerBtn,

                            onTap: (){
                              Navigator.pushNamed(context, Routes.profilesRoute);
                            },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                const CustomText(
                                  txt: AppStrings.emailHint,
                                ),
                                10.horizontalSpace,
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, Routes.loginRoute);
                                  },
                                  child: CustomText(
                                    txt: AppStrings.userNameInvalid,
                                    txtColor: ColorManager.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stay_home/Presntation/login/cubit/cubit.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/login/widgets/header_widget.dart';
import '../../common/theme_helper.dart';
import '../../core/widgets/custom_buttons.dart';
import '../../core/widgets/custom_text.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 double _headerHeight = 250;
 var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
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
                           CustomText(
                             txt:AppStrings.loginTitle,
                             txtColor: ColorManager.primary,
                             fontWeight: FontWeight.w700,
                             fontSize: 30.sp,
                           ),
                          30.verticalSpace,
                          Form(
                            key: formkey,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                decoration: ThemeHelper().textInputDecoration(AppStrings.usernameHint, AppStrings.usernameOutBorder),
                                  validator: (val){
                                 if(val!.isEmpty){

                                 }
                                  },
                                ),
                                30.verticalSpace,
                                TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(AppStrings.passwordHint, AppStrings.usernameOutBorder)),
                                 15.verticalSpace,
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  child: const CustomText(txt: AppStrings.forgetPasswordText,),
                                ),
                                 ConditionalBuilder(
                                   fallback: (BuildContext context) => Center(
                                     child: CircularProgressIndicator(
                                       color: ColorManager.primary,
                                     ),
                                   ),
                                   condition: state is!LoginLoadingState,
                                   builder: (BuildContext context) =>Container(
                                     margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                     decoration: ThemeHelper().buttonBoxDecoration(context),
                                     child: CustomGeneralButton(text: AppStrings.loginBtn,
                                       onTap: (){
                                         if(formkey.currentState!.validate()){
                                           print("sldfoak");
                                           LoginCubit.get(context).userLogin(
                                             email: emailController.text,
                                             password:passwordController.text,
                                           );

                                         }

                                       // Navigator.pushNamed(context, Routes.profilesRoute);
                                       }
                                       ,
                                ),
                                   ),
                                 ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Row(
                                    children:[
                                      const CustomText(
                                        txt: AppStrings.login,
                                      ),
                                      10.horizontalSpace,
                                       GestureDetector(
                                         onTap: (){
                                           Navigator.pushNamed(context, Routes.registerRoute);
                                         },
                                         child: CustomText(
                                          txt: AppStrings.forgetPassword,
                                          txtColor: ColorManager.primary,
                                           fontWeight: FontWeight.w700,
                                      ),
                                       ),
                                    ],
                                  ),
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
  },
),
),
      );
  }
}

// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:stay_home/Presntation/login/widgets/header_widget.dart';
// import '../../common/theme_helper.dart';
// import '../../core/widgets/custom_buttons.dart';
// import '../../core/widgets/custom_text.dart';
// import '../resources/color_manager.dart';
// import '../resources/routes_manager.dart';
// import '../resources/strings_manager.dart';
// import 'cubit/states.dart';
//
// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({Key? key}) : super(key: key);
//
//   @override
//   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// }
//
// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   var formkey = GlobalKey<FormState>();
//
//   get state => null;
//
//   @override
//   Widget build(BuildContext context) {
//     // var emailController = TextEditingController();
//     // var passwordController = TextEditingController();
//     double _headerHeight = 300;
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: _headerHeight,
//                   child:
//                       HeaderWidget(_headerHeight, true, Icons.password_rounded),
//                 ),
//                 SafeArea(
//                   child: Container(
//                     margin: REdgeInsetsDirectional.only(
//                         start: 10, end: 25, top: 10, bottom: 10),
//                     padding: REdgeInsetsDirectional.only(
//                         start: 10, end: 10, top: 0, bottom: 0),
//                     child: Column(
//                       children: [
//                         CustomText(
//                           txt: AppStrings.reEnteremail,
//                           txtColor: ColorManager.primary,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 30.sp,
//                         ),
//                         30.verticalSpace,
//                         Form(
//                           key: formkey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               TextFormField(
//                                 decoration: ThemeHelper().textInputDecoration(
//                                     AppStrings.usernameHint,
//                                     AppStrings.usernameOutBorder),
//                                 validator: (val) {
//                                   if (val!.isEmpty) {}
//                                 },
//                               ),
//                               20.verticalSpace,
//                               TextFormField(
//                                   obscureText: true,
//                                   decoration: ThemeHelper().textInputDecoration(
//                                       AppStrings.passwordHint,
//                                       AppStrings.usernameOutBorder)),
//                               20.verticalSpace,
//                               TextFormField(
//                                   obscureText: true,
//                                   decoration: ThemeHelper().textInputDecoration(
//                                       AppStrings.resetPassword,
//                                       AppStrings.resetPassword)),
//                               15.verticalSpace,
//                               ConditionalBuilder(
//                                 fallback: (BuildContext context) => Center(
//                                   child: CircularProgressIndicator(
//                                     color: ColorManager.primary,
//                                   ),
//                                 ),
//                                 condition: state is! LoginLoadingState,
//                                 builder: (BuildContext context) => Container(
//                                   margin: REdgeInsetsDirectional.only(
//                                       end: 25, top: 10, start: 25, bottom: 10),
//                                   padding: REdgeInsetsDirectional.only(
//                                     top: 0,
//                                     bottom: 0,
//                                     end: 10,
//                                     start: 10,
//                                   ),
//                                   decoration: ThemeHelper()
//                                       .buttonBoxDecoration(context),
//                                   child: CustomGeneralButton(
//                                     text: AppStrings.sendBtn,
//                                     onTap: () {
//                                       // if(formkey.currentState!.validate()){
//                                       //   print("sldfoak");
//                                       //   LoginCubit.get(context).userLogin(
//                                       //     email: emailController.text,
//                                       //     password:passwordController.text,
//                                       //   );
//                                       //
//                                       // }
//
//                                       Navigator.pushNamed(
//                                           context, Routes.homesRoute);
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: REdgeInsetsDirectional.only(
//                                     end: 10, top: 20, start: 10, bottom: 20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const CustomText(
//                                       txt: AppStrings.fieldCodeTxt,
//                                     ),
//                                     10.horizontalSpace,
//                                     GestureDetector(
//                                       onTap: () {
//                                         Navigator.pushNamed(
//                                             context, Routes.verificationRoute);
//                                       },
//                                       child: CustomText(
//                                         txt: AppStrings.resendTxt,
//                                         txtColor: ColorManager.primary,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

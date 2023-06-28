// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:stay_home/Presntation/login/widgets/header_widget.dart';
// import 'package:stay_home/Presntation/login/widgets/profile_page.dart';
// import '../../common/theme_helper.dart';
// import '../../core/widgets/custom_text.dart';
// import '../resources/color_manager.dart';
// import '../resources/routes_manager.dart';
// import '../resources/strings_manager.dart';
//
// class ForgotPasswordVerificationPage extends StatefulWidget {
//   const ForgotPasswordVerificationPage({Key? key}) : super(key: key);
//
//   @override
//   _ForgotPasswordVerificationPageState createState() =>
//       _ForgotPasswordVerificationPageState();
// }
//
// class _ForgotPasswordVerificationPageState
//     extends State<ForgotPasswordVerificationPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool _pinSuccess = false;
//
//   @override
//   Widget build(BuildContext context) {
//     double _headerHeight = 300;
//
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: _headerHeight,
//                 child: HeaderWidget(
//                     _headerHeight, true, Icons.privacy_tip_outlined),
//               ),
//               SafeArea(
//                 child: Container(
//                   margin: REdgeInsetsDirectional.only(
//                     top: 10,
//                     bottom: 10,
//                     end: 25,
//                     start: 25,
//                   ),
//                   //const EdgeInsets.fromLTRB(25, 10, 25, 10),
//                   padding: REdgeInsetsDirectional.only(
//                     top: 0,
//                     bottom: 0,
//                     end: 10,
//                     start: 10,
//                   ),
//                   //const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: Column(
//                     children: [
//                       Container(
//                         alignment: Alignment.topLeft,
//                         margin: REdgeInsetsDirectional.only(
//                           top: 0,
//                           bottom: 0,
//                           end: 20,
//                           start: 20,
//                         ),
//                         // const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                                 margin: REdgeInsetsDirectional.only(
//                                   top: 10,
//                                   bottom: 10,
//                                   end: 0,
//                                   start: 0,
//                                 ),
//                                 // const EdgeInsets.fromLTRB(25, 10, 25, 10),
//                                 padding: REdgeInsetsDirectional.only(
//                                   top: 0,
//                                   bottom: 0,
//                                   end: 10,
//                                   start: 10,
//                                 ),
//                                 alignment: Alignment.center,
//                                 child: CustomText(
//                                   txt: AppStrings.validate,
//                                   fontSize: 22.sp,
//                                   txtColor: ColorManager.dark,
//                                   fontWeight: FontWeight.w600,
//                                 )),
//                             Container(
//                               margin: REdgeInsetsDirectional.only(
//                                   end: 25, top: 2, start: 25, bottom: 10),
//                               padding: REdgeInsetsDirectional.only(
//                                 top: 0,
//                                 bottom: 0,
//                                 end: 10,
//                                 start: 10,
//                               ),
//                               alignment: Alignment.center,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   CustomText(
//                                     txt: AppStrings.splashViewTex,
//                                     fontSize: 16.sp,
//                                     txtColor: ColorManager.black,
//                                   ),
//                                   CustomText(
//                                     txt: AppStrings.splashViewTe,
//                                     fontSize: 16.sp,
//                                     txtColor: ColorManager.black,
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       20.verticalSpace,
//                       Form(
//                         key: _formKey,
//                         child: Column(
//                           children: <Widget>[
//                             OTPTextField(
//                               length: 4,
//                               width: 300,
//                               fieldWidth: 50,
//                               style: const TextStyle(fontSize: 30),
//                               textFieldAlignment: MainAxisAlignment.spaceAround,
//                               fieldStyle: FieldStyle.underline,
//                               onCompleted: (pin) {
//                                 setState(() {
//                                   _pinSuccess = true;
//                                 });
//                               },
//                             ),
//                             60.verticalSpace,
//                             Container(
//                               decoration: _pinSuccess
//                                   ? ThemeHelper().buttonBoxDecoration(context)
//                                   : ThemeHelper().buttonBoxDecoration(
//                                       context, "#AAAAAA", "#757575"),
//                               child: ElevatedButton(
//                                 style: ThemeHelper().buttonStyle(),
//                                 child: Padding(
//                                   padding: const EdgeInsets.fromLTRB(
//                                       100, 10, 100, 10),
//                                   child: CustomText(
//                                     txt: AppStrings.sendBtn,
//                                     fontSize: 16.sp,
//                                     txtColor: ColorManager.white,
//                                   ),
//                                 ),
//                                 onPressed: _pinSuccess
//                                     ? () {
//                                         Navigator.of(context)
//                                             .pushAndRemoveUntil(
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ProfilePage()),
//                                                 (Route<dynamic> route) =>
//                                                     false);
//                                       }
//                                     : null,
//                               ),
//                             ),
//                             35.verticalSpace,
//                             Container(
//                                 margin: REdgeInsetsDirectional.only(
//                                     end: 25, top: 20, start: 25, bottom: 10),
//                                 padding: REdgeInsetsDirectional.only(
//                                     end: 10, top: 0, start: 10, bottom: 0),
//                                 alignment: Alignment.center,
//                                 child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.pushNamed(
//                                           context, Routes.loginRoute);
//                                     },
//                                     child: CustomText(
//                                       txt: AppStrings.returnTologin,
//                                       fontSize: 17.sp,
//                                       txtColor: ColorManager.secondaryGrey,
//                                     ))),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }

// import 'dart:async';
//
// import 'package:awesome_icons/awesome_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:stay_home/pages/login_page.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key, required this.title}) : super(key: key);
//  final String title;
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//  bool _isVisible =false;
//   _SplashScreenState(){
//
//     new Timer(const Duration(milliseconds: 2000), (){
//       setState(() {
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
//       });
//     });
//     new Timer(
//       Duration(milliseconds: 10), () {
//       setState(() {
//         _isVisible =true;
//       });
//     }
//     );
//    }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: new BoxDecoration(
//           gradient: new LinearGradient(
//           colors:[Theme.of(context).accentColor, Theme.of(context).primaryColor],
//             begin: const FractionalOffset(0,0),
//             end: const FractionalOffset(1.0, 0.0),
//             stops: [0.0 , 1.0],
//             tileMode: TileMode.clamp
//         )
//         ),
//         child:AnimatedOpacity(
//           opacity: _isVisible ?1.0 :0,
//           duration: const Duration(milliseconds: 1200),
//           child: Center(
//             child: Container(
//               height: 140.0,
//               width: 140.0,
//               child:  Center(
//                 child: ClipOval(
//                   child: Icon(Icons.drive_eta_rounded, size: 128,),//put your logo here
//                  // child:Icon(
//                  //    fontAwesomeIcons[Icons.drive_eta_rounded],
//                  //    size: 128.0,
//                  //  ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 shape:BoxShape.circle,
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 2.0,
//                     offset: const Offset(5.0 , 3.0),
//                     spreadRadius:  2.0
//                   )
//                 ]
//               ),
//             ),
//           ),
//         ) ,
//     );
//   }
// }

import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({Key? key, this.txt, required this.fontSize, this.txtColor}) : super(key: key);
final String? txt;
final double? fontSize;
final Color? txtColor;
  @override
  Widget build(BuildContext context) {
    return  Text(
        txt!,
        style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize!,
        fontWeight: FontWeight.bold,
        color: txtColor)
    );
  }
}

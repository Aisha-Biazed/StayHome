import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.txt,this.fontSize=18, this.txtColor, this.fontWeight}) : super(key: key);
final String txt;
final FontWeight? fontWeight;
final double? fontSize;
final Color? txtColor;
  @override
  Widget build(BuildContext context) {
    return  Text(
        txt,
        textAlign:TextAlign.right,
        style: TextStyle(
        fontSize: fontSize!,
        fontWeight: fontWeight,
        color: txtColor)
    );
  }
}

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.txt,
      this.fontSize = 18,
      this.txtColor,
      this.fontWeight,
      this.textAlign})
      : super(key: key);
  final String txt;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? txtColor;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(txt,
        textAlign: textAlign,
        style: TextStyle(
            fontSize: fontSize!,
            fontWeight: fontWeight,
            fontFamily: 'sst-arabic', //"sst-arabic",
            color: txtColor));
  }
}

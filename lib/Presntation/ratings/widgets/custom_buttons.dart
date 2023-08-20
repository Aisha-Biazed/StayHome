import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manager.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    Key? key,
    this.color,
    required this.text,
    this.colorText,
    this.onPressed,
  }) : super(key: key);
  final Color? color;
  final Color? colorText;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            primary: ColorManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: colorText, fontSize: 14),
          )),
    );
  }
}

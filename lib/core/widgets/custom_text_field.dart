import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Presntation/resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.inputType,
      this.suffexIcon,
      this.onSaved,
      this.onChanged,
      this.maxLines,
      this.hintText,
      this.color,
      required this.lableText,
      this.controller,
      required this.readOnly,
      this.onTap,
      this.initialValue})
      : super(key: key);
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final String? hintText;
  final String lableText;
  final Color? color;
  final bool readOnly;
  final Function()? onTap;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        initialValue: initialValue,
        readOnly: readOnly,
        controller: controller,
        keyboardType: inputType,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        onTap: onTap,
        decoration: InputDecoration(
            contentPadding: REdgeInsetsDirectional.only(
                top: 10, start: 20, end: 20, bottom: 10),
            hintStyle: TextStyle(color: color),
            labelText: lableText,
            labelStyle: TextStyle(color: color),
            suffixIcon: suffexIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.w),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.w),
                borderSide: BorderSide(color: ColorManager.mainGrey)),
            hintText: hintText,
            filled: true,
            fillColor: ColorManager.mainGrey,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(color: ColorManager.mainGrey))),
      ),
    );
  }
}
// flutter native

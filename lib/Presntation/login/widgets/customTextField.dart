import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';


class CustomTextField extends StatelessWidget {
 final String hint_text;
 final  suffix;
 final suffix_icon;
 final keyboard;
 final controller;
 final PasswordFoucs;
 final obsc;
 final validate;
  const CustomTextField({Key? key, required this.hint_text, this.suffix, this.suffix_icon, this.keyboard, this.controller, this.PasswordFoucs, this.obsc, this.validate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsc,
      keyboardType: keyboard,
      controller: controller,
      validator:validate,
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorManager.purple,
          hintText: hint_text,
          hintStyle: TextStyle(fontSize: 17.sp,color: ColorManager.dark,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:ColorManager.purple,)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:ColorManager.purple,)
          ),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorManager.purple,)
          ),
          suffixIcon: suffix?suffix_icon:null,


      ),
    );
  }
}

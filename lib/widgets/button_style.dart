import 'package:flutter/material.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';

class ButtonStyles {
  static elevetedStyle({required double  width,required double height,required BuildContext context, Color backgroundcolor = ColorConst.blackfortext, Color borderColor = Colors.transparent}) {
    return ElevatedButton.styleFrom(
      elevation: 0,
        // textStyle: TextStyle(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        primary: backgroundcolor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(width, height));
  }
  
}
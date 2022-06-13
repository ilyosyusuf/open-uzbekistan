import 'package:flutter/material.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';

class MainTheme {
  static ThemeData get apptheme => ThemeData(
      colorScheme: ColorScheme.light(
          primary: ColorConst.kPrimaryColor, brightness: Brightness.light));
}
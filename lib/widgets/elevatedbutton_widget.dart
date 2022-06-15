// import 'package:flutter/material.dart';
// import 'package:openuzbekistan/core/constants/colors/color_const.dart';

// class ElevatedButtonWidget extends StatelessWidget {
//   VoidCallback onPressed;
//   String text;
//   ElevatedButtonWidget({Key? key, required this.onPressed, required this.text})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//           elevation: 15.0,
//           primary: Colors.blue,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           fixedSize: Size(MediaQuery.of(context).size.width, 50)),
//       child: Text(text),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';
import 'package:openuzbekistan/widgets/button_style.dart';

class ButtonWidgets extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  const ButtonWidgets({this.backgroundColor = ColorConst.blackfortext,this.borderColor = Colors.transparent, required this.child,this.height = 30, required this.onPressed,this.width = 360,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyles.elevetedStyle(context: context, width: width, height: height, backgroundcolor: backgroundColor, borderColor: borderColor),
      child: Align(alignment: Alignment.center,child: child),
    );
  }
}
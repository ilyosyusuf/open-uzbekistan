import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';

class MyTextField {
  static textField({
    required String text,
    IconButton? iconButton,
    required TextEditingController controller,
    Widget? prefixIcon,
    bool read = false,
    var onChanged,
    VoidCallback? onTap,
    FormFieldValidator<String>? validator,
    bool isShown = false,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
  }) {
    return TextFormField(
        controller: controller,
        readOnly: read,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: isShown,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        decoration: InputDecoration(
          
          hintText: text,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: iconButton,
          prefixIcon: prefixIcon,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: ColorConst.blackfortext),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: ColorConst.blackfortext),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: ColorConst.blackfortext),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: ColorConst.blackfortext),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        validator: validator);
  }
}

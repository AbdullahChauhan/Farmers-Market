import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market/app/styles/text.dart';

abstract class TextFieldStyles {
  static double get textBoxHorizontal => BaseStyles.listFieldHorizontal;
  static double get textBoxVertical => BaseStyles.listFieldVertical;
  static TextStyle get body => TextStyles.body;
  static TextStyle get placeholder => TextStyles.suggestion;
  static Color get cursorColor => AppColors.darkBlue;

  static Widget iconPrefix(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(
        icon, 
        size: 32.0,
        color: AppColors.lightBlue,
      ),
    );
  }

  static BoxDecoration get cupertinoDecoration => BoxDecoration(
          border:
              Border.all(color: AppColors.straw, width: BaseStyles.borderWidth),
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
        );

  static BoxDecoration get cupertinoErrorDecoration => BoxDecoration(
          border:
              Border.all(color: AppColors.red, width: BaseStyles.borderWidth),
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
        );

  static InputDecoration materialDecoration(String hintText, IconData icon, String errorText, Function togglePasswordVisibility, bool isPasswordHidden) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(8.0),
      hintText: hintText,
      hintStyle: TextFieldStyles.placeholder,
      border: InputBorder.none,
      errorText: errorText,
      errorStyle: TextStyles.error,
      suffixIcon: hintText == "Password" ? IconButton(
          onPressed: togglePasswordVisibility,
          icon: isPasswordHidden ? Icon(Icons.visibility_off, color: AppColors.lightBlue,) : Icon(Icons.visibility, color: AppColors.lightBlue,),
        ) : null,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.straw, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.straw, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      prefixIcon: iconPrefix(icon)
    ); 
  }
}
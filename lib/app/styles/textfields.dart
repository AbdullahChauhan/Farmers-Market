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

  static Widget iconPrefix(IconData icon) => BaseStyles.iconPrefix(icon);

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

  static InputDecoration materialDecoration(String hintText, IconData icon, String errorText, Widget togglePasswordButton) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(8.0),
      hintText: hintText,
      hintStyle: TextFieldStyles.placeholder,
      border: InputBorder.none,
      errorText: errorText,
      errorStyle: TextStyles.error,
      suffixIcon: togglePasswordButton,
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
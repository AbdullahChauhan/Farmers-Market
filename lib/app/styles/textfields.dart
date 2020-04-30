import 'package:farmers_market/app/styles/base.dart';
import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:farmers_market/app/styles/text.dart';

abstract class TextFieldStyles {
  static double get textBoxHorizontal => 24.0;
  static double get textBoxVertical => 8.0;
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
}
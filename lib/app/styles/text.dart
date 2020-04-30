import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get body => TextStyle(
    fontSize: 16.0,
    color: AppColors.darkGray,
  );

  static TextStyle get suggestion => TextStyle(
    fontSize: 14.0,
    color: AppColors.lightGray,
  );
}
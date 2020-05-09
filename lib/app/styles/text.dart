import 'package:farmers_market/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get body => GoogleFonts.inter(
    textStyle: TextStyle(
      color: AppColors.darkGray,
      fontSize: 16.0
    )
  );

  static TextStyle get suggestion => GoogleFonts.inter(
    textStyle: TextStyle(
      color: AppColors.lightGray,
      fontSize: 14.0
    )
  );

  static TextStyle get link => GoogleFonts.inter(
    textStyle: TextStyle(
      color: AppColors.straw,
      fontSize: 16.0,
      fontWeight: FontWeight.w500
    )
  );

  static TextStyle get error => GoogleFonts.inter(
    textStyle: TextStyle(
      color: AppColors.red,
      fontSize: 12.0,
      fontWeight: FontWeight.w500
    )
  );

  static TextStyle get buttonTextLight => GoogleFonts.inter(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w500
    )
  );
}
import 'package:flutter/material.dart';

abstract class BaseStyles {
  static double get borderRadius => 24.0;
  static double get borderWidth => 2.0;
  static double get listFieldHorizontal => 24.0;
  static double get listFieldVertical => 8.0;

  static EdgeInsets get listPadding => EdgeInsets.symmetric(
      horizontal: listFieldHorizontal, vertical: listFieldVertical);
}

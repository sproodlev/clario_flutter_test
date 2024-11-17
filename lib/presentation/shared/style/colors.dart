import 'package:flutter/material.dart';

abstract class CtColors {
  static const Color darkBlue = Color(0xFF4A4E71);
  static Color darkBlue70 = darkBlue.withOpacity(0.7);
  static Color darkBlue20 = darkBlue.withOpacity(0.2);
  static Color darkBlue10 = darkBlue.withOpacity(0.1);

  static const Color green = Color(0xFF27B274);
  static Color green10 = green.withOpacity(0.1);

  static const Color red = Color(0xFFFF8080);
  static Color red10 = red.withOpacity(0.1);

  // button gradient
  static const Color lightBlue = Color(0xFF70C3FF);
  static const Color purpleBlue = Color(0xFF4B65FF);

  // button text
  static const Color white = Color(0xFFFFFFFF);

  // background gradient
  static const Color skyBlue1 = Color(0xFFF4F9FF);
  static const Color skyBlue2 = Color(0xFFE0EDFB);

  static const Color transparent = Colors.transparent;
}

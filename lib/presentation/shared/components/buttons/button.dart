import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/shared/style/colors.dart';

class CtButton extends StatelessWidget {
  final double width;
  final void Function() onPressed;
  final Widget text;

  const CtButton({
    required this.width,
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 48.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0.r),
          gradient: LinearGradient(
            colors: [CtColors.lightBlue, CtColors.purpleBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            transform: GradientRotation(30 * pi / 180),
          ),
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}

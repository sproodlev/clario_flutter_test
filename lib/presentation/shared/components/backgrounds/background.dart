import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/shared/style/colors.dart';

class CtBackground extends StatelessWidget {
  const CtBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [CtColors.skyBlue1, CtColors.skyBlue2],
          transform: GradientRotation(-12.04 * pi / 180),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 57.h,
          bottom: 36.72.h,
          left: 70.0.w,
          right: 55.72.w,
        ),
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Image.asset('assets/images/stars.png'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/auth/auth_page.dart';

// Ct stands for Clario Test and will be used as a prefix for some classes in this project
class CtApp extends StatelessWidget {
  const CtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: child,
        );
      },
      child: AuthPage(),
    );
  }
}

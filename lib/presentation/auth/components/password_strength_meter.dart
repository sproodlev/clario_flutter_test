import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/auth/components/password_strength_param_state.dart';
import 'package:fluttertest/presentation/shared/style/text_styles.dart';
import 'package:fluttertest/util/intl/strings.dart';

class PasswordStrengthMeter extends StatelessWidget {
  final PasswordStrengthParamState min8CharactersAndNoSpaces;
  final PasswordStrengthParamState uppercaseAndLowercase;
  final PasswordStrengthParamState atLeast1Digit;

  const PasswordStrengthMeter({
    required this.min8CharactersAndNoSpaces,
    required this.uppercaseAndLowercase,
    required this.atLeast1Digit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CtStrings.min8CharactersAndNoSpaces,
          style: CtTextStyles.s13w400.copyWith(color: min8CharactersAndNoSpaces.toColor()),
        ),
        SizedBox(height: 4.0.h),
        Text(
          CtStrings.uppercaseAndLowercase,
          style: CtTextStyles.s13w400.copyWith(color: uppercaseAndLowercase.toColor()),
        ),
        SizedBox(height: 4.0.h),
        Text(
          CtStrings.atLeast1Digit,
          style: CtTextStyles.s13w400.copyWith(color: atLeast1Digit.toColor()),
        )
      ],
    );
  }
}

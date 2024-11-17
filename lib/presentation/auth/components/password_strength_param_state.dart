import 'package:flutter/material.dart';
import 'package:fluttertest/presentation/shared/style/colors.dart';

enum PasswordStrengthParamState { initial, fail, success }

extension PassStrengthParamStateToColor on PasswordStrengthParamState {
  Color toColor() {
    switch (this) {
      case PasswordStrengthParamState.fail:
        return CtColors.red;
      case PasswordStrengthParamState.success:
        return CtColors.green;
      default:
        return CtColors.darkBlue;
    }
  }
}

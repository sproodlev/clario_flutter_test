import 'package:flutter/material.dart';
import 'package:fluttertest/presentation/shared/style/colors.dart';

enum CtTextFieldState { initial, error, success }

extension CtTextFieldColors on CtTextFieldState {
  Color toFillColor() {
    switch (this) {
      case CtTextFieldState.error:
        return CtColors.red10;
      case CtTextFieldState.success:
        return CtColors.green10;
      default:
        return CtColors.white;
    }
  }

  Color toBorderColor() {
    switch (this) {
      case CtTextFieldState.success:
        return CtColors.green;
      default:
        return CtColors.darkBlue20;
    }
  }

  Color toInputColor() {
    switch (this) {
      case CtTextFieldState.success:
        return CtColors.green;
      case CtTextFieldState.error:
        return CtColors.red;
      default:
        return CtColors.darkBlue;
    }
  }
}

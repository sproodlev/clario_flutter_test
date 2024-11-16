import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_state.dart';
import 'package:fluttertest/presentation/shared/style/colors.dart';
import 'package:fluttertest/presentation/shared/style/text_styles.dart';

class CtTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final int maxLength;

  /// is responsible for errorText and errorBorderColor
  final String? errorText;

  /// is responsible for fillColor, and enabledBorderColor on success
  final CtTextFieldState state;

  const CtTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.maxLength,
    required this.errorText,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 10.r;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: CtTextStyles.s16w400darkBlue.copyWith(color: state.toInputColor()),
      maxLength: maxLength,
      maxLines: 1,
      //
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 20.w),
        counterText: '',
        // hint
        hintText: hintText,
        hintStyle: CtTextStyles.s16w400darkBlue70,
        // fill
        filled: true,
        fillColor: state.toFillColor(),
        // error
        errorStyle: CtTextStyles.s13w400red,
        errorText: errorText,
        // borders
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1.r,
            color: CtColors.darkBlue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1.r,
            color: state.toBorderColor(),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1.r,
            color: CtColors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1.r,
            color: CtColors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1.r,
            color: CtColors.darkBlue20,
          ),
        ),
      ),
    );
  }
}

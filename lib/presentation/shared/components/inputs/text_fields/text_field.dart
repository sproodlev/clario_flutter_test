import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_state.dart';
import 'package:fluttertest/presentation/shared/style/colors.dart';
import 'package:fluttertest/presentation/shared/style/text_styles.dart';

class CtTextField extends StatelessWidget {
  final void Function(String value)? onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final int maxLength;

  /// To trigger errorBorder and show errorText set [errorText] = 'errorText' and [showError] = true.
  /// To trigger errorBorder only set [errorText] = null and [showError] = true.
  /// To remove errorBorder set [showError] = false.
  final String? errorText;

  /// To trigger errorBorder and show errorText set [errorText] = 'errorText' and [showError] = true.
  /// To trigger only errorBorder set [errorText] = null and [showError] = true.
  /// To remove errorBorder set [showError] = false.
  final bool showError;

  /// maxWidth constraint of icon container
  final double? maxSuffixIconWidth;
  final Widget? suffixIcon;

  final bool obscure;

  /// is responsible for fillColor, and enabledBorderColor on success
  final CtTextFieldState state;

  const CtTextField({
    this.onChanged,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.maxLength,
    required this.errorText,
    required this.showError,
    this.maxSuffixIconWidth,
    this.suffixIcon,
    this.obscure = false,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 10.r;

    return TextField(
      onChanged: onChanged != null ? (value) => onChanged!(value) : (_) {},
      controller: controller,
      focusNode: focusNode,
      style: CtTextStyles.s16w400.copyWith(color: state.toInputColor()),
      maxLength: maxLength,
      maxLines: 1,
      obscureText: obscure,
      obscuringCharacter: '•',
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
        errorText: showError && errorText != null ? errorText : null,
        // put empty SizedBox to trigger error border without errorText
        error: showError && errorText == null ? SizedBox() : null,
        suffixIcon: suffixIcon,
        suffixIconConstraints: maxSuffixIconWidth != null ? BoxConstraints(maxWidth: maxSuffixIconWidth!) : null,
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

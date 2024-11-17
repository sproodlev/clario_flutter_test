import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_state.dart';

class PasswordFieldSuffix extends StatelessWidget {
  final bool obscure;
  final void Function() onTap;
  final CtTextFieldState state;

  const PasswordFieldSuffix({
    required this.obscure,
    required this.onTap,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 10.w),
        child: Transform.flip(
          flipY: true,
          child: Icon(
            obscure ? Icons.visibility_off_sharp : Icons.visibility_sharp,
            color: state.toHintColor(),
            size: 24.r,
          ),
        ),
      ),
    );
  }
}

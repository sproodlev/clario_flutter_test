import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/presentation/auth_page/components/auth_background.dart';
import 'package:fluttertest/presentation/auth_page/components/password_field_suffix.dart';
import 'package:fluttertest/presentation/auth_page/components/password_strength.dart';
import 'package:fluttertest/presentation/auth_page/components/password_strength_meter.dart';
import 'package:fluttertest/presentation/auth_page/components/password_strength_param_state.dart';
import 'package:fluttertest/presentation/shared/components/buttons/button.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_state.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_validator.dart';
import 'package:fluttertest/presentation/shared/style/text_styles.dart';
import 'package:fluttertest/utils/extensions/bool/to_password_strg_param_st_ext.dart';
import 'package:fluttertest/utils/intl/strings.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  // Email
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  String? emailErrorText;
  CtTextFieldState emailFieldState = CtTextFieldState.initial;

  // Password
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  PasswordStrengthParamState min8CharactersAndNoSpaces = PasswordStrengthParamState.initial;
  PasswordStrengthParamState uppercaseAndLowercase = PasswordStrengthParamState.initial;
  PasswordStrengthParamState atLeast1Digit = PasswordStrengthParamState.initial;
  bool passwordError = false;
  CtTextFieldState passwordFieldState = CtTextFieldState.initial;
  bool passwordObscureBool = true;

  @override
  void initState() {
    super.initState();
    //
    emailFocusNode.addListener(() {
      setState(() {
        if (emailFocusNode.hasFocus) {
          emailErrorText = null;
          emailFieldState = CtTextFieldState.initial;
        }
      });
    });
    //
    passwordFocusNode.addListener(() {
      setState(() {
        if (passwordFocusNode.hasFocus) {
          passwordError = false;
          passwordFieldState = CtTextFieldState.initial;
        }
      });
    });
  }

  bool validateEmailOnSubmit(String value) {
    final String? emailValidationResult = CtTextFieldValidator.email(value, obligatoryFlag: true);

    if (emailValidationResult != null) {
      setState(() {
        emailErrorText = emailValidationResult;
        emailFieldState = CtTextFieldState.error;
      });
      return false;
    } else {
      setState(() {
        emailErrorText = null;
        emailFieldState = CtTextFieldState.success;
      });
      return true;
    }
  }

  PasswordStrength validatePasswordOnChange(String value) {
    final PasswordStrength passwordValidationResult = CtTextFieldValidator.password(value, obligatoryFlag: true);

    setState(() {
      min8CharactersAndNoSpaces = passwordValidationResult.min8CharactersAndNoSpaces.toPasswordStrengthParamState();
      uppercaseAndLowercase = passwordValidationResult.uppercaseAndLowercase.toPasswordStrengthParamState();
      atLeast1Digit = passwordValidationResult.atLeast1Digit.toPasswordStrengthParamState();
    });

    return passwordValidationResult;
  }

  bool validatePasswordOnSubmit(String value) {
    final bool passwordValid = validatePasswordOnChange(value).enough;
    if (passwordValid) {
      setState(() {
        passwordError = false;
        passwordFieldState = CtTextFieldState.success;
      });
      return true;
    } else {
      setState(() {
        passwordError = true;
        passwordFieldState = CtTextFieldState.error;
      });
      return false;
    }
  }

  bool validateFields({required String email, required String password}) {
    final bool emailValid = validateEmailOnSubmit(email);
    final passwordValid = validatePasswordOnSubmit(password);
    return emailValid && passwordValid;
  }

  GlobalKey testKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            AuthViewBackground(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Column(
                children: [
                  // Flexible top spacing to enable moving of below widgets up, when keyboard shows up.
                  // MediaQuery.of(context).viewInsets.bottom -- growing and shrinking keyboard height
                  // 812.h -- screen height, 439.h -- height of fixed height elements, 138.h -- distance from title to top by design
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    height: MediaQuery.of(context).viewInsets.bottom > 0
                        ? min(max(0, 812.h - MediaQuery.of(context).viewInsets.bottom - 439.h), 138.h)
                        : 138.h,
                  ),
                  Text(CtStrings.title, style: CtTextStyles.s28w700darkBlue),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 88.h,
                    child: CtTextField(
                      focusNode: emailFocusNode,
                      controller: emailController,
                      hintText: CtStrings.emailHint,
                      state: emailFieldState,
                      showError: emailErrorText != null,
                      errorText: emailErrorText,
                      maxLength: 64,
                    ),
                  ),
                  CtTextField(
                    onChanged: (value) {
                      validatePasswordOnChange(value);
                    },
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    hintText: CtStrings.passwordHint,
                    state: passwordFieldState,
                    showError: passwordError,
                    errorText: null,
                    maxLength: 64,
                    maxSuffixIconWidth: 100.w,
                    obscure: passwordObscureBool,
                    suffixIcon: PasswordFieldSuffix(
                      onTap: () {
                        setState(() {
                          if (passwordObscureBool) {
                            passwordObscureBool = false;
                            return;
                          }
                          if (!passwordObscureBool) passwordObscureBool = true;
                        });
                      },
                      obscure: passwordObscureBool,
                      state: passwordFieldState,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      PasswordStrengthMeter(
                        min8CharactersAndNoSpaces: min8CharactersAndNoSpaces,
                        uppercaseAndLowercase: uppercaseAndLowercase,
                        atLeast1Digit: atLeast1Digit,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {},
                    child: CtButton(
                      width: 240.w,
                      text: CtStrings.authButton,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        bool valid = validateFields(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        if (valid)
                          context.read<AuthCubit>().authenticate(emailController.text, passwordController.text);
                      },
                    ),
                  ),
                  SizedBox(height: 29.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fluttertest/presentation/auth_page/components/password_strength_param_state.dart';

extension ToPasswordStrgParamStExt on bool {
  PasswordStrengthParamState toPasswordStrengthParamState() {
    switch (this) {
      case false:
        return PasswordStrengthParamState.fail;
      case true:
        return PasswordStrengthParamState.success;
    }
  }
}

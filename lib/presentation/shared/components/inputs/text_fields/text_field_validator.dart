import 'package:fluttertest/presentation/auth_page/components/password_strength.dart';
import 'package:fluttertest/utils/extensions/string/email_validator_ext.dart';
import 'package:fluttertest/utils/intl/strings.dart';

abstract class CtTextFieldValidator {
  /// Returns errorText or null if valid
  static String? obligatory(String value) {
    String trimmedValue = value.trim();

    if (trimmedValue.isEmpty) return CtStrings.obligatoryErrorText;
    return null;
  }

  /// Returns errorText or null if valid
  static String? email(String value, {bool obligatoryFlag = false}) {
    String trimmedValue = value.trim();

    if (obligatoryFlag) {
      String? obligatoryErrorText = obligatory(trimmedValue);
      if (obligatoryErrorText != null) return obligatoryErrorText;
    }

    if (!trimmedValue.isValidEmail()) return CtStrings.invalidEmailErrorText;

    return null;
  }

  /// Returns PasswordStrength
  static PasswordStrength password(String value, {bool obligatoryFlag = false}) {
    String trimmedValue = value.trim();

    if (obligatoryFlag) {
      String? obligatoryErrorText = obligatory(trimmedValue);
      if (obligatoryErrorText != null) {
        return PasswordStrength(
          min8CharactersAndNoSpaces: false,
          uppercaseAndLowercase: false,
          atLeast1Digit: false,
        );
      }
    }

    bool noSpaces = !trimmedValue.contains(' ');
    bool min8Characters = trimmedValue.length >= 8;
    bool uppercaseLetter = trimmedValue.contains(RegExp(r'[A-Z]'));
    bool lowercaseLetter = trimmedValue.contains(RegExp(r'[a-z]'));
    bool atLeast1Digit = trimmedValue.contains(RegExp(r'[0-9]'));

    return PasswordStrength(
      min8CharactersAndNoSpaces: noSpaces && min8Characters,
      uppercaseAndLowercase: uppercaseLetter && lowercaseLetter,
      atLeast1Digit: atLeast1Digit,
    );
  }
}

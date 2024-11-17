import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_validator.dart';
import 'package:fluttertest/util/intl/strings.dart';

void main() {
  group('TextFieldValidator.', () {
    test('Email.', () {
      // valid inputs
      expect(CtTextFieldValidator.email('test@example.com'), null);
      expect(CtTextFieldValidator.email('john.doe@gmail.com'), null);
      expect(CtTextFieldValidator.email('user@mail.example.com'), null);
      expect(CtTextFieldValidator.email('USER@DOMAIN.COM'), null);
      expect(CtTextFieldValidator.email('user123@example.com'), null);
      expect(CtTextFieldValidator.email('user.name+tag+sorting@example.com'), null);
      expect(CtTextFieldValidator.email('user_name@example.com'), null);
      expect(CtTextFieldValidator.email('user-name@example.com'), null);
      expect(CtTextFieldValidator.email('user@domain.co.uk'), null);
      expect(CtTextFieldValidator.email('user@domain.cn'), null);

      // invalid inputs
      expect(CtTextFieldValidator.email('userexample.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@domain'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user @example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@ example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('!#\$%&\'*+/=?^_@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('.user@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user.@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user..name@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user*name@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user&name@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user😊@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@domain.xyz123'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@domain.'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('üñîçødé@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('-user@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user-@example.com'), CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@example.com<script>alert(\'XSS\')</script>'),
          CtStrings.invalidEmailErrorText);
      expect(CtTextFieldValidator.email('user@example.com\' OR 1=1 --'), CtStrings.invalidEmailErrorText);

      // empty input
      expect(CtTextFieldValidator.email('', obligatoryFlag: true), CtStrings.obligatoryErrorText);
      expect(CtTextFieldValidator.email('    ', obligatoryFlag: true), CtStrings.obligatoryErrorText);
    });
    test('Password', () {
      // Test empty password with obligatory flag
      var result1 = CtTextFieldValidator.password('', obligatoryFlag: true);
      expect(result1.min8CharactersAndNoSpaces, false);
      expect(result1.uppercaseAndLowercase, false);
      expect(result1.atLeast1Digit, false);

      // Test empty password without obligatory flag
      var result2 = CtTextFieldValidator.password('');
      expect(result2.min8CharactersAndNoSpaces, false);
      expect(result2.uppercaseAndLowercase, false);
      expect(result2.atLeast1Digit, false);

      // Test password with spaces
      var result3 = CtTextFieldValidator.password('Pass word1');
      expect(result3.min8CharactersAndNoSpaces, false);
      expect(result3.uppercaseAndLowercase, true);
      expect(result3.atLeast1Digit, true);

      // Test password shorter than 8 characters
      var result4 = CtTextFieldValidator.password('Pass1');
      expect(result4.min8CharactersAndNoSpaces, false);
      expect(result4.uppercaseAndLowercase, true);
      expect(result4.atLeast1Digit, true);

      // Test password without uppercase
      var result5 = CtTextFieldValidator.password('password123');
      expect(result5.min8CharactersAndNoSpaces, true);
      expect(result5.uppercaseAndLowercase, false);
      expect(result5.atLeast1Digit, true);

      // Test password without lowercase
      var result6 = CtTextFieldValidator.password('PASSWORD123');
      expect(result6.min8CharactersAndNoSpaces, true);
      expect(result6.uppercaseAndLowercase, false);
      expect(result6.atLeast1Digit, true);

      // Test password without digits
      var result7 = CtTextFieldValidator.password('PasswordTest');
      expect(result7.min8CharactersAndNoSpaces, true);
      expect(result7.uppercaseAndLowercase, true);
      expect(result7.atLeast1Digit, false);

      // Test valid password meeting all criteria
      var result8 = CtTextFieldValidator.password('Password123');
      expect(result8.min8CharactersAndNoSpaces, true);
      expect(result8.uppercaseAndLowercase, true);
      expect(result8.atLeast1Digit, true);

      // Test password with leading/trailing spaces
      var result9 = CtTextFieldValidator.password(' Password123 ');
      expect(result9.min8CharactersAndNoSpaces, true);
      expect(result9.uppercaseAndLowercase, true);
      expect(result9.atLeast1Digit, true);
    });
  });
}

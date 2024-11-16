import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/presentation/shared/components/inputs/text_fields/text_field_validator.dart';
import 'package:fluttertest/utils/intl/strings.dart';

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
  });
}

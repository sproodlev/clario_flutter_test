/// All strings are here in one place for now, to make it easier to add internationalization later.
abstract class CtStrings {
  // Auth page
  static const String title = 'Sign up';
  static const String emailHint = 'Enter your email';
  static const String passwordHint = 'Create your password';
  static const String authButton = 'Sign up';

  // Validation error text
  static const String obligatoryErrorText = 'Cannot be empty';
  static const String invalidEmailErrorText = 'Invalid Email';

  // Password strength meter
  static const String min8CharactersAndNoSpaces = '8 characters or more (no spaces)';
  static const String uppercaseAndLowercase = 'Uppercase and lowercase letters';
  static const String atLeast1Digit = 'At least one digit';
}

class PasswordStrength {
  final bool min8CharactersAndNoSpaces;
  final bool uppercaseAndLowercase;
  final bool atLeast1Digit;

  const PasswordStrength({
    required this.min8CharactersAndNoSpaces,
    required this.uppercaseAndLowercase,
    required this.atLeast1Digit,
  });

  bool get enough {
    return min8CharactersAndNoSpaces && uppercaseAndLowercase && atLeast1Digit;
  }
}

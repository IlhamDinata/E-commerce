class ValidationInput {
  static bool isEmailValid(String value) {
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // static bool isPhoneValid(String value) {
  //   String pattern =
  //       r'(^(+62|62)?[\s-]?0?8[1-9]{1}\d{1}[\s-]?\d{4}[\s-]?\d{2,5}$)';
  //   RegExp regExp = RegExp(pattern);

  //   return regExp.hasMatch(value);
  // }

  static bool validationInputNotEmpty(String text) {
    return text.isNotEmpty;
  }

  static bool isConfirmPasswordMatch(String password, String confirmPassword) {
    return confirmPassword == password;
  }
}

class Common {
  /// validator for email
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be blank';
    }
    String regex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+';
    RegExp regExp = RegExp(regex);

    if (regExp.hasMatch(value)) {
      return null;
    }

    return 'Invalid email address';
  }

  /// validator for empty field
  static String? validateFormField(String value) {
    if (value.trim().isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  /// validator for name field
  static String? validateNameField(String value) {
    if (value.trim().isEmpty) {
      return 'Name cannot be empty.';
    }
    return null;
  }
}

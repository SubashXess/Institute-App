class FormValidators {
  static String? nameValidation(String value) {
    // String pattern =
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    // RegExp regExp = RegExp(pattern);
    bool hasSpecialCharacters = value.contains(RegExp(r"^[a-zA-Z\s]+$"));
    bool hasNumber = value.contains(RegExp(r"^[a-zA-Z0-9]+$"));

    if (value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 4) {
      return 'Please enter valid name';
    } else if (!hasSpecialCharacters) {
      if (hasNumber) {
        return 'Number are not allowed';
      }
      return 'Special Characters are not allowed';
    }
    return null;
  }

  static String? emailValidation(String value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is required';
    } else if (value.contains(' ')) {
      return 'Spaces are not allowed';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  static String? passwordValidation(String value) {
    // String pattern =
    //     r"^(?=[^A-Z\n]*[A-Z])(?=[^a-z\n]*[a-z])(?=[^0-9\n]*[0-9])(?=[^#?!@$%^&*\n-]*[#?!@$%^&*-]).{8,}$";
    // RegExp regExp = RegExp(pattern);
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    // bool hasSpecialCharacters =
    //     value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.contains(' ')) {
      return 'Spaces are not allowed';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!hasLowercase) {
      return 'Contains at least one lowercase letter';
    } else if (!hasUppercase) {
      return 'Contains at least one uppercase letter';
    }
    return null;
  }
}

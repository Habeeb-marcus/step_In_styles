bool emailRegExMatch(String emailText) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailText);
}

bool usernameRegExMatch(String userName) {
  return RegExp(r"^[a-zA-Z0-9_s]{2,30}$").hasMatch(userName);
}

bool phoneRegExMatch(String phoneNumber) {
  if (phoneNumber.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

final _emailMaskRegExp = RegExp('^(.)(.*?)([^@]?)(?=@[^@]+\$)');
String maskEmail(String input, [int minFill = 4, String fillChar = '*']) {
  return input.replaceFirstMapped(_emailMaskRegExp, (m) {
    var start = m.group(1);
    var middle = fillChar * 5;
    var end = m.groupCount >= 3 ? m.group(3) : start;
    return (start ?? "") + middle + (end ?? "");
  });
}

String? emailVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Please enter your email';
  } else if (emailRegExMatch(val ?? "")) {
    return null;
  } else {
    return 'Enter a valid email';
  }
}

// name validator function name must not be empty and lesser than 5 characters
String? nameVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Please enter your name';
  } else if ((val?.length ?? 0) < 5) {
    return 'Name is not up to 5 characters';
  } else {
    return null;
  }
}

String? usernameVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Kindly enter valid username characters';
  } else if (usernameRegExMatch(val ?? "")) {
    return null;
  } else {
    return 'Enter a valid username';
  }
}

String? passwordVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Please enter your password';
  } else if ((val?.length ?? 0) < 6) {
    return 'Password is not up to 6 characters';
  } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(val!)) {
    // This regex checks for at least one uppercase and one lowercase letter
    return 'Password must contain at least one uppercase, \n one lowercase letter and a number';
  } else {
    return null;
  }
}


String? phoneVal(String? val) {
  if (val?.isEmpty ?? true) {
    return 'Please enter your phone number';
  } else if (phoneRegExMatch(val ?? "")) {
    return null;
  } else if ((val ?? "").length < 9) {
    return "Phone number is not complete";
  } else {
    return 'Enter a valid phone number';
  }
}

String phoneMask(String phoneNumber) {
  return phoneNumber.length > 8
      ? "${phoneNumber.substring(0, 4)} *** ${phoneNumber.substring(phoneNumber.length - 4, phoneNumber.length)}"
      : "";
}

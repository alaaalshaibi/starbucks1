part of '../import/app_import.dart';

class AppValidators {
  // * message
  static final _messageEnterValue = KeyLang.enterValue.tr();
  static final _messageCorrectEmail = KeyLang.errorEmail.tr();
  static final _messageCorrectPass = KeyLang.errorPass.tr();
  static final _messageCorrectCPass = KeyLang.errorConfirmPass.tr();

  // * Email
  static String? isEmail(String? value) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isEmail(valueTrim!)) {
      return _messageCorrectEmail;
    }
    return null;
  }

  // * pass
  static String? isPass(String? value) {
    final String? valueTrim = value?.trim();

    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(valueTrim!, 6)) {
      return _messageCorrectPass;
    }
    return null;
  }

  // * equal Pass
  static String? isEqualPass(String? value, String pass) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.equals(value, pass.trim())) {
      return _messageCorrectCPass;
    }

    return null;
  }
}

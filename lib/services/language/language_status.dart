part of '../import/app_import.dart';

class AppLang {
  /// * get language code
  /// currentLocale ~> ar-EG
  /// languageCode ~> ar
  /// default en
  static String currentLang(BuildContext context) =>
      EasyLocalization.of(context)?.currentLocale?.languageCode ?? 'en';

  static bool isAr(BuildContext context) =>
      EasyLocalization.of(context)?.currentLocale?.languageCode == 'ar';
}

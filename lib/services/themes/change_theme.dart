part of '../import/app_import.dart';

class ThemeChange extends ChangeNotifier {
  bool isDark = false;

  set updateTheme(bool value) {
    isDark = value;
    notifyListeners();
  }

  ThemeMode get themeModel => isDark ? ThemeMode.dark : ThemeMode.light;

  void updateThemeShared() async {
    if (isDark != await getTheme) {
      isDark = await getTheme;
      notifyListeners();
    }
  }
  // * shared_preferences

  final String _keyTheme = 'Key_Theme';
  // * set
  Future<void> setTheme({required bool value}) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool(_keyTheme, value);
  }

  // * get
  Future<bool> get getTheme async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final bool? theme = sharedPref.getBool(_keyTheme);
    return theme ?? false;
  }
}

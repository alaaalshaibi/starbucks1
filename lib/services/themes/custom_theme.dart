part of '../import/app_import.dart';

/// Doc : https://api.flutter.dev/flutter/material/TextTheme-class.html
class CustomTheme {
  // * Change Font Lang
  static final String? _enFont = GoogleFonts.aBeeZee().fontFamily;
  static final String? _arFont = GoogleFonts.cairo().fontFamily;

  // * font family lang
  static String? fontFamily(BuildContext context) =>
      AppLang.isAr(context) ? _arFont : _enFont;

  // * style appBar
  static TextStyle styleAppBar = TextStyle(
    color: AppColors.bgWhite,
    fontSize: (Dimen.xlg / 1.4).sm,
  );
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *
  static ThemeData lightTheme(BuildContext context) {
    // * handle font app
    String? fontApp = fontFamily(context);

    return ThemeData.light().copyWith(
      colorScheme:
          ThemeData().colorScheme.copyWith(primary: AppColors.bgGreenBold),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: AppColors.bgGreenBold),
        centerTitle: true,
        elevation: 10,
        titleTextStyle: styleAppBar.copyWith(
          color: AppColors.bgBlack,
          fontFamily: fontApp,
        ),
      ),

      /// displayColor ~>  headline4, headline3, headline2, headline1, and caption
      /// bodyColor  ~> is applied to the remaining text styles.
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
            fontFamily: fontApp,
          ),
    );
  }

  // * * * * * * * * * * * * *** Dark *** * * * * * * * * * * * *
  static ThemeData darkTheme(BuildContext context) {
    // * handle font app
    String? fontApp = fontFamily(context);
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.bgWhite),
        centerTitle: true,
        elevation: 10,
        titleTextStyle: styleAppBar.copyWith(fontFamily: fontApp),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
            fontFamily: fontApp,
          ),
    );
  }
}

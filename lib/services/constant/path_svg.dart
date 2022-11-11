part of '../import/app_import.dart';

class PathSvg {
  static double xlg = (Dimen.xlg / 1.2);
  static final SvgPicture dTranslate = SvgPicture.asset(
    PathIcons.language,
    width: xlg.w,
    height: xlg.h,
  );
  static final SvgPicture dTheme = SvgPicture.asset(
    PathIcons.theme,
    width: xlg.w,
    height: xlg.h,
  );
  static final SvgPicture dlogout = SvgPicture.asset(
    PathIcons.logout,
    width: xlg.w,
    height: xlg.h,
  );
}

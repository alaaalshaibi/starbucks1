part of '../import/app_import.dart';

class AppRoute {
  static Map<String, WidgetBuilder> route = {
    PageHome.id: (context) => const PageHome(),
    PageSplash.id: (context) => const PageSplash(),
    PageLogin.id: (context) => const PageLogin(),
    PageRegister.id: (context) => const PageRegister(),
    PageForgot.id: (context) => const PageForgot(),
    PageOrder.id: (context) => const PageOrder(),
    Wrapper.id: (context) => const Wrapper(),
  };
}

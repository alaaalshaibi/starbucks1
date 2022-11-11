part of './services/import/app_import.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<FirebaseApp> _firebaseApp;

  @override
  void initState() {
    super.initState();
    _firebaseApp = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return RestartApp(
      child: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ConfigMaterial(child: LoadingPage());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => AuthService()),
                    ChangeNotifierProvider(create: (context) => ThemeChange()),
                    ChangeNotifierProvider(
                        create: (context) => ManageStateCoffee()),
                    ChangeNotifierProvider(
                        create: (context) => ManageStateIngredients()),
                    ChangeNotifierProvider(create: (context) => OrderService()),
                  ],
                  child: Builder(
                    builder: (context) {
                      final ThemeChange _theme =
                          Provider.of<ThemeChange>(context);
                      _theme.updateThemeShared();
                      return ScreenUtilInit(
                        designSize: const Size(360, 690),
                        builder: () => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: 'Starbucks',
                          theme: CustomTheme.lightTheme(context),
                          darkTheme: CustomTheme.darkTheme(context),
                          themeMode: _theme.themeModel,
                          localizationsDelegates: context.localizationDelegates,
                          supportedLocales: context.supportedLocales,
                          locale: context.locale,
                          initialRoute: PageSplash.id,
                          routes: AppRoute.route,
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const ConfigMaterial(
                  child: ErrorText(titleError: KeyLang.errorNoData),
                );
              }
            } else {
              return const ConfigMaterial(
                child: ErrorText(titleError: KeyLang.errorInitFirebase),
              );
            }
          }),
    );
  }
}

part of '../../../../services/import/app_import.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({Key? key}) : super(key: key);
  static const String id = 'PageSplash';

  @override
  _PageSplashState createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    super.initState();
    developer.log('splash');
    Timer(const Duration(milliseconds: 2000), () {
      if (mounted) Navigator.pushReplacementNamed(context, Wrapper.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage(PathImages.logo),
          width: Dimen.fullScreen.sw,
        ),
      ),
    );
  }
}

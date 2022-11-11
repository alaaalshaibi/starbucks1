part of '../../../../services/import/app_import.dart';

class Wrapper extends StatelessWidget {
  static const String id = 'Wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        }

        return snapshot.hasData ? const PageHome() : const PageLogin();
      },
    );
  }
}

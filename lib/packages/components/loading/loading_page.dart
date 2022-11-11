part of '../../../services/import/app_import.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLoading(chooseLoading: ChooseLoading.page),
      ),
    );
  }
}

part of '../../../../services/import/app_import.dart';

class PageHome extends StatelessWidget {
  static const String id = 'PageHome';
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarHome(),
      drawer: BodyDrawer(),
      body: ViewOrder(),
      floatingActionButton: FloatingBtn(),
    );
  }
}

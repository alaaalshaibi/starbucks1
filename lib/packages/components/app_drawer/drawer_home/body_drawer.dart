part of '../../../../services/import/app_import.dart';

class BodyDrawer extends StatelessWidget {
  const BodyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          // * Header
          HeaderDrawer(),
          // * Settings
          SettingDrawer()
        ],
      ),
    );
  }
}

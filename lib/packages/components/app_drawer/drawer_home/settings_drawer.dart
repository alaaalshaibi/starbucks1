part of '../../../../services/import/app_import.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = Provider.of<AuthService>(context);
    final ThemeChange _theme = Provider.of<ThemeChange>(context);
    return Column(
      children: [
        // * Language
        ListTileDrawer(
          title: KeyLang.language,
          icon: PathSvg.dTranslate,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const AlertLang(),
            );
          },
        ),

        //  * Theme
        ListTileDrawer(
          title: AppTheme.stateTheme(context),
          icon: PathSvg.dTheme,
          onTap: () {},
          trailing: Switch(
            value: _theme.isDark,
            onChanged: (value) {
              _theme.updateTheme = value;
              _theme.setTheme(value: value);
            },
          ),
        ),

        // * logout
        ListTileDrawer(
          title: KeyLang.logout,
          icon: PathSvg.dlogout,
          onTap: () => _auth.signOut(),
        ),
      ],
    );
  }
}

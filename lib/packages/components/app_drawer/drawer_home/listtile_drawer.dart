part of '../../../../services/import/app_import.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    Key? key,
    required String title,
    required SvgPicture icon,
    Widget? trailing,
    void Function()? onTap,
  })  : _title = title,
        _icon = icon,
        _trailing = trailing,
        _onTap = onTap,
        super(key: key);

  final String _title;
  final SvgPicture _icon;
  final void Function()? _onTap;
  final Widget? _trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_title.tr()),
      leading: _icon,
      onTap: _onTap,
      trailing: _trailing,
    );
  }
}

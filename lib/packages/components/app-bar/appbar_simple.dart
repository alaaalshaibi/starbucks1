import 'package:flutter/material.dart';

class AppBarSimple extends StatelessWidget with PreferredSizeWidget {
  const AppBarSimple({Key? key, required String title})
      : _title = title,
        super(key: key);
  final String _title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      actions: const [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

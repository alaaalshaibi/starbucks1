part of '../../../../../../services/import/app_import.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({Key? key, String? title})
      : _title = title,
        super(key: key);
  final String? _title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _title ?? KeyLang.nameApp,
        style: GoogleFonts.pacifico(color: AppColors.bgGreenBold),
      ).tr(),
      actions: [
        Transform.scale(
          scale: 2,
          child: Padding(
            padding: EdgeInsets.all(Dimen.sm.w),
            child: const Image(
              image: AssetImage(PathImages.logo),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

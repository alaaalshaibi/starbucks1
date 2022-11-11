part of '../../../../services/import/app_import.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Row(
            children: [
              Dimen.lg.horizontalSpace,
              // *  image
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(PathImages.user),
              ),
              Dimen.lg.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * name
                    Text(
                      'Mohamed Elsayed',
                      style: GoogleFonts.pacifico(),
                    ),
                    Dimen.md.verticalSpace,
                    // * email
                    const Text(
                      'mohamed@gmail.com',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),

          // * Divider
          Divider(
            color: AppTheme.isDark(context)
                ? AppColors.bgWhite
                : AppColors.bgBlack.withOpacity(Dimen.half),
          ),
        ],
      ),
    );
  }
}

part of '../../../../services/import/app_import.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({Key? key, double? height})
      : _height = height,
        super(key: key);

  final double? _height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (_height ?? Dimen.third).sh,
      margin: EdgeInsets.symmetric(vertical: Dimen.lg.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModalRoute.of(context)?.canPop ?? false
              ? BackButton(color: AppColors.bgGreenBold)
              : Container(),
          const Spacer(),
          Transform.scale(
            scale: 1.5.w,
            child: const Image(image: AssetImage(PathImages.logo)),
          ),
          Spacer(flex: ModalRoute.of(context)?.canPop ?? false ? 2 : 1),
        ],
      ),
    );
  }
}

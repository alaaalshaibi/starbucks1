part of '../../../services/import/app_import.dart';

class AppLoading extends StatelessWidget {
  const AppLoading(
      {Key? key, required ChooseLoading chooseLoading, double? size})
      : _chooseLoading = chooseLoading,
        _size = size,
        super(key: key);

  final ChooseLoading _chooseLoading;
  final double? _size;

  @override
  Widget build(BuildContext context) {
    switch (_chooseLoading) {
      case ChooseLoading.profile:
        return SpinKitSquareCircle(
            color: _spinKitTheme(context), size: _spinKitSize);

      case ChooseLoading.image:
        return SpinKitFadingCircle(
            color: _spinKitTheme(context), size: _spinKitSize);

      case ChooseLoading.page:
        return SpinKitPouringHourGlassRefined(
          size: _spinKitSize,
          color: _spinKitTheme(context),
        );

      case ChooseLoading.webPage:
        return SpinKitWanderingCubes(
            color: _spinKitTheme(context), size: _spinKitSize);
      case ChooseLoading.button:
        return SpinKitFadingCircle(
          itemBuilder: (_, __) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.btnColor),
                shape: BoxShape.circle,
              ),
            );
          },
          size: _spinKitSize,
        );

      default:
        return SpinKitFadingCircle(
            color: _spinKitTheme(context), size: _spinKitSize);
    }
  }

  // * size loading
  double get _spinKitSize => (_size ?? Dimen.xxlg / 1.4).w;
  // * color theme
  Color _spinKitTheme(BuildContext context) =>
      AppTheme.isDark(context) ? AppColors.darkLoading : AppColors.lightLoading;
}

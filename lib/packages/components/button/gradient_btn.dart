part of '../../../services/import/app_import.dart';

class GradientBtn extends StatelessWidget {
  const GradientBtn({
    Key? key,
    required String btnTitle,
    required void Function()? onTap,
    double? height,
    bool ltr = true,
  })  : _btnTitle = btnTitle,
        _onTap = onTap,
        _height = height,
        _ltr = ltr,
        super(key: key);

  final double? _height;
  final void Function()? _onTap;
  final String _btnTitle;
  final bool _ltr;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimen.lg.r),
      onTap: _onTap,
      child: Container(
        width: Dimen.fullScreen.sw,
        height: (_height ?? (Dimen.xlg * 1.5)).h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.btnColor,
            begin: _ltr ? Alignment.centerLeft : Alignment.centerRight,
            end: _ltr ? Alignment.centerRight : Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(Dimen.xxlg.r),
        ),
        child: Text(
          _btnTitle.tr().toUpperCase(),
          style: AppTheme.h5(context).copyWith(color: AppColors.bgWhite),
        ),
      ),
    );
  }
}

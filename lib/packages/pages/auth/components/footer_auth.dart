part of '../../../../services/import/app_import.dart';

class FooterAuth extends StatelessWidget {
  const FooterAuth({
    Key? key,
    required String fword,
    required String sword,
    required Function() onTap,
  })  : _fword = fword,
        _sword = sword,
        _onTap = onTap,
        super(key: key);

  final String _fword;
  final String _sword;
  final Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(text: _fword.tr()),
          TextSpan(
              text: _sword.tr(),
              style:
                  AppTheme.h6(context).copyWith(color: AppColors.bgGreenBold),
              recognizer: TapGestureRecognizer()..onTap = _onTap),
        ],
      ),
    );
  }
}

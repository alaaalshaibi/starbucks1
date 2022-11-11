part of '../../../../services/import/app_import.dart';

class ForgotPassText extends StatelessWidget {
  const ForgotPassText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          AppLang.isAr(context) ? Alignment.centerLeft : Alignment.centerRight,
      child: TextButton(
        onPressed: () => _navForgot(context),
        child: Text(
          KeyLang.forgotPass.tr(),
          style: AppTheme.b1(context)
              .copyWith(decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  // * navigator Forgot
  void _navForgot(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pushNamed(context, PageForgot.id);
  }
}

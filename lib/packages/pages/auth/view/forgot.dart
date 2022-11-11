part of '../../../../services/import/app_import.dart';

class PageForgot extends StatelessWidget {
  static const String id = 'PageForgot';
  const PageForgot({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimen.sm.w),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                // * header Auth
                const HeaderAuth(),
                // * hint Reset pass
                Text(
                  KeyLang.hintResetPass.tr(),
                  textAlign: TextAlign.start,
                  style: AppTheme.s1(context).copyWith(height: 1.5),
                ),
                // * Spacer
                Dimen.xlg.verticalSpace,
                // * Email
                const FieldEmail(),
                // * Spacer
                Dimen.lg.verticalSpace,
                // * Button
                _auth.isLoading
                    ? const AppLoading(chooseLoading: ChooseLoading.button)
                    : GradientBtn(
                        btnTitle: KeyLang.login,
                        onTap: () async {
                          if (_keyForm.currentState?.validate() ?? false) {
                            _keyForm.currentState?.save();
                            FocusScope.of(context).requestFocus(FocusNode());
                            bool result = await _auth.resetPass;
                            result
                                ? Navigator.pop(context)
                                : errorToast(_auth.errorMessage);
                          } else {}
                        },
                      ),
                // * Spacer
                Dimen.xlg.verticalSpace,
                // * Footer
                FooterAuth(
                  fword: KeyLang.haveAccount,
                  sword: KeyLang.login,
                  onTap: () => _navigatorLogin(_auth, context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigatorLogin(AuthService _auth, BuildContext context) {
    _auth.reset();
    Navigator.pop(context);
  }
}

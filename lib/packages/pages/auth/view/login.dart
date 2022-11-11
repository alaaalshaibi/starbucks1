part of '../../../../services/import/app_import.dart';

class PageLogin extends StatelessWidget {
  static const String id = 'PageLogin';
  const PageLogin({Key? key}) : super(key: key);

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
                // * Email
                const FieldEmail(),
                // * Spacer
                Dimen.md.verticalSpace,
                // * Pass
                const FieldPass(),
                // * Forgot Pass
                const ForgotPassText(),
                // * Button
                _auth.isLoading
                    ? const AppLoading(chooseLoading: ChooseLoading.button)
                    : GradientBtn(
                        btnTitle: KeyLang.login,
                        onTap: () async {
                          if (_keyForm.currentState?.validate() ?? false) {
                            _keyForm.currentState?.save();
                            FocusScope.of(context).requestFocus(FocusNode());

                            User? _user = await _auth.login;
                            if (_user != null) {
                              _navHome(context);
                            } else {
                              errorToast(_auth.errorMessage);
                            }
                          } else {}
                        },
                      ),
                // * Spacer
                Dimen.xlg.verticalSpace,
                // * Footer
                FooterAuth(
                  fword: KeyLang.notAccount,
                  sword: KeyLang.register,
                  onTap: () => _navRegister(context, _auth),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // * navigator Register
  void _navRegister(BuildContext context, AuthService auth) {
    auth.reset();
    Navigator.pushNamed(context, PageRegister.id);
  }

  // * Navigator Home Page
  void _navHome(BuildContext context) =>
      Navigator.pushNamed(context, PageHome.id);
}

part of '../../../../services/import/app_import.dart';

class PageRegister extends StatelessWidget {
  static const String id = 'PageRegister';
  const PageRegister({Key? key}) : super(key: key);

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
                // * Spacer
                Dimen.md.verticalSpace,
                // * Confirm  Pass
                const FieldPass(isConfirm: true),
                Dimen.xlg.verticalSpace,
                // * Button
                _auth.isLoading
                    ? const AppLoading(chooseLoading: ChooseLoading.button)
                    : GradientBtn(
                        btnTitle: KeyLang.register,
                        onTap: () async {
                          if (_keyForm.currentState?.validate() ?? false) {
                            _keyForm.currentState?.save();
                            FocusScope.of(context).requestFocus(FocusNode());
                            User? _user = await _auth.register;
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

  // * Navigator Home Page
  void _navHome(BuildContext context) =>
      Navigator.pushNamed(context, PageHome.id);
}

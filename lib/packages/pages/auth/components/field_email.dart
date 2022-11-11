part of '../../../../services/import/app_import.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = Provider.of<AuthService>(context);
    return CustomFiled(
      hintText: KeyLang.email,
      keyboardType: TextInputType.emailAddress,
      pIcon: Padding(
        padding: EdgeInsets.all(Dimen.lg.h),
        child: PathIcons.emailIcon,
      ),
      onValidator: AppValidators.isEmail,
      onSave: (value) => _auth.setUserEmail = value,
    );
  }
}

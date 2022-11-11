part of '../../../../services/import/app_import.dart';

class FieldPass extends StatelessWidget {
  const FieldPass({Key? key, final bool isConfirm = false})
      : _isConfirm = isConfirm,
        super(key: key);

  final bool _isConfirm;

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = Provider.of<AuthService>(context);
    return CustomFiled(
      hintText: _isConfirm ? KeyLang.confirmPass : KeyLang.pass,
      isObscure: _auth.userPass.isObscure,
      onValidator: (value) {
        return _isConfirm
            ? AppValidators.isEqualPass(value, _auth.currentPass)
            : AppValidators.isPass(value);
      },
      onChanged: (value) {
        if (!_isConfirm) {
          _auth.currentPass = value;
        }
      },
      onSave: (value) => _auth.setUserPass = value,
      helperText: KeyLang.errorPass.tr(),
      pIcon: Padding(
        padding: EdgeInsets.all(Dimen.lg.h),
        child: PathIcons.passIcon,
      ),
      sIcon: Padding(
        padding: EdgeInsets.all(Dimen.lg.h),
        child: InkWell(
          onTap: () => _auth.changeUserPass(),
          child: _auth.userPass.icon,
        ),
      ),
    );
  }
}

part of '../../../services/import/app_import.dart';

class CustomFiled extends StatelessWidget {
  const CustomFiled({
    Key? key,
    String? initValue,
    Color? cursorColor,
    TextInputType? keyboardType,
    bool isObscure = false,
    String? Function(String?)? onValidator,
    String? Function(String?)? onSave,
    void Function(String)? onChanged,
    // * InputDecoration
    String? hintText,
    Widget? lable,
    String? labelText,
    String? helperText,
    Widget? pIcon,
    Widget? sIcon,
  })  : _initValue = initValue,
        _cursorColor = cursorColor,
        _keyboardType = keyboardType,
        _isObscure = isObscure,
        _onValidator = onValidator,
        _onSave = onSave,
        _onChanged = onChanged,
        // * InputDecoration
        _hintText = hintText,
        _lable = lable,
        _labelText = labelText,
        _helperText = helperText,
        _pIcon = pIcon,
        _sIcon = sIcon,
        super(key: key);
  final String? _initValue;
  final Color? _cursorColor;
  final TextInputType? _keyboardType;
  final bool _isObscure;
  final String? Function(String?)? _onValidator;
  final String? Function(String?)? _onSave;
  final void Function(String)? _onChanged;

  // * InputDecoration
  final String? _hintText;
  final Widget? _lable;
  final String? _labelText;
  final String? _helperText;
  final Widget? _pIcon;
  final Widget? _sIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: _initValue,
      cursorColor: _cursorColor ?? AppColors.bgGreenBold,
      keyboardType: _keyboardType,
      obscureText: _isObscure,
      validator: _onValidator,
      onSaved: _onSave,
      onChanged: _onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: _hintText,
        label: _lable,
        labelText: _labelText,
        helperText: _helperText,
        prefixIcon: _pIcon,
        suffixIcon: _sIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimen.lg.r),
          borderSide: BorderSide(color: AppColors.bgGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimen.lg.r),
          borderSide: BorderSide(color: AppColors.bgGreenBold),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimen.lg.r),
          borderSide: BorderSide(color: AppColors.ceriseRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimen.lg.r),
          borderSide: BorderSide(color: AppColors.ceriseRed),
        ),
      ),
    );
  }
}

part of '../../../services/import/app_import.dart';

class OutlinedBtn extends StatelessWidget {
  const OutlinedBtn({
    Key? key,
    required String title,
    required void Function() onTap,
    double? radius,
  })  : _title = title,
        _onTap = onTap,
        _radius = radius,
        super(key: key);
  final String _title;
  final double? _radius;
  final void Function() _onTap;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onTap,
      child: Text(_title).tr(),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((_radius ?? Dimen.xxxlg).r),
        ),
      ),
    );
  }
}

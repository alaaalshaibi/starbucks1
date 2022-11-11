part of '../../../services/import/app_import.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key, required String titleError})
      : _titlError = titleError,
        super(key: key);
  final String _titlError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _titlError,
          style: AppTheme.s1(context).copyWith(color: AppColors.torchReda),
        ).tr(),
      ),
    );
  }
}

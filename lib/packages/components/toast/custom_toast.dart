part of '../../../services/import/app_import.dart';

void errorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.torchReda,
    textColor: AppColors.bgWhite,
    fontSize: Dimen.lg.sm,
  );
}

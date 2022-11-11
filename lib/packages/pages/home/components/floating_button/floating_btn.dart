part of '../../../../../services/import/app_import.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, PageOrder.id),
      backgroundColor: AppColors.bgGreen,
      child: Image(
        image: AssetImage(PathImages.coffeeCup),
        width: Dimen.xlg.w,
      ),
    );
  }
}

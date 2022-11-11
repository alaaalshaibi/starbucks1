part of '../../../../../../services/import/app_import.dart';

class CoffeeImage extends StatelessWidget {
  const CoffeeImage({Key? key, required ModelCoffeeState coffeeState})
      : _coffeeState = coffeeState,
        super(key: key);
  final ModelCoffeeState _coffeeState;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimen.md.h),
      padding: EdgeInsets.all(Dimen.xs.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimen.md.h),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.antiAlias,
          children: [
            // * Image
            Image(
              image: AssetImage(_coffeeState.image),
              width: Dimen.half.sw,
              height: Dimen.half.sw,
              fit: BoxFit.fill,
            ),
            // *  Text

            Container(
              width: Dimen.fullScreen.sw,
              color: AppColors.darkMode.withOpacity(0.6),
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Text(
                _coffeeState.nameCoffee,
                style: AppTheme.b1(context).copyWith(color: AppColors.bgWhite),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

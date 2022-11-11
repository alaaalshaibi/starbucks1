part of '../../../../../../services/import/app_import.dart';

class CoffeeRadio extends StatelessWidget {
  const CoffeeRadio({Key? key, required ModelCoffeeState coffeeState})
      : _coffeeState = coffeeState,
        super(key: key);
  final ModelCoffeeState _coffeeState;
  @override
  Widget build(BuildContext context) {
    final ManageStateCoffee _coffeeProvider =
        Provider.of<ManageStateCoffee>(context);
    return Expanded(
      child: Column(
        children: [
          // * image & name Coffee
          CoffeeImage(coffeeState: _coffeeState),

          // * Radio
          Radio(
            activeColor: AppColors.bgGreenBold,
            value: _coffeeState.valueRadio,
            groupValue: _coffeeProvider.groupValue,
            onChanged: _coffeeProvider.onSelectedCoffee,
          ),
        ],
      ),
    );
  }
}

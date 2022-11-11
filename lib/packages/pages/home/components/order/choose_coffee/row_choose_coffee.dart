part of '../../../../../../services/import/app_import.dart';

class RowChooseCoffee extends StatelessWidget {
  const RowChooseCoffee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageStateCoffee _coffeeProvider =
        Provider.of<ManageStateCoffee>(context);
    return Row(children: _coffeeProvider.buildCoffee());
  }
}

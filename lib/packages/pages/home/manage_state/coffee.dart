part of '../../../../services/import/app_import.dart';

class ManageStateCoffee extends ChangeNotifier {
  int groupValue = -1;
  // * UI Data
  final List<ModelCoffeeState> _coffee = [
    ModelCoffeeState(
      image: PathImages.coffee1,
      nameCoffee: KeyLang.caffeMocha,
      valueRadio: 1,
    ),
    ModelCoffeeState(
      image: PathImages.coffee2,
      nameCoffee: KeyLang.cappuccino,
      valueRadio: 2,
    ),
    ModelCoffeeState(
      image: PathImages.coffee3,
      nameCoffee: KeyLang.hotCoffees,
      valueRadio: 3,
    ),
  ];

  // * Get List Coffee
  UnmodifiableListView<ModelCoffeeState> get coffee =>
      UnmodifiableListView(_coffee);

  // * set choose Coffee
  void onSelectedCoffee(int? value) {
    groupValue = value ?? -1;
    notifyListeners();
  }

  List<CoffeeRadio> buildCoffee() =>
      [...coffee.map((cof) => CoffeeRadio(coffeeState: cof))];

  // * get Choose Coffee
  ModelCoffeeState? get chooseCoffee {
    ModelCoffeeState? data;
    for (var cof in coffee) {
      if (cof.valueRadio == groupValue) {
        data = cof;
      }
    }
    return data;
  }

  // * reset Value
  void resetCoffee() {
    groupValue = -1;
    notifyListeners();
  }
}

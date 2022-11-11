part of '../../../../services/import/app_import.dart';

class ManageStateIngredients extends ChangeNotifier {
  // * choose all check box
  final ModelCheckBoxState _allIngredients =
      ModelCheckBoxState(key: 0, title: KeyLang.chooseAll);

  // * List of data ingr
  final List<ModelCheckBoxState> _ingredients = [
    ModelCheckBoxState(key: 1, title: KeyLang.milk),
    ModelCheckBoxState(key: 2, title: KeyLang.sugar),
    ModelCheckBoxState(key: 3, title: KeyLang.vanilla),
    ModelCheckBoxState(key: 4, title: KeyLang.ice),
    ModelCheckBoxState(key: 5, title: KeyLang.caramelSauce),
  ];

  // * get List
  UnmodifiableListView<ModelCheckBoxState> get ingredients =>
      UnmodifiableListView(_ingredients);

// * get Data All Choose
  ModelCheckBoxState get allIngredients => _allIngredients;

  void onSelectedCheckBox(bool? value, int key) {
    if (value != null) {
      for (var ingr in ingredients) {
        if (ingr.key == key) {
          ingr.value = value;
          break;
        }
      }
      _allIngredients.value = ingredients.every((ingr) => ingr.value);
      notifyListeners();
    }
  }

  // * onPressed CheckBox Choose All
  void onSelectedGroup(bool? value) {
    if (value != null) {
      _allIngredients.value = value;
      for (var ingr in ingredients) {
        ingr.value = value;
      }
      notifyListeners();
    }
  }

  // * get List String ingredienets
  List<String> get getSelectedIngredients {
    List<String> ingrSelected = [];
    for (var ingr in ingredients) {
      if (ingr.value) ingrSelected.add(ingr.title.tr());
    }
    return ingrSelected;
  }

  // * reset value
  void resetIngredients() {
    for (var ingr in ingredients) {
      ingr.value = false;
    }
    _allIngredients.value = false;
    notifyListeners();
  }
}

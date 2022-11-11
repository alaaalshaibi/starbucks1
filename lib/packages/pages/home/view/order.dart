part of '../../../../services/import/app_import.dart';

class PageOrder extends StatelessWidget {
  static const String id = 'PageOrder';
  const PageOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageStateCoffee _coffeeProvider =
        Provider.of<ManageStateCoffee>(context);
    final ManageStateIngredients _ingrProvider =
        Provider.of<ManageStateIngredients>(context);

    final OrderService _orderProvider = Provider.of<OrderService>(context);
    return Scaffold(
      appBar: const AppBarHome(title: KeyLang.order),
      body: SingleChildScrollView(
        child: Column(children: [
          //  * Choose Coffee
          const RowChooseCoffee(),
          Dimen.lg.verticalSpace,
          // * Ingrendent
          const BuildIngredient(),

          Dimen.xlg.verticalSpace,
          // * Btn Order
          _orderProvider.isLoading
              ? const AppLoading(chooseLoading: ChooseLoading.button)
              : GradientBtn(
                  ltr: false,
                  btnTitle: KeyLang.order,
                  onTap: () async {
                    // * name Coffee
                    final ModelCoffeeState? dataCoffee =
                        _coffeeProvider.chooseCoffee;

                    // * list ingredient
                    final List<String> ingr =
                        _ingrProvider.getSelectedIngredients;

                    if (dataCoffee == null) {
                      errorToast(KeyLang.chooseCoffee.tr());
                    } else {
                      ModelOrder order = ModelOrder(
                        nameCoffee: dataCoffee.nameCoffee,
                        selected: dataCoffee.valueRadio,
                        ingredients: ingr,
                        createdAt: DateTime.now().millisecondsSinceEpoch,
                      );
                      if (await _orderProvider.addOrder(order)) {
                        _ingrProvider.resetIngredients();
                        _coffeeProvider.resetCoffee();
                        Navigator.pop(context);
                      } else {
                        errorToast(_orderProvider.errorMessage);
                      }
                    }
                  },
                )
        ]),
      ),
    );
  }
}

part of '../../../../../../services/import/app_import.dart';

class BuildIngredient extends StatelessWidget {
  const BuildIngredient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageStateIngredients _ingrProvider =
        Provider.of<ManageStateIngredients>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * Choose All
        BuildCheckBox(data: _ingrProvider.allIngredients, chooseAll: true),
        Divider(
          color: AppTheme.isDark(context)
              ? AppColors.bgWhite
              : AppColors.bgBlack.withOpacity(0.6),
        ),
        // * list Ingredinent
        Wrap(
          direction: Axis.horizontal,
          spacing: 5,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          children: [
            ..._ingrProvider.ingredients
                .map((ingr) => BuildCheckBox(data: ingr))
          ],
        )
      ],
    );
  }
}

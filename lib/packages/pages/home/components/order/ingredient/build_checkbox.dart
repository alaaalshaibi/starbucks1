part of '../../../../../../services/import/app_import.dart';

class BuildCheckBox extends StatelessWidget {
  const BuildCheckBox(
      {Key? key, required ModelCheckBoxState data, bool chooseAll = false})
      : _data = data,
        _chooseAll = chooseAll,
        super(key: key);
  final ModelCheckBoxState _data;
  final bool _chooseAll;
  @override
  Widget build(BuildContext context) {
    final ManageStateIngredients _ingrProvider =
        Provider.of<ManageStateIngredients>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _data.value,
          activeColor: AppColors.bgGreenBold,
          onChanged: (value) {
            _chooseAll
                ? _ingrProvider.onSelectedGroup(value)
                : _ingrProvider.onSelectedCheckBox(value, _data.key);
          },
        ),
        Text(_data.title.tr())
      ],
    );
  }
}


// CheckboxListTile(
//       value: _data.value,
//       activeColor: AppColors.bgGreenBold,
//       controlAffinity: ListTileControlAffinity.leading,
//       contentPadding: EdgeInsets.zero,
//       title: Text(_data.title.tr()),
//       onChanged: (value) {},
//     );
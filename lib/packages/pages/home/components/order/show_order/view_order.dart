part of '../../../../../../services/import/app_import.dart';

class ViewOrder extends StatelessWidget {
  const ViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ModelOrder>?>(
        stream: OrderService().order,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }
          if (snapshot.hasData) {
            List<ModelOrder> listOrder = snapshot.data ?? [];
            return Center(
              child: Text('${listOrder.first.nameCoffee}'),
            );
          } else {
            return const ErrorText(titleError: KeyLang.errorNoData);
          }
        });
  }
}

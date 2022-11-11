import '../../../../services/constant/key_firebase.dart';

class ModelOrder {
  String? idUser;
  String? idOrder;
  String? nameCoffee;
  List<String>? ingredients;
  int? createdAt;
  int selected;

  ModelOrder({
    this.idUser,
    this.idOrder,
    this.nameCoffee,
    this.ingredients,
    this.createdAt,
    this.selected = -1,
  });

  ModelOrder.fromMap(Map<String, dynamic> data)
      : assert(data.isNotEmpty),
        idUser = data[KeyFirebase.id],
        idOrder = data[KeyFirebase.idOrder],
        nameCoffee = data[KeyFirebase.nameCoffeee],
        ingredients = data[KeyFirebase.ingredients].cast<String>(),
        selected = data[KeyFirebase.selected],
        createdAt = data[KeyFirebase.createdAt];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyFirebase.id] = idUser;
    data[KeyFirebase.idOrder] = idOrder;
    data[KeyFirebase.nameCoffeee] = nameCoffee;
    data[KeyFirebase.ingredients] = ingredients;
    data[KeyFirebase.createdAt] = createdAt;
    data[KeyFirebase.selected] = selected;
    return data;
  }
}

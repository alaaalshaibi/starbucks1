// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelCoffeeState {
  String image;
  String nameCoffee;
  int valueRadio;

  ModelCoffeeState({
    required this.image,
    required this.nameCoffee,
    required this.valueRadio,
  });

  @override
  String toString() => 'ModelCoffeeState(image: $image, nameCoffee: $nameCoffee, valueRadio: $valueRadio)';
}

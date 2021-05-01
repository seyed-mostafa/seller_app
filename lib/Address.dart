class Address{
  String _name, _description;
  num _discount,_price;
  bool _sizing,_available;
  List<TypeFood> _typeFood = List.empty(growable: true);
  List<String> _comment = List.empty(growable: true);

}

enum Size{
  none,
}
enum TypeFood{
  FastFood,
}
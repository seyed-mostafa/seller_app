class Food {
  String _name, _description;
  num _discount, _price;
  bool _sizing, _available;
  TypeFood _typeFood;

  Food(String name, String description, num price, num discount, bool sizing,
      bool available, TypeFood typeFood) {
    this._name = name;
    if (discount != null) {
      this._discount = discount;
    }
    this._description = description;
    this._price = price;
    this._sizing = sizing;
    this._available = available;
    this._typeFood = typeFood;
  }

  void setName(String name) {
    this._name = name;
  }

  void setDescription(String description) {
    this._description = description;
  }

  void setPrice(num price) {
    this._price = price;
  }

  void setDiscount(num discount) {
    if (discount != null) {
      this._discount = discount;
    }
  }

  void setSizing(bool sizing) {
    this._sizing = sizing;
  }

  void setAvailable(bool available) {
    this._available = available;
  }

  void setTypeFood(TypeFood typeFood) {
    this._typeFood = typeFood;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

  num getPrice() {
    return _price;
  }

  int getPriceWithDiscount() {
    if (_discount == null) return _price;
    return (_price * _discount / 100).ceil();
  }

  num getDiscount() {
    return _discount;
  }

  bool getSizing() {
    return _sizing;
  }

  bool getAvailable() {
    return _available;
  }

  TypeFood getTypeFood() {
    return _typeFood;
  }
}

enum TypeFood {
  Pizza,
  Sandwich,
  Drinks,
  PersianFood,
  Dessert //دسر
  ,
  Appetizer //پیش غذا
  ,
  Fried //سوخاری
  ,
  Steaks,
  Breakfast,
  International,
  All
}

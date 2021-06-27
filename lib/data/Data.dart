import 'package:seller_app/Objects/Customer.dart';
import 'package:seller_app/Objects/Restaurant.dart';

class Data {
  static final Data _data = Data._internal();
  static Restaurant restaurant;
  static List<Customer> customers=List.empty(growable: true);

  factory Data() {
    return _data;
  }

  Data._internal();

}
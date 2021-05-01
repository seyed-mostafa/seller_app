
import 'Food.dart';

class Restaurant {
  String name;
  String address;
  List<Food> foods = [];
  List<String> foodType = [];
  String phoneNumber;
  String password;

  Restaurant({
    this.name,
    this.address,
    this.foods,
    this.foodType,
    this.phoneNumber,
    this.password});
}
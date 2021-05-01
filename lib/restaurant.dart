import 'Address.dart';
import 'Food.dart';

class restaurent {
  String _name, _phoneNumber, _password, _days, _hour;
  num _sendingRangeRadius;
  Address _address;
  List<Food> _menu = List.empty(growable: true);

  restaurent(String name, Address address, String phoneNumber, String password) {
    this._name = name;
    this._address = address;
    this._password = password;
    this._phoneNumber = phoneNumber;
  }

  List<Food> getMenu() {
    return _menu;
  }

  void addMenu(Food food){
    _menu.add(food);
  }




  void setName(name) {
    this._name = name;
  }

  void setDays(days) {
    this._days = days;
  }

  void setHour(hour) {
    this._hour = hour;
  }

  void setAddress(address) {
    this._address = address;
  }

  void setPhoneNumber(phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void setPassword(password) {
    this._password = password;
  }

  void setSendingRangeRadius(sendingRangeRadius) {
    this._sendingRangeRadius = sendingRangeRadius;
  }





  String getName() {
    return _name;
  }

  Address getAddress() {
    return _address;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  String getPassword() {
    return _password;
  }

  num getSendingRangeRadius() {
    return _sendingRangeRadius;
  }

  String getDays() {
    return _days;
  }

  String getHour() {
    return _hour;
  }
}

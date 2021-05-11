import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Food.dart';

//  _name  =>                                                      نام رستوران
// _phoneNumber =>                                          شماره تماس رستوران
// _password =>                                کلمه عبور برای ورود به اپلیکیشن
// _days =>                               روز های کاری رستوران به صورت یک رشته
// _hour =>                                  ساعت کاری رستوران به ضورت یک رشته
// _sendingRangeRadius =>                   شعاع محدوده ارسال غذا توسط رستوران
// _address =>                       آدرس رستوران (به صورت مختصات )در کلاس خودش
// List<Food> _menu =>                    منو رستوران به صورت لیستی از جنس غذا

class Restaurant {

  static int _count=99243000;
  String _name, _phoneNumber, _password, _days, _hour;
  num _sendingRangeRadius,_id;
  LatLng _address;
  List<Food> _menu = List.empty(growable: true);
  List<TypeFood> _type;

  Restaurant(String name, LatLng address, String phoneNumber, String password) {
    _count++;
    _id=_count;
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

  int getId(){
    return _id;
  }

  void addTypeFood(TypeFood typeFood){
    _type.add(typeFood);
  }

List<TypeFood> getTypeFoods(){
    return _type;
}


  void setName(String name) {
    this._name = name;
  }

  void setDays(String days) {
    this._days = days;
  }

  void setHour(String hour) {
    this._hour = hour;
  }

  void setAddress(LatLng address) {
    this._address = address;
  }

  void setPhoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void setPassword(String password) {
    this._password = password;
  }

  void setSendingRangeRadius(num sendingRangeRadius) {
    this._sendingRangeRadius = sendingRangeRadius;
  }





  String getName() {
    return _name;
  }

  LatLng getAddress() {
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

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/Objects/Comment.dart';
import 'Location.dart';
import 'Order.dart';
import 'Food.dart';


//  _name  =>                                                      نام رستوران
// _phoneNumber =>                                          شماره تماس رستوران
// _password =>                                کلمه عبور برای ورود به اپلیکیشن
// _days =>                               روز های کاری رستوران به صورت یک رشته
// _hour =>                                  ساعت کاری رستوران به ضورت یک رشته
// _sendingRangeRadius =>                   شعاع محدوده ارسال غذا توسط رستوران
// _address =>                       آدرس رستوران (به صورت مختصات )در کلاس خودش
// List<Food> _menu =>                    منو رستوران به صورت لیستی از جنس غذا

class Restaurant  {

  static int _count=99243000;
  String _name, _phoneNumber, _password, _days, _hour,_addressString;
  num _sendingRangeRadius,_id;
  Location _address;
  List<Food> _menu = List.empty(growable: true);
  List<TypeFood> type = [TypeFood.all];
  List<Order> _orders= List.empty(growable: true);
  List<Comment> _comments= List.empty(growable: true);
  List<double> _rate= List.empty(growable: true);



  Restaurant(String name, Location address, String phoneNumber, String password)  {
    _count++;
    _id=_count;
    this._name = name;
    this._address = address;
    this._password = password;
    this._phoneNumber = phoneNumber;
  }

//////////////////////////////////////////////

  List <int> cashsales= List.empty(growable: true);
  List<int> onlinesales= List.empty(growable: true);
  List<int> totalsales= List.empty(growable: true);
  void setcashSales(int sale){
    cashsales.add(sale);
  }
  void setonlineSales(int sale){
    onlinesales.add(sale);
  }
  List getOnlineSales(){
    return onlinesales;
  }

  List getcashSales(){
    return cashsales;
  }

  List getTotalSales(){
    for(int i=0;i<30;i++)
      totalsales.add(cashsales[i]+onlinesales[i]);
    return totalsales;
  }

  int getOnlineSalessum(int i){
    int sum=0;
    for(i=30-i; i<onlinesales.length;i++)
      sum+=onlinesales[i];
    return sum;
  }

  int getcashSalessum(int i){
    int sum=0;
    for(i=30-i ; i<cashsales.length;i++)
      sum+=cashsales[i];
    return sum;
  }

  int getTotalSalessum(int i){
     int sum=0;
     for( i=30-i; i<onlinesales.length;i++) {
       sum += onlinesales[i];
       sum += cashsales[i];
     }
    return sum;
  }

  ///////////////////////////////////////////


  void addRate(double rate){
    _rate.add(rate);
  }

  void addComment(Comment comment){
    _comments.add(comment);
  }

  void addOrder(Order order){
    _orders.add(order);
    this.arrange();
  }

  void arrange(){
    List <Order> done= List.empty(growable: true);
    List <Order> undone= List.empty(growable: true);
    for(Order ord in _orders){
      if(ord.getDelivered()==true){
        done.add(ord);
      }else{
        undone.add(ord);
      }
    }
    done.sort((a,b) => a.getOrderTime().compareTo(b.getOrderTime()) );
    undone.sort((a,b) => a.getOrderTime().compareTo(b.getOrderTime()) );
    _orders.clear();
    done=done.reversed.toList();
    undone=undone.reversed.toList();
    undone+=done;
    _orders+=undone;
  }


  void addMenu(Food food){
    _menu.add(food);
  }

  void addTypeFood(TypeFood typeFood){
    type.add(typeFood);
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

  void setAddress(Location address) {
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

  Location getAddress() {
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

  List<Order> getOrders(){
    return _orders;
  }

  List<Food> getMenu() {
    return _menu;
  }
  List<TypeFood> getTypeFoods(){
    return type;
  }

  int getId(){
    return _id;
  }

  double getRate(){
    double sum=0;
    for(double i in _rate)
      sum+=i;
    return sum/_rate.length;
  }

  List<Comment> getComments(){
    return _comments;
  }

  void setId(int parse) {
    _id=parse;
  }

}

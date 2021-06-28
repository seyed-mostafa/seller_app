import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'Food.dart';
import 'Location.dart';




class Order {

  String _customerName, _restaurantName, _orderTime, _deliveryTime;

  Location _customerAddress, _restaurantAddress;
  int _restaurantId,_id,_price=0;
  bool _delivered=false;
  static int _count=99246000;
  Map <Food,int> _order=new Map();


  @override
  String toString() {
    return 'Order{_customerName: $_customerName, _restaurantName: $_restaurantName, _orderTime: $_orderTime, _deliveryTime: $_deliveryTime, _customerAddress: $_customerAddress, _restaurantAddress: $_restaurantAddress, _restaurantId: $_restaurantId, _id: $_id, _price: $_price, _delivered: $_delivered, _order: $_order}';
  }

  Order(Food food, int i,int restaurantId) {
    _order[food]=i;
    _count++;
    _id=_count;
    _restaurantId=restaurantId;
  }

  Order.full(String restaurantName,String customerName,String orderTime,Location customerAddress,Location restaurantAddress,int id){
    _restaurantName=restaurantName;
    _customerName=customerName;
    _orderTime=orderTime;
    _customerAddress=customerAddress;
    _restaurantAddress=restaurantAddress;
    _id=id;
  }
  void Delivered(bool status){
    _delivered=status;
  }

  void setDelivered(){
    _delivered=!_delivered;
    _deliveryTime= DateFormat('d MMM kk:mm').format( DateTime.now());
  }
  void setRestaurantName(String name){
    _restaurantName=name;
  }
  void setRestaurantAddress(Location location){
    _restaurantAddress=location;
  }
  void setCustomerAddress(Location location){
    _customerAddress=location;
  }
  void addFood(Food food,int i){
    _order[food]=i;
  }
  void setOrderTime(){
    _count++;
    _id=_count;
    _orderTime=  DateFormat('d MMM kk:mm').format( DateTime.now());
  }
  void remove(Food food){
    _order.remove(food);
    if (_order.isEmpty) {
      _restaurantId=0;
    }
  }


  String getCustomerName(){
  return _customerName;
  }


  bool getDelivered(){
    return _delivered;
  }
  String getOrderTime() {
    return _orderTime;
  }
  String getDeliveryTime() {
    return _deliveryTime;
  }
  int getPrice(){
    _price=0;
    for(Food food in _order.keys){
      if(food.getDiscount()!=null)
        _price+= ((food.getPrice()*(100-food.getDiscount()))/100*_order[food]).ceil();
      else
        _price+= (food.getPrice()*_order[food]);

    }
    return _price;
  }
  int getRestaurantId(){
    return _restaurantId;
  }
  String getRestaurantName(){
    return _restaurantName;
  }
  Location getCustomerAddress(){
    return _customerAddress;
  }
  Location getRestaurantAddress(){
    return _restaurantAddress;
  }
  int getId(){
    return _id;
  }
  Map <Food,int> getOrder(){
    return _order;
  }




}
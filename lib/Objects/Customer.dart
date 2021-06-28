
import 'package:seller_app/Objects/Location.dart';

import 'Comment.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Customer{
String _firstName,_lastName,_phoneNumber,_password;
num _wallet=0;
List<Location> _address = List.empty(growable: true);
List<Comment> _comments = List.empty(growable: true);




Customer(firstName,lastName,phoneNumber,password)
{
   this._firstName = firstName;
   this._lastName=lastName;
   this._phoneNumber=phoneNumber;
   this._password=password;

}

void setName(String fname) {
  this._firstName = fname;
}

void setLastName(String lname) {
  this._lastName = lname;
}

void setPhoneNumber(String phoneNumber) {
  this._phoneNumber = phoneNumber;
}

void setPassword(String password) {
  this._password = password;
}
void setWallet(num wallet) {
  this._wallet = wallet;
}
void addAdres(Location address) {
  this._address.add(address);
}
// void addPreviosOrders(Food food) {
//   this._previosOrders.add(food);
// }
// void addComment(Comment comment) {
//   _comments.add(comment);
// }
// void addFavoriteRestaurent(Restaurant favoriteRestaurent) {
//   this._favoriteRestaurent.add(favoriteRestaurent);
// }
// void addShoppingCart(Food food,int count) {
//   _shoppingCart[food]=count;
// }



String getName() {
  return _firstName ;
}

String getLastName() {
  return _lastName ;
}

String getPhoneNumber() {
  return _phoneNumber ;
}

String getPassword() {
  return _password ;
}
num getWallet() {
  return _wallet ;
}
List<Location> getAdres() {
  return _address;
}
// List<Food> getPreviosOrders() {
//   return _previosOrders;
// }
// List<Comment> getComment() {
//   return _comments;
// }
// List<Restaurant> getFavoriteRestaurent() {
//   return _favoriteRestaurent;
// }
// Map<Food,int> getShoppingCart() {
//   return _shoppingCart;
// }
//
// void setShoppingCartClear() {               //سبد خرید با این تابع خالی میشه
//    _shoppingCart.clear();                   //پس قبلش باید با تابع بالاییش، سبد خرید رو بگیریم و برای کلاس سفارشات بفرستیم
//}



}
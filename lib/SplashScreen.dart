import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seller_app/Pages/Nav.dart';
import 'Objects/Restaurant.dart';
import 'Pages/EnteringPage.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Order.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool EnteredUser = true;
  Restaurant restaurant1 = new Restaurant('akbar jooje',
      LatLng(35.717676891099835, 51.331243399093914), '09123456780', '1234');


  @override
  void initState() {
    Food food1 = Food('ghorme', 'description1', 25000, null, false, true,
        TypeFood.PersianFood);
    Food food2 = Food(
        'gheime', 'description2', 30000, 20, false, true, TypeFood.PersianFood);
    Food food3 = Food(
        'makhsoos', 'description3', 25000, null, false, true, TypeFood.Pizza);
    Food food4 = Food(
        'sabzijat', 'description4', 25000, null, false, true, TypeFood.Pizza);
    Food food5 = Food(
        'hamberger', 'description5', 65000, 20, false, true, TypeFood.Sandwich);
    Food food6 = Food(
        'sosis', 'description6', 25000, null, false, true, TypeFood.Sandwich);
    Food food7 =
        Food('ab', 'description7', 25000, null, false, true, TypeFood.Drinks);
    Food food8 =
        Food('doogh', 'description8', 40000, 52, false, true, TypeFood.Drinks);
    Food food9 = Food(
        'bastany', 'description9', 25000, null, false, true, TypeFood.Dessert);
    Food food10 = Food(
        'jely', 'description10', 25000, null, false, true, TypeFood.Dessert);
    Food food11 = Food(
        'soop', 'description11', 25000, 60, false, true, TypeFood.Appetizer);
    Food food12 = Food('fereny', 'description12', 25000, null, false, true,
        TypeFood.Appetizer);
    Food food13 = Food('morgh sokhary', 'description13', 80000, null, false,
        true, TypeFood.Fried);
    Food food14 = Food('gharch sorakhy', 'description14', 25000, null, false,
        true, TypeFood.Fried);
    Food food15 = Food('Medium Rare', 'description15', 15000, null, false, true,
        TypeFood.Steaks);
    Food food16 = Food('T-bone Steak', 'description16', 25000, 20, false, true,
        TypeFood.Steaks);
    Food food17 = Food(
        'nimroo', 'description17', 5000, null, false, true, TypeFood.Breakfast);
    Food food18 = Food('pancake', 'description18', 25000, null, false, true,
        TypeFood.Breakfast);
    Food food19 = Food('ghorme kharegy', 'description19', 25000, 50, false,
        true, TypeFood.International);
    Food food20 = Food('ghorme kharegy', 'description20', 8000, null, false,
        true, TypeFood.International);
    food1.setComment('comment');

    List<Food> food = [
      food20,
      food19,
      food18,
      food18,
      food17,
      food16,
      food15,
      food14,
      food13,
      food12,
      food11,
      food10,
      food9,
      food8,
      food7,
      food6,
      food5,
      food4,
      food3,
      food2,
      food1
    ];

    for (Food food in food) {
      restaurant1.addMenu(food);
    }
    for (Food food in food) {
      food.setComment(
          'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to modify the lists length (adding or removing elements) while an operation on the list is being performed, for example during a call to forEach or sort. Also, trying to change the length of a list during iteration leads to ConcurrentModificationError.');
    }
    for (Food food in food) {
      food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. In Map, both keys and values can be of any type of object, it is not necessary that the keys and values both of the same type.. In Map, each key can only occurs once, but the same value can be used multiple times. In Map, each of the value is associated with a unique key, and this key is used to accessed corresponding Map value. The Map can be defined by using curly braces ({ }) and values can be assigned and accessed using square braces ([]).');
    }
    restaurant1.setDays('tamam ayyam hafteh');
    restaurant1.setHour('as saat 13 ta 23');
    restaurant1.setSendingRangeRadius(2000);
    restaurant1.setAddressString('meidan hafthooz,kenar pasaj golbarg');
    
    Order order1=Order({food1:2,food4:1,food13:5});
    Order order2=Order({food3:1,food6:1,food5:9});
    Order order3=Order({food5:1,food7:1,food13:3});
    Order order4=Order({food15:4,food10:1,food13:3});
    Order order5=Order({food18:2,food9:1,food19:4});
    Order order6=Order({food19:1,food2:5,food11:2});
    Order order7=Order({food18:2,food4:1});
    Order order8=Order({food2:1,food4:1,food7:1});
    Order order9=Order({food15:1,food5:2,food8:3});
    Order order10=Order({food14:4,food4:1,food10:2});
    Order order11=Order({food9:3,food10:5,food8:1});

    order1.setCustomerName('Ali Alavi');
    order2.setCustomerName('Naghi Naghavi');
    order3.setCustomerName('Soltan Soltani');
    order4.setCustomerName('Abbas Abbasi');
    order5.setCustomerName('Mostafa Mostafai');
    order6.setCustomerName('Gol Kharzare');
    order7.setCustomerName('Pari Varparide');
    order8.setCustomerName('Abdollah Nakhalaf');
    order9.setCustomerName('Amir Booghi');
    order10.setCustomerName('Noora Noori');
    order11.setCustomerName('Pari Varparide');

    order1.setCustomerAddress(LatLng(34.717676891099835, 51.331243399093914));
    order2.setCustomerAddress(LatLng(35.717676891099835, 25.331243399093914));
    order3.setCustomerAddress(LatLng(33.717676891099835, 25.331243399093914));
    order4.setCustomerAddress(LatLng(32.717676891099835, 25.331243399093914));
    order5.setCustomerAddress(LatLng(31.717676891099835, 25.331243399093914));
    order6.setCustomerAddress(LatLng(35.717676891099835, 26.331243399093914));
    order7.setCustomerAddress(LatLng(35.717676891099835, 29.331243399093914));
    order8.setCustomerAddress(LatLng(35.717676891099835, 20.331243399093914));
    order9.setCustomerAddress(LatLng(36.717676891099835, 25.331243399093914));
    order10.setCustomerAddress( LatLng(36.717676891099835, 24.331243399093914));
    order11.setCustomerAddress( LatLng(36.717676891099835, 23.331243399093914));


    order1.setStatus();
    order3.setStatus();
    order7.setStatus();
    order5.setStatus();
    order8.setStatus();
    order9.setStatus();
    order2.setStatus();
    order6.setStatus();

    order1.setTime();
    order2.setTime();
    order3.setTime();
    order4.setTime();
    order5.setTime();
    order6.setTime();
    order7.setTime();
    order8.setTime();
    order9.setTime();
    order10.setTime();
    order11.setTime();

    List orders=[
      order11,order10,order9,order8,order7,order6,order5,order4,order3,order2,order1
    ];

    for(Order order in orders){
      order.setRestaurentName(restaurant1.getName());
      restaurant1.addOrder(order);
    }


    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: EnteredUser
                ? (BuildContext context) => Nav(restaurant1)
                : (BuildContext context) => EnteringPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/food2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

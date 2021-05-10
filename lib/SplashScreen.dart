import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seller_app/Pages/nav.dart';
import 'Objects/Restaurant.dart';
import 'Pages/EnteringPage.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/Objects/Food.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Restaurant restaurant1=new Restaurant('akbar jooje', LatLng(35.717676891099835, 51.331243399093914), '09123456780', '1234');
  List<Restaurant> restaurants= List.empty(growable: true);
  bool EnteredUser = true;
  int currentRestaurant = 0;

  @override
  void initState() {
  restaurants.add(restaurant1);
    //restaurants.add(Restaurant("name", null, "phoneNumber", "password"));
  List<Food> food=[
  Food('ghorme kharegy', 'description20', 8000,null , false, true, TypeFood.International),
  Food('ghorme', 'description1 \n sdsdsxswd\n sdwdwdhkouojojqox', 25000,null , false, true, TypeFood.PersianFood),
  Food('makhsoos', 'description3', 25000,null , false, true, TypeFood.Pizza),
  Food('sabzijat', 'description4', 25000,null , false, true, TypeFood.Pizza),
  Food('hamberger', 'description5', 65000,20 , false, true, TypeFood.Sandwich),
  Food('sosis', 'description6', 25000,null , false, true, TypeFood.Sandwich),
  Food('ab', 'description7', 25000,null , false, true, TypeFood.Drinks),
  Food('doogh', 'description8', 40000,52 , false, true, TypeFood.Drinks),
  Food('bastany', 'description9', 25000,null , false, true, TypeFood.Dessert),
  Food('jely', 'description10', 25000,null , false, true, TypeFood.Dessert),
  Food('soop', 'description11', 25000,60 , false, true, TypeFood.Appetizer),
  Food('fereny', 'description12', 25000,null , false, true, TypeFood.Appetizer),
  Food('morgh sokhary', 'description13', 80000,null , false, true, TypeFood.Fried),
  Food('gharch sorakhy', 'description14', 25000,null , false, true, TypeFood.Fried),
  Food('Medium Rare', 'description15', 15000,null , false, true, TypeFood.Steaks),
  Food('T-bone Steak', 'description16', 25000,20 , false, true, TypeFood.Steaks),
  Food('nimroo', 'description17', 5000,null , false, true, TypeFood.Breakfast)
  ];

  for(Food food in food ){
    restaurant1.addMenu(food);
  }


    super.initState();
    Timer(
        Duration(seconds: 0),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:  EnteredUser ?
                    (BuildContext context) => Nav(restaurants, currentRestaurant):
                    (BuildContext context) => EnteringPage(restaurants)
              )
            )
    );
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
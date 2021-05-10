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
  Food food20=Food('ghorme kharegy', 'description20', 8000,null , false, true, TypeFood.International);
  Food food1=Food('ghorme', 'description1 \n sdsdsxswd\n sdwdwdhkouojojqox', 25000,null , false, true, TypeFood.PersianFood);
  food1.setComment('comment');

  restaurant1.addMenu(food1);
  restaurant1.addMenu(food20);
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
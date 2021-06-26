import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seller_app/Pages/Nav.dart';
import 'Objects/Restaurant.dart';
import 'Pages/EnteringPage.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool EnteredUser = false;
  Restaurant restaurant1 = new Restaurant('akbar jooje',
      LatLng(35.717676891099835, 51.331243399093914), '09123456780', '1234');


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: EnteredUser
                ? (BuildContext context) => Nav()
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


import 'package:flutter/material.dart';
import 'package:seller_app/Classes/Food.dart';
import 'package:seller_app/Classes/Restaurant.dart';
import 'package:seller_app/Classes/theme.dart';
import 'package:seller_app/FoodMenu.dart';
import 'package:seller_app/main_panel_seller.dart';

import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: theme.yellow,
        primaryColor: Colors.black
      ),
      home: SplashScreen(),
    );
  }
}

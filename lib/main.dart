
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'SplashScreen.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/Customer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/Objects/Food.dart';


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

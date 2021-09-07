import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'Pages/first_pages/splashscreen_page.dart';

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
      theme:
          ThemeData(backgroundColor: theme.yellow, primaryColor: Colors.black),
      home: SplashScreenPage(),
    );
  }
}

import 'package:enterigester/Entering.dart';
import 'package:enterigester/SplashScreen.dart';
import 'package:enterigester/theme.dart';
import 'package:flutter/material.dart';

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

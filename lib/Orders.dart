

import 'package:flutter/material.dart';
import 'package:seller_app/Classes/Restaurant.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/bottom_navigation.dart';

class Orders extends StatefulWidget {

  List<Restaurant> restaurants = [];

  Orders(this.restaurants);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottom_navigation(widget.restaurants),
    );
  }
}

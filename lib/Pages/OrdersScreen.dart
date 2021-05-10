import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';

class Orders extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  Orders(this.restaurants, this.currentRestaurant);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  showOrder(index){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: List.generate(widget.restaurants[widget.currentRestaurant].getMenu().length, (index) => showOrder(index)),
        )
    );
  }
}

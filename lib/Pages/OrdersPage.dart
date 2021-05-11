

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/appBar.dart';

class Orders extends StatefulWidget {

Restaurant currentRestaurant;

  Orders( this.currentRestaurant);

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
          children: List.generate(widget.currentRestaurant.getMenu().length, (index) => showOrder(index)),
        )
    );
  }
}

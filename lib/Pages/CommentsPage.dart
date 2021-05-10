

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/appBar.dart';

class CommentsPage extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  CommentsPage(this.restaurants, this.currentRestaurant);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  showComment(index){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: List.generate(widget.restaurants[widget.currentRestaurant].getMenu().length, (index) => showComment(index)),
    )
    );
  }
}

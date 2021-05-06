

import 'package:flutter/material.dart';
import 'package:seller_app/Classes/Restaurant.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/bottom_navigation.dart';

class Comments extends StatefulWidget {

  List<Restaurant> restaurants = [];

  Comments(this.restaurants);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottom_navigation(widget.restaurants),
    );
  }
}

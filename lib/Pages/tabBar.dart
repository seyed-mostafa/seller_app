

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Pages/MenuPage.dart';
import 'package:seller_app/Pages/MenuPagePizza.dart';
import 'package:seller_app/Pages/MenuPageSandwich.dart';

class tabBar extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  tabBar(this.restaurants, this.currentRestaurant);

  @override
  _tabBarState createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.all_inbox), text: "allFood",),
                    Tab(icon: Icon(Icons.local_pizza), text: "pizza",),
                    Tab(icon: Icon(Icons.fastfood), text: "sandwich",)
                  ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FoodMenu(widget.restaurants, widget.currentRestaurant),
            PizzaMenu(widget.restaurants, widget.currentRestaurant),
            SandwichMenu(widget.restaurants, widget.currentRestaurant)
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/SellingCalculate.dart';

import 'OrdersPage.dart';

class tabBarOrders extends StatefulWidget {

  Restaurant currentRestaurant;

  tabBarOrders(this.currentRestaurant);

  @override
  _tabBarOrdersState createState() => _tabBarOrdersState();
}

class _tabBarOrdersState extends State<tabBarOrders> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                  labelColor: Colors.white,
                  indicatorColor: theme.yellow,
                  tabs: [
                    Tab(child: Row(children: [Icon(Icons.calculate), Text(" Selling Calculate")],),),
                    Tab(child: Row(children: [Icon(Icons.people), Text(" Orders")],),),
                  ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SellingCalculate(widget.currentRestaurant),
            Orders(widget.currentRestaurant),
          ],
        ),
      ),
    );
  }
}


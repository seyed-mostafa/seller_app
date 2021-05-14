import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/Objects/Order.dart';
import 'package:intl/intl.dart';
import 'Nav.dart';
import 'package:flutter_switch/flutter_switch.dart';


class OrderPage extends StatefulWidget {
  Restaurant currentRestaurant;
  int index;
  OrderPage(this.currentRestaurant,this.index);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(), 
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: ,horizontal: 15)),
                Text('Ordered by ${widget.currentRestaurant.getOrders()[widget.index].getCustomerName()}'),
                Column(
                  children: [
                    Text('Order Date '),
                    Text('Delivery Date '),
                  ],
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}

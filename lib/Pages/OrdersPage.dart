

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/Objects/Order.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {

Restaurant currentRestaurant;

  Orders( this.currentRestaurant);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  showOrder(index){

    widget.currentRestaurant.getOrders()[index].setTime();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FlatButton(
          color: widget.currentRestaurant.getOrders()[index].getStatus()==true ? Colors.white:theme.yellow,
          child: Row(
            children: [
              Text(DateFormat('kk:mm\nEEE d MMM').format(widget.currentRestaurant.getOrders()[index].getTime())),
              Spacer(),
              Text(widget.currentRestaurant.getOrders()[index].getCustomerName()),
              Spacer(),
              Column(
                children: [

                ],
              ),
              Spacer(),
              Text(widget.currentRestaurant.getOrders()[index].getPrice().toString()+'T'),

            ],
          ),
          onPressed: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => FoodPage(
            //         widget.currentRestaurant,
            //         index
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: List.generate(widget.currentRestaurant.getOrders().length, (index) => showOrder(index)),
        )
    );
  }
}

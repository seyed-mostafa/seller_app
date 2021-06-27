import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:intl/intl.dart';
import 'package:seller_app/data/Data.dart';
import 'Nav.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'OrderPage.dart';

class Orders extends StatefulWidget {

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  Restaurant currentRestaurant= Data.restaurant;
  TextStyle _style=TextStyle(fontSize: 11);

  name_date(index){
    return Container(
      width: 60,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: 'by ',
                style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                children: <TextSpan>[
                  TextSpan(
                    text: currentRestaurant
                        .getOrders()[index]
                        .getCustomerName(),
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
            child: Container(
              child: Text(
                  currentRestaurant
                  .getOrders()[index]
                  .getOrderTime()),
            ),
          ),
        ],
      ),
    );
  }

  detail1(index) {
    double _width=100;
    Iterable<Food> keys =
        currentRestaurant.getOrders()[index].getOrder().keys;
    switch (currentRestaurant.getOrders()[index].getOrder().length) {
      case 1:
        {
          return Container(
            width: _width,
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   ',
                  style:_style,),
                ]),
              ],
            ),
          );
        }
        break;
        case 2:{
          return Container(
            width: _width,
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   ',
                    style:_style,),
                ]),
                Row(children: [
                  Text('${keys.elementAt(1).getName()}   ',
                    style:_style,),
                ]),
              ],
            ),
          );
        }
        case 3:{
          return Container(
            width: _width,
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   ',
                    style:_style,),
                ]),
                Row(children: [
                  Text('${keys.elementAt(1).getName()}   ',
                    style:_style,),
                ]),
                Row(children: [
                  Text('${keys.elementAt(2).getName()}   ',
                    style:_style,),
                ]),
              ],
            ),
          );
      }
        default:{
          return Container(
            width: _width,
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   ',
                    style:_style,),
                ]),
                Row(children: [
                  Text('${keys.elementAt(1).getName()}   ',
                    style:_style,),
                ]),
                Row(children: [
                  Text('and so more',
                    style:_style,),
                ]),
              ],
            ),
          );
      }
    }
  }

  detail2(index) {
    double _width=20;
    Iterable<Food> keys =
        currentRestaurant.getOrders()[index].getOrder().keys;
    switch (currentRestaurant.getOrders()[index].getOrder().length) {
      case 1:
        {
          return Container(
            width: _width,
            child: Column(
              children: [
                Row(children: [
                  Text(currentRestaurant
                      .getOrders()[index]
                      .getOrder()[keys.elementAt(0)]
                      .toString(),
                    style:_style)
                ]),
              ],
            ),
          );
        }
        break;
      case 2:{
        return Container(
          width: _width,
          child: Column(
            children: [
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString(),
                    style:_style)
              ]),
            ],
          ),
        );
      }
      case 3:{
        return Container(
          width: _width,
          child: Column(
            children: [
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(2)]
                    .toString(),
                    style:_style)
              ]),
            ],
          ),
        );
      }
      default:{
        return Container(
          width: _width,
          child: Column(
            children: [
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString(),
                    style:_style)
              ]),
            ],
          ),
        );
      }

    }
  }

  price(index){
    return Container(
      child: Column(
        children: [
          Text(currentRestaurant
              .getOrders()[index]
              .getPrice()
              .toString() +
              'T'),
          SizedBox(height: 10,),
           FlutterSwitch(
            height: 20.0,
            width: 40.0,
            padding: 4.0,
            toggleSize: 15.0,
            borderRadius: 10.0,
            inactiveColor: theme.black,
            activeColor: theme.yellow,
            value:currentRestaurant.getOrders()[index].getDelivered(),
            onToggle: (value) {
              setState(() {
                currentRestaurant.getOrders()[index].setDelivered();
                currentRestaurant.arrange();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Nav()
                    ),
                );
              }
              );
            },
          ),
        ],
      ),
    );
  }


  showOrder(index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FlatButton(
          color: currentRestaurant.getOrders()[index].getDelivered() == true
              ? Colors.white
              : theme.yellow,
          child: Row(
            children: [
              name_date(index),
              Spacer(flex: 10,),
              detail1(index),
              detail2(index),
              Spacer(flex: 10,),
              price(index),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPage(
                    currentRestaurant,
                    index
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: List.generate(currentRestaurant.getOrders().length,
          (index) => showOrder(index)),
    ));
  }
}



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

import 'OrderPage.dart';

class Orders extends StatefulWidget {
  Restaurant currentRestaurant;

  Orders(this.currentRestaurant);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

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
                    text: widget.currentRestaurant
                        .getOrders()[index]
                        .getCustomerName(),
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  )
                ]),
          ),
          //Padding(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 0)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
            child: Container(
              child: Text(DateFormat('EEE d MMM\nkk:mm').format(widget
                  .currentRestaurant
                  .getOrders()[index]
                  .getTime())),
            ),
          ),
        ],
      ),
    );
  }

  detail1(index) {
    double _width=100;
    Iterable<Food> keys =
        widget.currentRestaurant.getOrders()[index].getOrder().keys;
    switch (widget.currentRestaurant.getOrders()[index].getOrder().length) {
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
        widget.currentRestaurant.getOrders()[index].getOrder().keys;
    switch (widget.currentRestaurant.getOrders()[index].getOrder().length) {
      case 1:
        {
          return Container(
            width: _width,
            child: Column(
              children: [
                Row(children: [
                  Text(widget.currentRestaurant
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
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(widget.currentRestaurant
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
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(widget.currentRestaurant
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
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString(),
                    style:_style)
              ]),
              Row(children: [
                Text(widget.currentRestaurant
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
    bool _bool=widget.currentRestaurant.getOrders()[index].getStatus();
    return Container(
      child: Column(
        children: [
          Text(widget.currentRestaurant
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
            value:widget.currentRestaurant.getOrders()[index].getStatus(),
            onToggle: (value) {
              setState(() {
                widget.currentRestaurant.getOrders()[index].setStatus();
                widget.currentRestaurant.arrange();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Nav(widget.currentRestaurant)
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
          color: widget.currentRestaurant.getOrders()[index].getStatus() == true
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
                    widget.currentRestaurant,
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
      children: List.generate(widget.currentRestaurant.getOrders().length,
          (index) => showOrder(index)),
    ));
  }
}



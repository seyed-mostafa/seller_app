import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/Objects/Order.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  Restaurant currentRestaurant;

  Orders(this.currentRestaurant);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  detail1(index) {
    Iterable<Food> keys =
        widget.currentRestaurant.getOrders()[index].getOrder().keys;
    switch (widget.currentRestaurant.getOrders()[index].getOrder().length) {
      case 1:
        {
          return Container(
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   '),
                ]),
              ],
            ),
          );
        }
        break;
        case 2:{
          return Container(
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   '),
                ]),
                Row(children: [
                  Text('${keys.elementAt(1).getName()}   '),
                ]),
              ],
            ),
          );
        }
        case 3:{
          return Container(
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   '),
                ]),
                Row(children: [
                  Text('${keys.elementAt(1).getName()}   '),
                ]),
                Row(children: [
                  Text('${keys.elementAt(2).getName()}   '),
                ]),
              ],
            ),
          );
      }
        default:{
          return Container(
            child: Column(
              children: [
                Row(children: [
                  Text('${keys.elementAt(0).getName()}   '),
                ]),
                Row(children: [
                  Text('${keys.elementAt(1).getName()}   '),
                ]),
                Row(children: [
                  Text('and so more'),
                ]),
              ],
            ),
          );
      }
    }
  }


  detail2(index) {
    Iterable<Food> keys =
        widget.currentRestaurant.getOrders()[index].getOrder().keys;
    switch (widget.currentRestaurant.getOrders()[index].getOrder().length) {
      case 1:
        {
          return Container(
            child: Column(
              children: [
                Row(children: [
                  Text(widget.currentRestaurant
                      .getOrders()[index]
                      .getOrder()[keys.elementAt(0)]
                      .toString())
                ]),
              ],
            ),
          );
        }
        break;
      case 2:{
        return Container(
          child: Column(
            children: [
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString())
              ]),
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString())
              ]),
            ],
          ),
        );
      }
      case 3:{
        return Container(
          child: Column(
            children: [
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString())
              ]),
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString())
              ]),
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(2)]
                    .toString())
              ]),
            ],
          ),
        );
      }
      default:{
        return Container(
          child: Column(
            children: [
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(0)]
                    .toString())
              ]),
              Row(children: [
                Text(widget.currentRestaurant
                    .getOrders()[index]
                    .getOrder()[keys.elementAt(1)]
                    .toString())
              ]),
            ],
          ),
        );
      }

    }
  }

  detail3(){
    return Container(
      child: SizedBox(
        height: 40,
      ),
    );
  }

  showOrder(index) {
    int detailNumber =
        widget.currentRestaurant.getOrders()[index].getOrder().length;
    widget.currentRestaurant.getOrders()[index].setTime();
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
              Column(
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
                            style: TextStyle(color: Colors.black, fontSize: 12),
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
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [detail1(index)],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [detail2(index)],
              ),
              Spacer(),
              Column(
                children: [
                  Text(widget.currentRestaurant
                          .getOrders()[index]
                          .getPrice()
                          .toString() +
                      'T'),
                ],
              )
            ],
          ),
          onPressed: () {
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
      children: List.generate(widget.currentRestaurant.getOrders().length,
          (index) => showOrder(index)),
    ));
  }
}

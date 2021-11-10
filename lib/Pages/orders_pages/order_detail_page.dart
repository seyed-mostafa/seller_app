import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/constants/appbar.dart';
import 'map_showonly_page.dart';

class OrderDetailPage extends StatefulWidget {
  final Restaurant currentRestaurant;
  final int index;
  OrderDetailPage(this.currentRestaurant, this.index);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  table() {
    return Column(
      children: [
        DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Food name'),
            ),
            DataColumn(numeric: true, label: Text('Num')),
            DataColumn(numeric: true, label: Text('Price')),
          ],
          rows: widget.currentRestaurant
              .getOrders()[widget.index]
              .getOrder()
              .entries
              .map(
                (e) => DataRow(cells: [
                  DataCell(Text(e.key.getName())),
                  DataCell(Text(e.value.toString())),
                  DataCell(Text(
                      (e.key.getPriceWithDiscount() * e.value).toString())),
                ]),
              )
              .toList(),
        ),
        Container(
            child: Text(
                'Total : ${widget.currentRestaurant.getOrders()[widget.index].getPrice()}'))
      ],
    );
  }

  address() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width * 4 / 5,
      //width: MediaQuery.of(context).size.width / 2,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Column(
              children: [
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: ' Customer address : ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: widget.currentRestaurant
                          .getOrders()[widget.index]
                          .getCustomerAddress()
                          .getAddress(),
                    ),
                  ]),
                )
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.map,
                    color: theme.yellow,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => //TODO
                                MapShowOnlyPage(widget.currentRestaurant
                                    .getOrders()[widget.index])));
                  })
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Text(
                  'Ordered by ${widget.currentRestaurant.getOrders()[widget.index].getCustomerName()}',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                Text(
                  'Order date : ${widget.currentRestaurant.getOrders()[widget.index].getOrderTime()}',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                widget.currentRestaurant
                            .getOrders()[widget.index]
                            .getDelivered() ==
                        true
                    ? Text(
                        'Delivery date : ${widget.currentRestaurant.getOrders()[widget.index].getDeliveryTime()}',
                        style: TextStyle(fontSize: 18),
                      )
                    : Text(
                        'Not yet delivered',
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      ),
                table(),
                address(),
              ],
            ),
          ),
        ));
  }
}

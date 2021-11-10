import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/orders_pages/selling_statistic_page.dart';

import 'orders_list_page.dart';

class OrdersBasePage extends StatefulWidget {
  @override
  _OrdersBasePageState createState() => _OrdersBasePageState();
}

class _OrdersBasePageState extends State<OrdersBasePage> {
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
                    Tab(
                      child: Row(
                        children: [Icon(Icons.people), Text(" Orders")],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.calculate),
                          Text(" Selling & Satisfaction")
                        ],
                      ),
                    ),
                  ])
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrdersListPage(),
            SellingStatisticPage(),
          ],
        ),
      ),
    );
  }
}

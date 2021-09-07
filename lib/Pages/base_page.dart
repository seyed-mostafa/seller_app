import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/comments_pages/comments_list_page.dart';
import 'package:seller_app/Pages/menu_pages/menu_page.dart';
import 'package:seller_app/Pages/orders_pages/orders_base_page.dart';
import 'package:seller_app/constants/appbar.dart';

import 'menu_pages/add_food_page.dart';

class BasePage extends StatefulWidget {
  final int index;

  BasePage(this.index);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  @override
  initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  showScreen() {
    if (_selectedIndex == 0) {
      return Stack(
        children: [
          MenuPage(),

          //add button
          Positioned(
              height: 50,
              right: 10,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[900],
                ),
                child: TextButton(
                  child: Icon(
                    Icons.add,
                    color: theme.yellow,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AddFood()));
                  },
                ),
              ))
        ],
      );
    } else if (_selectedIndex == 1) {
      return OrdersBasePage();
    } else if (_selectedIndex == 2) {
      return CommentsPage();
    }
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget drawerTitleWidget() {
      return Container(
        height: 90,
        color: theme.black,
        child: Center(
            child: Text(
          "Foodina",
          style: TextStyle(color: theme.yellow, fontSize: 30),
        )),
      );
    }

    Widget ConnectUs() {
      return Container(
        color: Colors.red,
        child: TextButton(
            onPressed: () {}, child: Text("We will happy if connect to us")),
      );
    }

    return Scaffold(
      appBar: appBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            drawerTitleWidget(),
            SizedBox(
              height: 50,
            ),
            ConnectUs(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: theme.white,
        backgroundColor: theme.yellow,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comments',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: theme.black,
        onTap: _onItemTap,
      ),
      body: showScreen(),
    );
  }
}

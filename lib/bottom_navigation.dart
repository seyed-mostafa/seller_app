
//BottomNavigationBar with change color and animation

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Comment.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/CommentsPage.dart';
import 'package:seller_app/Pages/MenuPage.dart';
import 'package:seller_app/Pages/OrdersPage.dart';

import 'Objects/Restaurant.dart';

class bottom_navigation extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  bottom_navigation(this.restaurants, this.currentRestaurant);

  @override
  _bottom_navigationState createState() => _bottom_navigationState();
}
class _bottom_navigationState extends State<bottom_navigation> {
  static int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
      if(_selectedIndex == 0){//foodMenu
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FoodMenu(
                  widget.restaurants,
                  widget.currentRestaurant
                )
            )
        );
      }else if(_selectedIndex == 1){//Orders
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Orders(
                widget.restaurants,
                widget.currentRestaurant
            )
            )
        );
      }else if(_selectedIndex == 2){//Comments
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CommentsPage(
                widget.restaurants,
                widget.currentRestaurant
            ))
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      unselectedItemColor: theme.black,
      items:
      const <BottomNavigationBarItem>[
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
      selectedItemColor: theme.yellow,
      onTap: _onItemTapped,
    );
  }
}
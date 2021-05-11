
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/CommentsPage.dart';
import 'package:seller_app/Pages/OrdersPage.dart';
import 'package:seller_app/Pages/tabBar.dart';
import 'package:seller_app/appBar.dart';



class Nav extends StatefulWidget {

  Restaurant currentRestaurant;
  Nav(this.currentRestaurant);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 0;

  showScreen(){
    if(_selectedIndex == 0){
      return tabBar( widget.currentRestaurant);
    }else if(_selectedIndex == 1){
      return Orders( widget.currentRestaurant);
    }else if(_selectedIndex == 2){
      return CommentsPage( widget.currentRestaurant);
    }
  }

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: _onItemTap,
      ),
      body: showScreen(),
    );
  }
}

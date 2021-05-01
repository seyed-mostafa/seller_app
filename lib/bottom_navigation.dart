
//BottomNavigationBar with change color and animation

import 'package:flutter/material.dart';
import 'theme.dart';


class bottom_navigation extends StatefulWidget {
  const bottom_navigation({Key key}) : super(key: key);
  @override
  _bottom_navigationState createState() => _bottom_navigationState();
}
class _bottom_navigationState extends State<bottom_navigation> {
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/CommentsPage.dart';
import 'package:seller_app/Pages/OrdersPage.dart';
import 'package:seller_app/Pages/tabBar.dart';
import 'package:seller_app/Pages/tabBarOrders.dart';
import 'package:seller_app/appBar.dart';

import 'AddFoodPage.dart';



class Nav extends StatefulWidget {

  Restaurant currentRestaurant;
  Nav(this.currentRestaurant);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 1;

  showScreen(){
    if(_selectedIndex == 0){//Menu
      return Stack(
        children: [
          tabBar( widget.currentRestaurant),

          //add button
          Positioned(
              height: 50,
              right: 10,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: TextButton(
                  child: Icon(Icons.add, color: theme.yellow,),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddFood( widget.currentRestaurant)));
                  },
                ),
              )
          )
        ],
      );
    }else if(_selectedIndex == 2){//Orders
      return tabBarOrders( widget.currentRestaurant);
    }else if(_selectedIndex == 1){//Comments
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

    Widget drawerTitleWidget(){
      return Container(
        height: 90,
        color: theme.black,
        child: Center(
            child: Text(
              "Foodina",
              style: TextStyle(color: theme.yellow, fontSize: 30),
            )
        ),
      );
    }

    Widget ConnectUs(){
      return Container(
        color: Colors.red,
        child: TextButton(
            onPressed: (){

            },
            child: Text("We will happy if connect to us")
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            drawerTitleWidget(),
            SizedBox(height: 50,),
            ConnectUs(),
          ],
        ),
      ),
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

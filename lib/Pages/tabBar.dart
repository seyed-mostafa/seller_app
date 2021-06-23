//
//
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seller_app/Objects/Customer.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/FoodPage.dart';
import 'package:seller_app/Pages/MenuPage.dart';
import 'package:seller_app/Pages/MenuType.dart';
import 'package:seller_app/data/Data.dart';
//
// class tabBar extends StatefulWidget {
//
//   Restaurant currentRestaurant;
//
//   tabBar(this.currentRestaurant);
//
//   @override
//   _tabBarState createState() => _tabBarState();
// }
//
// class _tabBarState extends State<tabBar> {
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 11,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: theme.white,
//           toolbarHeight: 50,
//           flexibleSpace: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TabBar(
//                 indicatorSize: TabBarIndicatorSize.label,
//                 labelColor: theme.black,
//                 indicatorColor: theme.yellow,
//                 isScrollable: true,
//                   tabs: [
//                     Tab(child: Row(children: [Icon(Icons.all_inbox_sharp), Text(" All Food")],),),
//                     //if(widget.currentRestaurant.getTypeFoods().contains(TypeFood.Pizza))
//                     Tab(child: Row(children: [Icon(Icons.local_pizza), Text(" Pizza")],),),
//                     Tab(child: Row(children: [Icon(Icons.fastfood), Text(" Sandwich")],),),
//                     Tab(child: Row(children: [Icon(Icons.free_breakfast_outlined), Text(" Drinks")],),),
//                     Tab(child: Row(children: [Icon(Icons.food_bank_rounded), Text(" Persian Food")],),),
//                     Tab(child: Row(children: [Icon(Icons.no_food_outlined), Text(" Dessert")],),),
//                     Tab(child: Row(children: [Icon(Icons.fastfood_outlined), Text(" Appetizer")],),),
//                     Tab(child: Row(children: [Icon(Icons.local_fire_department_outlined), Text(" Fried")],),),
//                     Tab(child: Row(children: [Icon(Icons.set_meal), Text(" Steak")],),),
//                     Tab(child: Row(children: [Icon(Icons.breakfast_dining), Text(" Breakfast")],),),
//                     Tab(child: Row(children: [Icon(Icons.food_bank_rounded), Text(" International")],),),
//                   ]
//               )
//             ],
//           ),
//         ),
//         backgroundColor: theme.black,
//         body: TabBarView(
//           children: [
//             FoodMenu( widget.currentRestaurant),
//             MenuType(widget.currentRestaurant, TypeFood.Pizza),
//             MenuType(widget.currentRestaurant, TypeFood.Sandwich),
//             MenuType(widget.currentRestaurant, TypeFood.Drinks),
//             MenuType(widget.currentRestaurant, TypeFood.PersianFood),
//             MenuType(widget.currentRestaurant, TypeFood.Dessert),
//             MenuType(widget.currentRestaurant, TypeFood.Appetizer),
//             MenuType(widget.currentRestaurant, TypeFood.Fried),
//             MenuType(widget.currentRestaurant, TypeFood.Steaks),
//             MenuType(widget.currentRestaurant, TypeFood.Breakfast),
//             MenuType(widget.currentRestaurant, TypeFood.International),
//           ],
//         ),
//       ),
//     );
//   }
// }


class RestaurantMenu extends StatefulWidget {


  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  Restaurant currentRestaurant= Data.restaurants[0];

  String searchingText = "";
  TypeFood chosenType = TypeFood.all;

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    imageWidget(index){
      return Stack(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.20,
            // width: MediaQuery.of(context).size.width * 0.40,
            padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/food2.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          currentRestaurant.
          getMenu()[index].getDiscount() != null ?
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5)
              ),
              margin: EdgeInsets.fromLTRB(5, 10, 10, 10),

              child: Text("${currentRestaurant.
              getMenu()[index].getDiscount()}%", style: TextStyle(color: Colors.white),),
            ),
          ):
          Container()
        ],
      );
    }

    dataFoodWidget(index){
      return Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(currentRestaurant.getMenu()[index].getName()),
            Text("${currentRestaurant.getMenu()[index].getPrice().toString()} T"),
          ],
        ),
      );
    }

    iconWidget(index){
      return Column(
        children: [
          IconButton(
              icon: Icon(
                currentRestaurant.getMenu()[index].getAvailable()?Icons.check_circle_rounded:Icons.circle,
                color: currentRestaurant.getMenu()[index].getAvailable()?Colors.greenAccent:Colors.redAccent,
              ),
              onPressed: (){
                currentRestaurant.getMenu()[index].setAvailable(!currentRestaurant.getMenu()[index].getAvailable());
                setState(() {});
              }
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                currentRestaurant.getMenu().removeAt(index);
                setState(() {});
              }
          )
        ],
      );
    }

    Widget showFood(index){
      return Container(
        width: _size.width/2,
        padding: const EdgeInsets.all(2),
        child: TextButton(
          child: Column(
            children: [
              imageWidget(index),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dataFoodWidget(index),
                  iconWidget(index)
                ],
              )
            ],
          ),
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                  0 // ToDo
                ),
              ),
            );
          },
        ),
      );
    }

    Widget building(){
      return Container(
        height: _size.height,
        width: _size.width,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for(int i = 0; i < currentRestaurant.getMenu().length; i++)
              if(searchingText == "" || currentRestaurant.getMenu()[i].getName().contains(searchingText))
                if(chosenType == TypeFood.all || currentRestaurant.getMenu()[i].getTypeFood() == chosenType)
                  showFood(i)
          ],
        ),
      );
    }

    Widget searching(){
      return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: TextField(
          cursorColor: theme.black,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10),
                ),
                borderSide: new BorderSide(
                  color: theme.black,
                  width: 1.0,
                ),
              ),
              fillColor: theme.yellow,
              filled: true,
              hintText: "search your restaurant",
              labelStyle: TextStyle(fontSize: 18,)
          ),
          onChanged: (String value){
            setState(() {
              searchingText = value;
              print(searching);
            });
          },
        ),
      );
    }

    Widget typeWidget(TypeFood typeFood, Icon icon){
      return Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(10)
        ),
        width: _size.width * 0.25 + typeFood.toString().length,
        child: TextButton(
          child: Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                icon,
                typeFood != TypeFood.all ? Text("  " + typeFood.toString().substring(9),
                    style: TextStyle(fontSize: _size.width * 0.03,
                    color: theme.black
                    )
                ):Text("  " + "AllFood",
                  style: TextStyle(fontSize: _size.width * 0.03,
                  color: theme.black
                  ),
                )
              ],
            ),
          ),
          onPressed: (){
            setState(() {
              chosenType = typeFood;
            });
          },
        ),
      );
    }

    Widget chooseType(){
      return Container(
        height: 50,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              //here null means all type
              typeWidget(TypeFood.all, Icon(Icons.assignment_turned_in_rounded, color: theme.yellow)),
              typeWidget(TypeFood.Pizza, Icon(FontAwesomeIcons.pizzaSlice, color: theme.yellow)),
              typeWidget(TypeFood.Sandwich, Icon(FontAwesomeIcons.hotdog, color: theme.yellow)),
              typeWidget(TypeFood.Drinks, Icon(FontAwesomeIcons.cocktail, color: theme.yellow)),
              typeWidget(TypeFood.PersianFood, Icon(Icons.food_bank, color: theme.yellow)),
              typeWidget(TypeFood.Dessert, Icon(Icons.no_food, color: theme.yellow)),
              typeWidget(TypeFood.Appetizer, Icon(Icons.fastfood, color: theme.yellow)),
              typeWidget(TypeFood.Fried, Icon(Icons.local_fire_department, color: theme.yellow)),
              typeWidget(TypeFood.Steaks, Icon(Icons.set_meal, color: theme.yellow)),
              typeWidget(TypeFood.Breakfast, Icon(Icons.breakfast_dining, color: theme.yellow)),
              typeWidget(TypeFood.International, Icon(Icons.food_bank, color: theme.yellow)),
            ]
        ),
      );
    }

    return ListView(children:[
      searching(),
      chooseType(),
      building()
    ] );
  }
}

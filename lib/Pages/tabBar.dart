//
//
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seller_app/Objects/Customer.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/FoodPage.dart';
import 'package:seller_app/Pages/MenuPage.dart';
import 'package:seller_app/Pages/MenuType.dart';
import 'package:seller_app/data/Data.dart';
import 'package:seller_app/data/Restaurent.dart';


class RestaurantMenu extends StatefulWidget {


  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  Restaurant currentRestaurant = Data.restaurant;

  String searchingText = "";
  TypeFood chosenType = TypeFood.all;

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    imageWidget(index) {
      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/food/" + Data.restaurant.getMenu()[index].getName() + ".jpg",
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }

    dataFoodWidget(index){
      return Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(currentRestaurant.getMenu()[index].getName()),
            Text("${currentRestaurant.getMenu()[index].getPrice().toString()} T"),
          ],
        ),
      );
    }

    iconWidget(index){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ),
          IconButton(
              icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(
                      index // food index in menu
                  ),
                ),
              );
            },
          )
        ],
      );
    }

    Widget showFood(index) {
      return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: theme.yellow,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Column(
          children: [
            imageWidget(index),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dataFoodWidget(index),
                iconWidget(index)
              ],
            )
          ],
        ),
      );
    }

    Widget building(){
      return Container(
        height: _size.height,
        width: _size.width,
        child: GridView.count(
          childAspectRatio: 0.9, //default shape of gridview is square and this change fraction of length and with
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

    Widget body() {
      return ListView(children:[
        searching(),
        chooseType(),
        SizedBox(height: 10,),
        building()
      ] );
    }
    return body();
  }
}

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'AddFoodPage.dart';
import 'FoodPage.dart';

class PizzaMenu extends StatefulWidget {

Restaurant currentRestaurant;

  PizzaMenu( this.currentRestaurant);

  @override
  _PizzaMenuState createState() => _PizzaMenuState();
}

class _PizzaMenuState extends State<PizzaMenu> {

  bool isInteger(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = int.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }

  List<String> foodType = [];

  imageWidget(index){
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width/3,
          padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/'+(index+1).toString()+".jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        widget.currentRestaurant.
        getMenu()[index].getDiscount() != null ?
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5)
            ),
            margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
            child: Text("${widget.currentRestaurant.
            getMenu()[index].getDiscount()}%", style: TextStyle(color: Colors.white),),
          ),
        ):
        Container()
      ],

    );
  }

  dataFoodWidget(index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.currentRestaurant.getMenu()[index].getName()),
        Text(""),
        Text("Price : ${widget.currentRestaurant.getMenu()[index].getPrice().toString()}"),
      ],
    );
  }

  iconWidget(index){
    return Column(
      children: [
        IconButton(
            icon: Icon(
              widget.currentRestaurant.getMenu()[index].getAvailable()?Icons.check_circle_rounded:Icons.circle,
              color: widget.currentRestaurant.getMenu()[index].getAvailable()?Colors.greenAccent:Colors.redAccent,
            ),
            onPressed: (){
              widget.currentRestaurant.getMenu()[index].setAvailable(!widget.currentRestaurant.getMenu()[index].getAvailable());
              setState(() {});
            }
        ),
        IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              widget.currentRestaurant.getMenu().removeAt(index);
              setState(() {});
            }
        )
      ],
    );
  }

  Widget showFood(index){
    return Container(
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          color: Colors.amber,
          child: Row(
            children: [
              imageWidget(index),
              dataFoodWidget(index),
              Spacer(),
              iconWidget(index),
            ],
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                    widget.currentRestaurant,
                    index
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  final myChildren = <Widget>[];

  void childrenReturner(){
    for(int i = 0; i < widget.currentRestaurant.getMenu().length; i++)
      if(widget.currentRestaurant.getMenu()[i].getTypeFood() == TypeFood.Pizza){
        myChildren.add(showFood(i));
      }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: ListView(
              children: List.generate(
                widget.currentRestaurant.getMenu().length,
                (index) => widget.currentRestaurant.getMenu()[index].getTypeFood() == TypeFood.Pizza?
                showFood(index) : Container()
              ),
            )
        ),
      ],
    );
  }
}

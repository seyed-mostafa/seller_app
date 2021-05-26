
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'AddFoodPage.dart';
import 'FoodPage.dart';

class FoodMenu extends StatefulWidget {

  Restaurant currentRestaurant;

  FoodMenu(this.currentRestaurant);

  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {

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
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/'+(index+1).toString()+".jpg",
              fit: BoxFit.fill,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.currentRestaurant.getMenu()[index].getName()),
        Text("${widget.currentRestaurant.getMenu()[index].getPrice().toString()}"),
      ],
    );
  }

  iconWidget(index){
    return Row(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dataFoodWidget(index),
                  iconWidget(index),
                ],
              )
            ],
          ),
          onPressed: (){
            Navigator.pushReplacement(
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListView(
            children: List.generate(widget.currentRestaurant.getMenu().length, (index) => showFood(index)),
          )
        ),
      ],
    );
  }
}

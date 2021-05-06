

import 'package:flutter/material.dart';
import 'package:seller_app/appBar.dart';
import 'Classes/Food.dart';

class FoodPage extends StatefulWidget {

  List<Food> foods = [];
  int currentIndex = 0;

  FoodPage(this.foods, this.currentIndex);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/1.jpg",
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/2,
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amberAccent,
                      width: 5,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Text(
                      widget.foods[widget.currentIndex].getDescription(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(widget.foods[widget.currentIndex].getPrice().toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

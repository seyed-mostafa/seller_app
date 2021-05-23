import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/MenuPage.dart';
import 'package:seller_app/Pages/Nav.dart';
import 'package:seller_app/Pages/tabBar.dart';
import 'package:seller_app/appBar.dart';
import 'AddFoodPage.dart';


class FoodPage extends StatefulWidget {
  Restaurant currentRestaurant;
  int currentFood;

  FoodPage(this.currentRestaurant, this.currentFood);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int state = 1;
  int like = 0;

  //permission for back to menu
  bool _nameIsValid = true, _priceIsValid = true;

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

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

    Widget imageWidget(){
      return Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/1.jpg',
          fit: BoxFit.cover,
        ),
      );
    }

    Widget namePriceWidget(){
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 15
        ),
        child: Column(
          children: [
            Row(children: [
              Spacer(),
              Container(
                width: _size.width/3,
                child: TextFormField(//Food Name
                  initialValue: widget.currentRestaurant.
                    getMenu()[widget.currentFood].getName(),
                  cursorColor: theme.black,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10),
                        ),
                        borderSide: new BorderSide(
                          color: theme.black,
                          width: 1.0,
                        ),
                      ),
                  ),
                  onChanged: (value){
                    setState(() {
                      widget.currentRestaurant.getMenu()[widget.currentFood].
                      setName(value);
                    });
                  },
                  autovalidate: true,
                  validator: (String value){
                    if(value.isEmpty || value == '' || value == null){
                      _nameIsValid = false;
                      return "Name cannot be empty";
                    }
                    _nameIsValid = true;
                    return null;
                  },
                ),
              ),
              // Text(
              //   widget.currentRestaurant
              //       .getMenu()[widget.currentFood]
              //       .getName(),
              //
              //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              // ),
              Spacer(
                flex: 10,
              ),
              Container(
                width: _size.width/3,
                child: TextFormField(//Food Price
                  initialValue: widget.currentRestaurant.
                    getMenu()[widget.currentFood].getPrice().toString(),
                  decoration: InputDecoration(
                    suffixText: "T",
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10),
                        ),
                        borderSide: new BorderSide(
                          color: theme.black,
                          width: 1.0,
                        ),
                      ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      widget.currentRestaurant.getMenu()[widget.currentFood].
                      setPrice(int.tryParse(value));
                    });
                  },
                  autovalidate: true,
                  validator: (String value){
                    if(value.isEmpty){
                      _priceIsValid = false;
                      return "Price cannot be empty";
                    } else if(!isInteger(value)){
                      _priceIsValid = false;
                      return "Price is number";
                    }
                    _priceIsValid = true;
                    return null;
                  },
                ),
              ),
              // Text(
              //   widget.currentRestaurant
              //       .getMenu()[widget.currentFood]
              //       .getPrice()
              //       .toString() +
              //       ' T',
              //   style: TextStyle(fontSize: 28),
              // ),
              Spacer(),
            ]),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  'by ',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  widget.currentRestaurant.getName(),
                  style:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Spacer(
                  flex: 10,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget DetailsReviewButtonWidget(){
      return Row(
        children: [
          Spacer(),
          TextButton(
            onPressed: () {
              setState(() {
                state = 1;
              });
            },
            child: Text('Details',
                style: TextStyle(
                  fontSize: 25,
                  color: state == 1 ? theme.yellow : Colors.grey,
                )),
          ),
          Spacer(

          ),
          TextButton(
            onPressed: () {
              setState(() {
                state = 2;
              });
            },
            child: Text('Review',
                style: TextStyle(
                    fontSize: 25,
                    color: state == 2 ? theme.yellow : Colors.grey)),
          ),
          Spacer(),
        ],
      );
    }

    Widget DetailsOrReviewWidget() {
      if (state == 1) {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
                vertical: 15),
            child: Container(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 10,
                      blurRadius: 0.5,
                      offset: Offset(5, 0)
                  )
                ]),
                child: TextFormField(//Food Description
                  initialValue: widget.currentRestaurant.
                    getMenu()[widget.currentFood].getDescription(),
                  maxLines: 8,
                  cursorColor: theme.black,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10),
                      ),
                      borderSide: new BorderSide(
                        color: theme.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    widget.currentRestaurant.getMenu()[widget.currentFood].setDescription(value);
                  },
                ),
                // child: Text(
                //   widget.currentRestaurant
                //       .getMenu()[widget.currentFood]
                //       .getDescription(),
                //   style: TextStyle(color: theme.black, fontSize: 15),
                // ),
              ),
            ));
      } else {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
                vertical: 15),
            child: Container(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 10,
                      blurRadius: 0.5,
                      offset: Offset(0, 0))
                ]),
                child: Text(
                    widget.currentRestaurant
                        .getMenu()[widget.currentFood]
                        .getComment(),
                    style: TextStyle(color: theme.black, fontSize: 15)),
              ),
            ));
      }
    }

    foodData() {
      return ListView(
        children: [
          imageWidget(),
          namePriceWidget(),
          DetailsReviewButtonWidget(),
          DetailsOrReviewWidget(),
          // Positioned(
          //     height: 100,
          //     width: MediaQuery.of(context).size.width,
          //     bottom: 0,
          //     child: Container(
          //
          //       color: theme.yellow,
          //       height: 50,
          //       child: TextButton(
          //
          //         child: Text(
          //           "Edit ",
          //           style: TextStyle(
          //               color: theme.black,
          //               fontSize: 18,
          //               fontWeight: FontWeight.w500),
          //         ),
          //         onPressed: () {
          //           Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => AddFood(
          //                        widget.currentRestaurant)));
          //         },
          //       ),
          //     )),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: (){
            _priceIsValid && _nameIsValid ?
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Nav(widget.currentRestaurant))
            ): null;
          },
        ),
        backgroundColor:Colors.white ,
        title: Text('Foodina',style: TextStyle(color: theme.yellow,
            fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 10,
        iconTheme: IconThemeData(color:theme.yellow),
      ),
      body: foodData(),
    );
  }
}

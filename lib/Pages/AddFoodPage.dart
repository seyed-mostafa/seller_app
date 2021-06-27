
import 'package:flutter/material.dart';
import 'package:seller_app/MultiChoice.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/Nav.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/data/Data.dart';
import 'package:seller_app/data/SocketConnect.dart';


class AddFood extends StatefulWidget {


  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  Restaurant currentRestaurant = Data.restaurant;

  String _inputName = '', _inputDescription = '',
      _inputPrice = '', _inputDiscount = '0', _inputPath = '', _inputTypeFood;
  bool _inputSizing = false, _inputAvailable = false, _inputIsDiscount = false;
  var _formKey = GlobalKey<FormState>();
  List<String> foodType = [];

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

  void _sendMessage() { //format: addFood::name::description::price::discount::typeFood
    print('Connect to server in add food page');
    print(foodType.toString().substring(1, foodType.toString().length - 1));
    SocketConnect.socket.then((value) {
      value.writeln("addFood::" + _inputName
        + "::" + _inputDescription + "::" + _inputPrice
        + "::" + _inputDiscount + "::" + foodType.toString().substring(1, foodType.toString().length-1)); //ToDo typeFood?
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.yellow,),
          onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Nav()))
            ;
          },
        ),
        backgroundColor:Colors.white ,
        title: Text('Foodina',style: TextStyle(color: theme.yellow,
            fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 10,
        iconTheme: IconThemeData(color:theme.yellow),
      ),
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        TextFormField(//Food Name
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
                              fillColor: theme.yellow,
                              filled: true,
                              icon: Icon(Icons.drive_file_rename_outline),
                              labelText: "Food Name",
                              labelStyle: TextStyle(fontSize: 18)
                          ),
                          onSaved: (String value) => _inputName = value,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(//Food Description
                          maxLines: 2,
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
                              fillColor: theme.yellow,
                              filled: true,
                              icon: Icon(Icons.drive_file_rename_outline),
                              labelText: "Description (optional)",
                              labelStyle: TextStyle(fontSize: 18)
                          ),
                          onSaved: (String value) => _inputDescription = value,
                        ),
                        SizedBox(height: 10,),
                        TextFormField(//Food Price
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
                              fillColor: theme.yellow,
                              filled: true,
                              icon: Icon(Icons.monetization_on),
                              labelText: "Food Price",
                              labelStyle: TextStyle(fontSize: 18)
                          ),
                          onSaved: (String value) => _inputPrice = value,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Price cannot be empty";
                            } else if(!isInteger(value)){
                              return "Price is number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Do you have any discount?"),
                            IconButton(
                                icon: Icon(
                                  _inputIsDiscount?Icons.check_circle_rounded:Icons.circle,
                                  color: _inputIsDiscount?Colors.greenAccent:Colors.redAccent,
                                ),
                                onPressed: (){
                                  _inputIsDiscount = !_inputIsDiscount;
                                  setState(() {});
                                }
                            ),
                          ],
                        ),
                        _inputIsDiscount? TextFormField(///Food Discount
                          validator: (String value){
                            if(value.isEmpty){
                              return "Discount cannot be empty";
                            } else if(!isInteger(value) ||
                                int.parse(value)<0 ||
                                int.parse(value)>100){
                              return "Discount is integer between 0 to 100";
                            }
                            return null;
                          },
                          onSaved: (String value) => _inputDiscount = value,
                          decoration: InputDecoration(
                              icon: Icon(Icons.card_giftcard),
                              labelText: "Discount Percent",
                              labelStyle: TextStyle(fontSize: 18,)
                          ),
                        ):Container(),

                        SizedBox(height: 30,),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: theme.yellow,
                              primary: theme.black,
                              padding: EdgeInsets.all(20)
                          ),
                          child: Text("Click to choose your foodType"),
                          onPressed: () async {
                            foodType = await showDialog(
                                context: context,
                                builder: (_) => MultiSelectDialog(
                                    question: Text('Select Your FoodType :'),
                                    answers: [
                                      'Pizza',
                                      'Sandwich',
                                      'Drinks',
                                      'Persian Food',
                                      'Dessert',
                                      'Appetizer',
                                      'Fried',
                                      'Steaks',
                                      'Breakfast',
                                      'International'
                                    ])
                            )??[];
                            print(foodType);
                          },
                        ),

                        SizedBox(height: 30,),

                        ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              _formKey.currentState.save();
                              print(_inputName);
                              print(_inputDescription);
                              print(_inputPrice);
                              print(_inputDiscount);
                              currentRestaurant.addMenu(new Food(
                                  _inputName,
                                  _inputDescription,
                                  int.parse(_inputPrice),
                                  int.parse(_inputDiscount),
                                  true,
                                  true,
                                  TypeFood.values
                                      .firstWhere((e) => e.toString() == "TypeFood." +  foodType.toString().substring(1, foodType.toString().length - 1)))
                                 ,
                              );
                              _sendMessage();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav()));
                            }
                            setState(() {});
                          },
                          child: Text("Add Food"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

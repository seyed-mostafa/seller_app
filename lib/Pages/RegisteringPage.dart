
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/appBar.dart';
import 'EnteringPage.dart';
import '../MultiChoice.dart';
import 'dart:io';
import 'package:seller_app/Objects/Restaurant.dart';

class RegisteringPage extends StatefulWidget {

 Function change;

  RegisteringPage(this.change);

  @override
  _RegisteringPageState createState() => _RegisteringPageState();
}

class _RegisteringPageState extends State<RegisteringPage> {

  final _formKey = GlobalKey<FormState>();

  String password = "123";
  String phoneNumber = "456";
  String inputPhoneNumber = '', inputPassword = '',
      inputName = '', inputAddress = '';
  bool validUser = false;
  bool hidden = true;
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: theme.yellow,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: theme.black,
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
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
                        icon: Icon(Icons.food_bank_rounded),
                        labelText: "Restaurant Name",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => inputName = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.map),
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
                          },
                        ),
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
                        icon: Icon(Icons.home_work),
                        labelText: "Address",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Address cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => inputAddress = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
                    autovalidate: true,
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
                        icon: Icon(Icons.phone),
                        labelText: "Phone Number",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.length != 8 ||
                          !isInteger(value) ||
                          value.contains(' ')){
                        return "Phone number should be 8 digit";
                      }
                      return null;
                    },
                    onSaved: (String value) => inputPhoneNumber = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
                    obscureText: hidden,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              !hidden?Icons.visibility:Icons.visibility_off
                          ),
                          onPressed: (){
                            hidden = !hidden;
                            setState(() {});
                          },
                        ),
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
                        icon: Icon(Icons.vpn_key),
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    onChanged: (String value){
                      password = value;
                      setState(() {

                      });
                    },
                    validator: (String value){
                      if(value.length < 6 || value.contains('a')){
                        return "password at least contains 6 letter and number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: theme.yellow,
                        primary: theme.black,
                        padding: EdgeInsets.all(20)
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(inputName);
                        print(inputAddress);
                        print(inputPhoneNumber);
                        print(inputPassword);
                        widget.change(Restaurant(inputName,null,inputPhoneNumber,inputPassword));
                        Navigator.pop(context,);
                      }
                      setState(() {});
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}



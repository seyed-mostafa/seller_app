
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/Map.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/data/Data.dart';
import 'package:seller_app/data/SocketConnect.dart';
import 'EnteringPage.dart';
import '../MultiChoice.dart';
import 'dart:io';
import 'package:seller_app/Objects/Restaurant.dart';

class RegisteringPage extends StatefulWidget {

  LatLng latLng;

  @override
  _RegisteringPageState createState() => _RegisteringPageState();
}

class _RegisteringPageState extends State<RegisteringPage> {

  change(LatLng latLng){
    setState(() {
      widget.latLng=latLng;
    });
  }

  final _formKey = GlobalKey<FormState>();

  Restaurant inputRestaurant;

  String _inputPhoneNumber = '', _inputPassword = '',
      _inputName = '', _inputAddress = '', _inputLongitude = '',
      _inputLatitude = '', _inputRange = '';
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

  void _sendMessage() async { //format: Registering::nameRegistering::phoneNumber::password::address(String)::longitude::latitude::range::foodType1,foodType2,...
    String types = '';
    for(int i = 0; i < foodType.length; i++) { //ToDo currentRestaurant.type.length
      types += foodType[i]+",";
    }
    await SocketConnect.socket.then((value) {
      value.writeln("Registering::" + _inputName
          + "::" + _inputPhoneNumber + "::" + _inputPassword + "::"
          + _inputAddress + "::" + _inputLongitude + "::" + _inputLatitude
          + "::" + _inputRange + "::" + types);
    });
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
                      // for(Restaurant restaurant in widget.restaurants){
                      //   if(restaurant.getName() == inputName)
                      //     return "Name already exist";
                      // }
                      if(value.isEmpty){
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputName = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.map),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Map(change)));
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
                    onSaved: (String value) => _inputAddress = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
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
                        icon: Icon(Icons.cast_sharp),
                        labelText: "Range",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(!isInteger(value)){
                        return "Range is number";
                      }
                      if(value.isEmpty){
                        return "Range cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputRange = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
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
                      // for(Restaurant restaurant in widget.restaurants){
                      //   if(restaurant.getPhoneNumber() == inputPhoneNumber)
                      //     return "PhoneNumber already exist";
                      // }
                      if(value.length != 8 ||
                          !isInteger(value) ||
                          value.contains(' ')){
                        return "Phone number should be 8 digit";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputPhoneNumber = value,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    cursorColor: theme.black,
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
                    onChanged: (String value) {
                      _inputPassword = value;
                      setState(() {

                      });
                    },
                    validator: (String value){
                      if(value.length < 6 || !value.contains(RegExp(r'[a-zA-Z]')) || !value.contains(RegExp(r'[0-9]'))){
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
                        print(_inputName);
                        print(_inputAddress);
                        print(_inputPhoneNumber);
                        print(_inputPassword);
                        Restaurant restaurant=new Restaurant(_inputName,null,_inputPhoneNumber,_inputPassword);
                        // restaurant.setAddress(widget.latLng);
                        // Data.restaurant.add(restaurant);
                        //TODO:transfer new restaurant to server.
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



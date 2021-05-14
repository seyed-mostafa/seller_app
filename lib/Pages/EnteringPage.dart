
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/Nav.dart';
import 'package:seller_app/appBar.dart';
import 'RegisteringPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/Objects/Food.dart';

class EnteringPage extends StatefulWidget {

  List<Restaurant> restaurants = [];



  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {
  List<Restaurant> restaurants = List.empty(growable: true);
  change(Restaurant restaurant){
    setState(() {
    restaurants.add(restaurant);
    });
  }

  //fake Dates
  String password = "123";
  String phoneNumber = "456";

  //input Variable
  String inputPhoneNumberEnter = '', inputPasswordEnter = '';

  String errorMessage = "Phone number Or Password is wrong";
  bool validUser = false;

  //for first time don't show error of input (red container in top)
  bool flag = true;
  File file = File("dataBase.txt");

  //for hide entering password
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: theme.yellow,
            padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
            child: Column(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                        "assets/images/Foodinaw1.jpg",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height/4,
                      width: MediaQuery.of(context).size.width/2,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                validUser||flag ?
                Container(height: 40,):
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 40,
                  child: Center(
                    child: Text(errorMessage,
                      style: TextStyle(color: Colors.white,),),
                  ),
                ),
                SizedBox(height: 20,),
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
                      icon: Icon(Icons.phone),
                      labelText: "phone number",
                      labelStyle: TextStyle(fontSize: 18,)
                  ),
                  onChanged: (String value){
                    inputPhoneNumberEnter = value;
                  },
                ),
                SizedBox(height: 20,),
                TextField(
                  autofocus: true,
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
                      icon: Icon(Icons.vpn_key_sharp),
                      labelText: "password",
                      labelStyle: TextStyle(fontSize: 18)
                  ),
                  onChanged: (String value){
                    inputPasswordEnter = value;
                  },
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 30,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: theme.yellow,
                          primary: theme.black,
                          padding: EdgeInsets.all(20)
                      ),
                      onPressed: (){
                        flag = false;
                        print(inputPhoneNumberEnter);
                        print(inputPasswordEnter);
                        if(inputPhoneNumberEnter == phoneNumber &&
                            inputPasswordEnter == password){
                          validUser=true;
                          int currentRestaurant = 0;
                          file.writeAsString("Registered\nthis is the index of restaurant");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Nav(widget.restaurants[currentRestaurant])),
                          );
                        }else{
                          validUser=false;
                        }
                        setState(() {});
                      },
                      child: Text("Sign in", style: TextStyle(fontSize: 18),),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onPrimary: theme.yellow,
                            primary: theme.black,
                          padding: EdgeInsets.all(20)
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisteringPage(change)),
                          );
                        },
                        child: Text("Sign up", style: TextStyle(fontSize: 18),)
                    ),
                    SizedBox(width: 30,)
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
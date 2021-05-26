import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';


AppBar appBar(){
  return  AppBar(
    backgroundColor: theme.yellow,
    title: Text('Foodina',style: TextStyle(color: theme.white,
        fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
    centerTitle: true,
    elevation: 10,
  iconTheme: IconThemeData(color:theme.yellow),
  );


}

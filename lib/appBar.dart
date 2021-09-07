import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/data/Data.dart';

import 'data/SocketConnect.dart';
import 'data/customerAndRestaurantMaker.dart';

show(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(

            child: CircularProgressIndicator(),
          );
        },
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
  );
}


AppBar appBar(context){
  return  AppBar(
    actions: [
      IconButton(
          icon:Icon( Icons.refresh),
          onPressed: () async {
            String messageServer = "";
            var socket = Socket.connect('10.0.2.2', 8080) ;
            socket.then((serverSocket) async {
              serverSocket.writeln("Seller");
              serverSocket.writeln("Entering::" +
                  Data.restaurant.getPhoneNumber()+
                  "::" +
                  Data.restaurant.getPassword());
              serverSocket.listen((socket) {
                messageServer += String.fromCharCodes(socket).trim();
              });
            });
            show(context);
            await Future.delayed(Duration(seconds: 4)); //stop for listen threading
            if (messageServer.contains("true")) {
              messageServer = messageServer.substring(4); // remove true in start message
              Data.restaurant=null;
              Data.restaurant=null;
              customerAndRestaurantMaker(messageServer);
              SocketConnect.socket=socket;
            }
            Navigator.pop(context, );
          })
    ],
    backgroundColor: theme.yellow,
    title: Text('Foodina',style: TextStyle(color: theme.black,
        fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
    centerTitle: true,
    elevation: 10,
  iconTheme: IconThemeData(color:theme.black),
  );


}

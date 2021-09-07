import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/data/Data.dart';

import '../data/SocketConnect.dart';
import '../data/customerAndRestaurantMaker.dart';

AppBar appBar() {
  return AppBar(
    actions: [
      IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () async {
            String messageServer = "";
            var socket = Socket.connect('10.0.2.2', 8080);
            socket.then((serverSocket) async {
              serverSocket.writeln("Seller");
              serverSocket.writeln("Entering::" +
                  Data.restaurant.getPhoneNumber() +
                  "::" +
                  Data.restaurant.getPassword());
              serverSocket.listen((socket) {
                messageServer += String.fromCharCodes(socket).trim();
              });
            });
            await Future.delayed(
                Duration(seconds: 4)); //stop for listen threading
            if (messageServer.contains("true")) {
              messageServer =
                  messageServer.substring(4); // remove true in start message
              Data.restaurant = null;
              Data.restaurant = null;
              customerAndRestaurantMaker(messageServer);
              SocketConnect.socket = socket;
            }
          })
    ],
    backgroundColor: theme.yellow,
    title: Text('Foodina',
        style: TextStyle(
            color: theme.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic)),
    centerTitle: true,
    elevation: 10,
    iconTheme: IconThemeData(color: theme.black),
  );
}

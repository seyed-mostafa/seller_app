

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/Nav.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/data/SocketConnect.dart';
import 'package:seller_app/data/customerAndRestaurantMaker.dart';
import 'RegisteringPage.dart';

class EnteringPage extends StatefulWidget {



  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {

  //fake Dates
  String password = "123";
  String phoneNumber = "456";

  //input Variable
  String inputPhoneNumberEnter = '', inputPasswordEnter = '';

  String errorMessage = "Phone number Or Password is wrong";
  bool validUser = false;

  Widget animationWait() {
    return SizedBox(
      width: 250.0,
      child: TextLiquidFill(
        text: 'Please Wait',
        waveColor: Colors.black,
        boxBackgroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 100,
      ),
    );
  }

  //for hide entering password
  bool hidden = true;

  bool showWait = false;

  @override
  Widget build(BuildContext context) {

    //for first time don't show error of input (red container in top)
    bool flag = true;

    _sendMessage() async { //format: Entering::phone::password
      String messageServer = "";
      await SocketConnect.socket.then((serverSocket) async {
        print('Connected to Server in Entering Page');
        serverSocket.writeln("Seller");

        serverSocket.writeln("Entering::" +
            inputPhoneNumberEnter +
            "::" +
            inputPasswordEnter);
        serverSocket.listen((socket) {
          messageServer += String.fromCharCodes(socket).trim();
        });
      });
      await Future.delayed(Duration(seconds: 4)); //stop for listen thread
      if (messageServer.contains("true")) {
        validUser = true;
        messageServer = messageServer.substring(4);// remove true in start message
        customerAndRestaurantMaker(messageServer);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Nav(0) // 0 index just for test
          ),
        );
      }
      setState(() {

      });
    }

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: theme.yellow,
          padding: EdgeInsets.fromLTRB(20, 30, 50, 50),
          child: Column(
            children: [
              validUser || flag ? Container(height: 40,) : Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                cursorColor: theme.black,
                autofocus: false,
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
              TextFormField(
                autofocus: false,
                cursorColor: theme.black,
                obscureText: hidden,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                          !hidden?Icons.visibility:Icons.visibility_off
                      ),
                      onPressed: (){
                        hidden = !hidden;
                        setState(() {});
                      },
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
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: theme.yellow,
                    primary: theme.black,
                    padding: EdgeInsets.only(left: 100, right: 100),
                ),
                onPressed: () async {
                  setState(() {
                    showWait = true;
                    flag = true;
                  });
                  print(inputPhoneNumberEnter);
                  print(inputPasswordEnter);
                  _sendMessage();
                  await Future.delayed(Duration(seconds: 5));
                  if (validUser) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          Nav(0) // 0 index just for test
                      ),
                    );
                  }
                  setState(() {flag = false; showWait = false;});
                },
                child: Text("Sign in", style: TextStyle(fontSize: 18),),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: theme.yellow,
                      primary: theme.black,
                      padding: EdgeInsets.only(left: 97, right: 97),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisteringPage()),
                    );
                  },
                  child: Text("Sign up", style: TextStyle(fontSize: 18),)
              ),
              SizedBox(width: 30,),
              if(showWait) animationWait(),
            ],
          ),
        ),
      )
    );
  }
}
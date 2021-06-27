import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/data/Data.dart';

class CommentsPage extends StatefulWidget {


  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  Restaurant currentRestaurant= Data.restaurant;

  comment(index) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/profile/${currentRestaurant.getComments()[index].getCustomerName()}.jpg",
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(currentRestaurant.getComments()[index].getCustomerName(),
                    style: TextStyle(fontSize: 18, color: theme.black)),
                Text(currentRestaurant.getComments()[index].getTimeComment(),
                    style: TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(
                            colors: [theme.yellow2, theme.white],
                          stops:[0,0.8]
                        ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                   currentRestaurant.getComments()[index].getComment(),
                    style: TextStyle(color: theme.black, fontSize: 14),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient( colors: [theme.yellow2, theme.white],
                            stops:[0,0.8]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  bool send = false;
  String str = '';

  replyWrite(index) {
    bool isSend(String value) {
      print(send);
      print('str : $str');
      if (send && str != '' && str != 'Reply...') {
        setState(() {
          send = false;
          str = '';
          currentRestaurant.getComments()[index].setReply(value);
        });
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 9),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: TextFormField(
                  //Food Name
                  decoration: InputDecoration(hintText: 'Reply...'),
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                  cursorColor: theme.black,
                  onChanged: (value) {
                    setState(() {
                      str = value;
                      print('value : $value');
                      isSend(value);
                    });
                  }),
            ),
            IconButton(
                icon: Icon(
                  Icons.send,
                  color: theme.yellow,
                ),
                onPressed: () {
                  setState(() {
                    send = true;
                    isSend(str);
                  });
                })
          ],
        ),
      ),
    );
  }

  replyShow(index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 25,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Reply :",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(
                  width: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/restaurant/"+currentRestaurant.getName()+".jpg",
                    fit: BoxFit.fill,
                    height: 50,
                    width: 50,
                  ),
                ),

                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(currentRestaurant.getName(),
                        style: TextStyle(fontSize: 18, color: theme.black)),
                    Text(currentRestaurant.getComments()[index].getTimeComment(),
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient:
                        LinearGradient( colors: [theme.yellow2, theme.white],
                            stops:[0,0.8]),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        currentRestaurant
                            .getComments()[index]
                            .getReply(),
                        style: TextStyle(color: theme.black, fontSize: 14),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient:
                        LinearGradient( colors: [theme.yellow2, theme.white],
                            stops:[0,0.8]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showComment(index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 16,
      ),
      child: Container(
        child: Column(
          children: [
            comment(index),
            currentRestaurant.getComments()[index].getReply() == null
                ? replyWrite(index)
                : replyShow(index),
            Divider(
              color: theme.red2,
              thickness: 1,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: List.generate(currentRestaurant.getComments().length,
              (index) => showComment(index)),
        ));
  }
}

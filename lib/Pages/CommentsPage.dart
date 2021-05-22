import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/appBar.dart';

class CommentsPage extends StatefulWidget {
  Restaurant currentRestaurant;

  CommentsPage(this.currentRestaurant);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  showComment(index) {
    return Container(
      color: theme.yellow2,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage('assets/images/profile1.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Text(widget.currentRestaurant.getComments()[index].getComment()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentRestaurant.getComments().length);
    return Container(
        child: ListView(
      children: List.generate(widget.currentRestaurant.getComments().length,
          (index) => showComment(index)),
    ));
  }
}

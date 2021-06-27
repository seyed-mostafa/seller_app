

import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Location.dart';
import 'package:seller_app/Objects/Order.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/Comment.dart';
import 'package:seller_app/Objects/Customer.dart';
import 'package:seller_app/data/Data.dart';

import 'Data.dart';

customerAndRestaurantMaker(String messageServer) async {

  List<String> data = messageServer.split("#");

    Restaurant restaurant = new Restaurant(
        data[0],
        new Location(data[1], double.parse(data[3]), double.parse(data[2])),
        data[4],
        data[5]);
    restaurant.addRate((double.parse(data[6]))/1000);
    restaurant.setSendingRangeRadius(int.parse(data[6]));
    restaurant.setId(int.parse(data[7]));
    restaurant.setDays(data[8]);
    restaurant.setHour(data[9]);

    /////////////////////////////////                       type food            /////////////////////

    List<String> type = data[10].split("::");
    for (String string in type) {
      restaurant.addTypeFood(TypeFood.values
          .firstWhere((e) => e.toString() == "TypeFood." + string));
    }

    /////////////////////////////////                       menu            /////////////////////

    List<String> foods = data[11].split(":::");
    for (String food in foods) {
      List<String> menu = food.split("::");
      restaurant.addMenu(new Food(
          menu[0],
          menu[1],
          int.parse(menu[2]),
          int.parse(menu[3]),
          null,
          menu[4] == "true" ? true : false,
          TypeFood.values
              .firstWhere((e) => e.toString() == "TypeFood." + menu[5])));
    }

    /////////////////////////////////                   comments           /////////////////////

    List<String> comments1 = data[12].split(":::");
    for (String com in comments1) {
      List<String> comment = com.split("::");
      if (comment.length == 6)
        restaurant.addComment(new Comment.full(comment[0], comment[1],
            comment[2], comment[3], comment[4], comment[5]));
      else
        restaurant.addComment(
            new Comment.noFull(comment[0], comment[1], comment[2], comment[3]));
    }




  /////////////////////////////////                   orders           /////////////////////

  List<String> orderss = data[13].split("^^");
  for (String ord in orderss) {
    List<String> orders = ord.split("^");
     Order order =new Order.full(
        restaurant.getName(),
       orders[1],
       orders[2],
       new Location(orders[3], double.parse(orders[4]), double.parse(orders[5])),
       restaurant.getAddress().getLocation(),
       int.parse(data[6])
     );
     order.Delivered(data[0]=="true"?true:false);
     foods=data[7].split(":::");
    for (String str in foods) {
      List<String> string=str.split("::");
      String food=string[0];
      int number=int.parse(string[1]);
      for


    }
  }

    Data.restaurant=restaurant;


}


import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/data/Restaurent.dart';
import 'Objects/Comment.dart';
import 'Objects/Customer.dart';
import 'Objects/Restaurant.dart';



void main() {
  Restaurant restaurant3 = new Restaurant('Reihoon', LatLng(33.717676891099835, 25.331243399093914), '09123456782', '123');
  Customer customer1 = new Customer('Ali', 'Alavi', '09123456790', '123');
  Comment comment=new Comment("salam . alan saat 2:21 shabe ke daram in comment ro minivisam:)");
  restaurant3.addComment(comment);
  comment.setRestaurantName("Reihoon");
  customer1.addComment(comment);
  print(comment.getComment());


}


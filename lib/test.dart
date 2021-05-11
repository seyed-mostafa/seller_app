
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/appBar.dart';
import 'package:seller_app/Objects/Order.dart';
import 'package:intl/intl.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




void main() {
  DateTime now = DateTime.now();
  //String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  print(now.hashCode);
  List <int> done= List.empty(growable: true);
  List <int> undone= List.empty(growable: true);
  List <int> undone1= List.empty(growable: true);
  done=[1,2,3];
  undone=[4,5,6];
  undone1=[7,8,9];
  undone+=undone1;
  print(undone);
  done=[...undone];
  print(done);
}
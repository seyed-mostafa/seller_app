/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:seller_app/data/Restaurent.dart';

import 'Objects/Restaurant.dart';



void main() {


   Restaurant restaurant=importRestaurent();
    print(restaurant.getcashSales()[0]);
}


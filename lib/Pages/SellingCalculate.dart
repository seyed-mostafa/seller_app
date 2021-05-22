import 'package:flutter/cupertino.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:seller_app/data/Restaurent.dart';

class SellingCalculate extends StatefulWidget {
  Restaurant restaurant;
  Restaurant currentRestaurent = importRestaurent();

  SellingCalculate(this.restaurant);

  @override
  _SellingCalculateState createState() => _SellingCalculateState();
}

class _SellingCalculateState extends State<SellingCalculate> {
  String dropdownValue = 'Last 7 days sales analysis';
  List<SalesData> _chartData;
  TooltipBehavior _tooltipBehavior;
  List<ChartData> chartData;

  List<SalesData> getChartData7() {
    List<SalesData> chartData7 = new List(7);
    for (int i = 0; i < 7; i++) {
      chartData7[i] = SalesData(
          DateTime(2020, 4, i + 24),
          widget.currentRestaurent.getOnlineSales()[i + 23],
          widget.currentRestaurent.getcashSales()[i + 23],
          widget.currentRestaurent.getTotalSales()[i + 23]);
    }
    return chartData7;
  }

  List<SalesData> getChartData30() {
    List<SalesData> chartData30 = new List(30);
    for (int i = 0; i < 30; i++) {
      chartData30[i] = SalesData(
          DateTime(2020, 4, i),
          widget.currentRestaurent.getOnlineSales()[i],
          widget.currentRestaurent.getcashSales()[i],
          widget.currentRestaurent.getTotalSales()[i]);
    }
    return chartData30;
  }

  List<ChartData> chartData7(){
    List<ChartData> chartData=[
      ChartData('Excellent', 45,'45%',Colors.green[800]),
      ChartData('Good', 30,'20%',Colors.green[500]),
      ChartData('Average',10, '10%',Colors.yellow[700]),
      ChartData('Poor',10, '10%',Colors.orange),
      ChartData('Worst',15, '15%',Colors.red),
    ];
    return chartData;
  }

  dropdownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_sharp),
      iconSize: 22,
      dropdownColor: Colors.white,
      style: TextStyle(color: theme.black, fontSize: 21),
      underline: Container(
        height: 2,
        color: theme.yellow,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Last 7 days sales analysis',
        'Last 30 days sales analysis'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  chart() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    if (dropdownValue == 'Last 7 days sales analysis')
      _chartData = getChartData7();
    else
      _chartData = getChartData30();
    return SfCartesianChart(
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
      series: <ChartSeries<SalesData, DateTime>>[
        LineSeries<SalesData, DateTime>(
          markerSettings: MarkerSettings(
            color: theme.yellow,
            isVisible: true,
            shape: DataMarkerType.circle,
            borderColor: theme.yellow,
            width: 3,
            height: 3,
          ),
          color: theme.black,
          name: 'Total sale',
          dataSource: _chartData,
          xValueMapper: (SalesData sales, _) => sales.day,
          yValueMapper: (SalesData sales, _) => sales.totalsale,
          enableTooltip: true,
        ),
        LineSeries<SalesData, DateTime>(
          markerSettings: MarkerSettings(
              color: theme.black,
              isVisible: true,
              shape: DataMarkerType.circle,
              borderColor: theme.black,
              width: 3,
              height: 3),
          color: theme.yellow,
          name: 'Cash sales',
          dataSource: _chartData,
          xValueMapper: (SalesData sales, _) => sales.day,
          yValueMapper: (SalesData sales, _) => sales.cashsales,
          enableTooltip: true,
        ),
        LineSeries<SalesData, DateTime>(
          markerSettings: MarkerSettings(
              color: theme.black,
              isVisible: true,
              shape: DataMarkerType.circle,
              borderColor: theme.black,
              width: 3,
              height: 3),
          color: theme.red1,
          name: 'Online sales',
          dataSource: _chartData,
          xValueMapper: (SalesData sales, _) => sales.day,
          yValueMapper: (SalesData sales, _) => sales.onlinesales,
          enableTooltip: true,
        ),
      ],
      primaryXAxis: DateTimeCategoryAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(title: AxisTitle(text: "× 1000 T")
          //labelFormat: '{value}M',
          //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)
          ),
    );
  }

  textdata() {
    int status;
    if (dropdownValue == 'Last 7 days sales analysis')
      status=7;
    else
      status=30;
    
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Total cash sales : ${widget.currentRestaurent.getcashSalessum(status)}000 \n"
                      "Total online sales : ${widget.currentRestaurent.getOnlineSalessum(status)}000"),
            SizedBox(width: 5,height: 5),
            Text("Total sale : ${widget.currentRestaurent.getTotalSalessum(status)}000",
                    style: TextStyle(color: theme.red3,fontWeight:FontWeight.w500,fontSize: 18)),
        ],
      ),
    );
  }

  circlechart() {
    chartData=chartData7();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
        color: theme.cream,
          boxShadow:[
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 0.001,
              blurRadius: 15,
            )
          ]
        ),
        child: SfCircularChart(
            legend: Legend(isVisible: true),
            title: ChartTitle(
              text:"Customer satisfaction",
              textStyle: TextStyle(color: theme.yellow,fontSize: 23,fontWeight: FontWeight.bold,),
            ),
            series: <PieSeries<ChartData, String>>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelMapper: (ChartData data, _) => data.z,
                  pointColorMapper: (ChartData data, _) => data.color,
                  dataLabelSettings:DataLabelSettings(isVisible : true,)

              )
            ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                dropdownButton(),
                chart(),
                textdata(),
                circlechart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.day, this.onlinesales, this.cashsales, this.totalsale);

  final DateTime day;
  final int onlinesales, cashsales, totalsale;
}

class ChartData {
  ChartData(this.x, this.y,this.z, [this.color]);
  final String x,z;
  final double y;
  final Color color;
}
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}




class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];
    chartData1(){
      return Container(
        child: SfCircularChart(
            legend: Legend(isVisible: true),
            title: ChartTitle(
              text:"Customer satisfaction",
            ),
            series: <PieSeries<ChartData, String>>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  name: "salam",
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      // Templating the data label
                      builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                        return Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/1.jpg')
                        );
                      }
                  )
              )
            ]
        ),
      );
    }

    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: Text("salam"),
        ),
          body: Center(
              child:chartData1()
          )
      ),
    );
  }
}
  class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
  }

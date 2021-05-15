
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const int numItems = 10;
  //List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  List arr = [11, 22, 33, 44, 55];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Number'),
            ),
          ],
          rows: arr
              .map((e) => DataRow(cells: <DataCell>[DataCell(Text('Row $e'))]))
              .toList()),
    );
  }
}
// arr .map((e) => DataRow(cells: <DataCell>[DataCell(Text('Row $e'))]))
// .toList()),
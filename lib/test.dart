import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seller_app/data/Restaurent.dart';
import 'Objects/Comment.dart';
import 'Objects/Customer.dart';
import 'Objects/Restaurant.dart';


void main() {
runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "Initial Text";
Widget _editTitleTextField() {
  if (_isEditingText) return Center(child: TextField(
    onSubmitted: (newValue) {
      setState(() {
        initialText = newValue;
        _isEditingText = false;
      });
    }, autofocus: true, controller: _editingController,),);
  return InkWell(onTap: ()
  {
    setState(() {
      _isEditingText = true;
    });
  }, child: Text( initialText, style: TextStyle( color: Colors.black, fontSize: 18.0, )
  ),
  );
}
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }
  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("'Editable Text"),
        ),
        body: Center(
          child: _editTitleTextField(),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class MainPanel extends StatefulWidget {
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Name"),
      ),
      body: Container(
        child: Column(
          children: [
            FlatButton(onPressed: (){}, child: Text("Food Menu")),

          ],
        ),
      ),
    );
  }
}

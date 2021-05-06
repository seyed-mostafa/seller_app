
import 'package:flutter/material.dart';
import 'package:seller_app/appBar.dart';
import 'bottom_navigation.dart';

class MainPanel extends StatefulWidget {
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      //bottomNavigationBar:bottom_navigation (),
    );
  }
}

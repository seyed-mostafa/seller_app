
import 'package:flutter/material.dart';
import 'package:seller_app/app_bar.dart';
import 'bottom_navigation.dart';

class MainPanel extends StatefulWidget {
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      bottomNavigationBar:bottom_navigation (),
    );
  }
}

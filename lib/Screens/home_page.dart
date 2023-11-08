import 'package:flutter/material.dart';
// import '../Constants/Colors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
        ],
      ),
      body: Container(
        child: Text("add other widgets"),
      ),
    );
  }
}
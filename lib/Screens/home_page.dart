import 'package:flutter/material.dart';
// import '../Constants/Colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
        ],
      ),
      body: Container(
        child: const Text("add other widgets"),
      ),
    );
  }
}
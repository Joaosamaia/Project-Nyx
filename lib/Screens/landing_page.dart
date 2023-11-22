import 'package:flutter/material.dart';
import 'package:projeto_nyx/Screens/Tutorial/tutorial_1.dart';
import 'package:projeto_nyx/Screens/home_page.dart';
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
        title: const Text("Landing"),
        actions: [],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pizza.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(children: [
            const Text(
              "Nyx Delivery",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 450.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFF08D30)),
              ),
              child: const Text('Já possuo uma conta'),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tutorial1()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFF08D30)),
              ),
              child: const Text('Primeiro acesso'),
            )
          ]),
        ),
      ),
    );
  }
}

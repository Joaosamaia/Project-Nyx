import 'package:flutter/material.dart';
import '../Screens/Tutorial/tutorial_1.dart';
//import '../Screens/home_page.dart';
// import '../Constants/Colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Landing page.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(children: [
            const SizedBox(height: 90),
            const Text(
              "Nyx Delivery",
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caladea',
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 450.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/auth',
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFF08D30)),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(300.0, 62.0)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0), //
                  ),
                ),
              ),
              child: const Text(
                'Fazer login',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
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
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(300.0, 60.0)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(
                        20.0), // Ajuste conforme necessário
                  ),
                ),
              ),
              child: const Text('Primeiro acesso',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

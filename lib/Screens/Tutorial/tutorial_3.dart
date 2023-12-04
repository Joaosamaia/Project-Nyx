import 'package:flutter/material.dart';
import '../../Constants/Colors.dart';

class Tutorial3 extends StatefulWidget {
  const Tutorial3({super.key});

  @override
  State<Tutorial3> createState() => _Tutorial3();
}

class _Tutorial3 extends State<Tutorial3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(4.5),
          child: Center(
              child: Column(children: [
            const SizedBox(height: 30.0),
            const Text(
              'Mapa:',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const Text(
              'No mapa você encontrará a delegacia da mulher, ongs\ne centros de apoio mais proximos de você.\n',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: Image.asset(
              'assets/images/Localizaçao.png',
              height: 300.0,
              width: 300.0,
            )),
            Expanded(
                child: Image.asset(
              'assets/images/mulheres.png',
            )),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/tutorial2',
                        );
                      }),
                ),
                const Icon(
                  Icons.panorama_fish_eye,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 10.0,
                ),
                const Icon(
                  Icons.panorama_fish_eye,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 10.0,
                ),
                const Icon(
                  Icons.brightness_1,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 10.0,
                ),
                Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.arrow_forward_rounded),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/home',
                        );
                      }),
                ),
              ],
            ),
          ])),
        ));
  }
}

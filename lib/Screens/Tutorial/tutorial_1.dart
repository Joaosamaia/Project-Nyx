import 'package:flutter/material.dart';
import '../../Constants/Colors.dart';

class Tutorial1 extends StatefulWidget {
  const Tutorial1({super.key});

  @override
  State<Tutorial1> createState() => _Tutorial1();
}

class _Tutorial1 extends State<Tutorial1> {
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
              'Bem-vinda',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            const Text(
              'Bem-vindas ao NYX: Sua voz contra a violência doméstica!',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            const Text(
              'O NYX é um aplicativo projetado para\nauxiliar as mulheres a não se calarem\ndiante da violência doméstica.',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            const Text(
              'Com esta ferramenta, você pode denunciar casos\nde violência  doméstica  de maneira camuflada,\nrápida e segura.',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            const Text(
              'Agora um breve tutorial das funcionalidades\nbasicas do app:',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: Image.asset(
              'assets/images/mulheres.png',
              height: 300.0,
              width: 300.0,
            )),
            Row(
              children: [
                const Expanded(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Color.fromARGB(255, 104, 104, 104),
                    size: 10.0,
                  ),
                ),
                const Icon(
                  Icons.brightness_1,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 10.0,
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
                Expanded(
                  child: IconButton(
                      icon: const Icon(Icons.arrow_forward_rounded),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/tutorial2',
                        );
                      }),
                ),
              ],
            ),
          ])),
        ));
  }
}

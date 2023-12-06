import 'package:flutter/material.dart';
//import '../../Constants/Colors.dart';

class Tutorial2 extends StatefulWidget {
  const Tutorial2({super.key});

  @override
  State<Tutorial2> createState() => _Tutorial2();
}

class _Tutorial2 extends State<Tutorial2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(4.5),
          child: Center(
              child: Column(children: [
            const SizedBox(height: 30.0),
            const Text(
              'Botão de Emergencia:',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            const Text(
              'O botão de emergência estará sempre disponível em\nqualquer tela após o cadastro no aplicativo. Ao\npressionar e segurar o botão, seu endereço será\nenviado automaticamente para a delegacia da\nmulher via WhatsApp. Isso garantirá que, em\nsituações de emergência, a ajuda chegue o mais\nrápido possível e de maneira discreta.\nAlém disso, ao dar um clique rápido no botão, será\npossível solicitar socorro a terceiros, fornecendo\ninformações sobre o nível de emergência, se a vítima\nestá sozinha ou acompanhada, e quem é a vítima.\n',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: Image.asset(
              'assets/images/logoG - red.png',
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
                          '/tutorial1',
                        );
                      }),
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
                          '/tutorial3',
                        );
                      }),
                ),
              ],
            ),
          ])),
        ));
  }
}

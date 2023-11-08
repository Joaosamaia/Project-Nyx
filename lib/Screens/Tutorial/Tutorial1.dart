import 'package:flutter/material.dart';
import 'package:projeto_nyx/Constants/Colors.dart';

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
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/608976e0604c0.png'),
                // image: NetworkImage(
                //     "https://media.cntraveler.com/photos/5a68bd9c33d3b6157a7bce89/4:3/w_5120,h_3840,c_limit/Namdaemun-Market-H99H0R.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(children: [
                  Text(
                'Bem-vinda',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
                  Text(
                  'Bem-vindas ao NYX: Sua voz contra a violência doméstica!',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'O NYX é um aplicativo projetado para\n auxiliar as mulheres a não se calarem\n diante da violência doméstica.',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Com esta ferramenta, você pode denunciar casos\n de violência  doméstica  de maneira camuflada,\n rápida e segura.',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Agora um breve tutorial das funcionalidades\n basicas do app:',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/ficr.png', /*substituir por imagem que está no figma)*/
                  )
                )

           ])),
          ),
        )
    );
  }
}
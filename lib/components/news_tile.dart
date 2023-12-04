import 'package:flutter/material.dart';
import '../Models/models_news.dart';

class NewsTile extends StatelessWidget {
  final News news;
  const NewsTile({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10), // Ajuste o valor conforme necessário
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Cor da sombra
            spreadRadius: 2, // Raio de propagação da sombra
            blurRadius: 5, // Raio de desfoque da sombra
            offset:
                Offset(0, 3), // Deslocamento da sombra (horizontal, vertical)
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
              width: 20), // Adicione um espaçamento entre a imagem e o texto

          Image.asset(
            news.imagePath,
            height: 100,
            width: 70,
          ),
          SizedBox(
              width: 20), // Adicione um espaçamento entre a imagem e o texto

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                news.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    news.descrition,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

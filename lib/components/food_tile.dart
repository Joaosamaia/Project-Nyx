import 'package:flutter/material.dart';
import '../Models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10), // Ajuste o valor conforme necessário

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
            food.imagePath,
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
                food.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    food.locator,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[800],
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(food.rating),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

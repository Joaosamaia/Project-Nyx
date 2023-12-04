import 'package:flutter/material.dart';
import '../Models/food.dart';
import '../components/food_tile.dart';

class Home extends StatelessWidget {
  final List<Food> foodMenu = [
    Food(
        name: "Burger King",
        locator: "Shopping Recife",
        imagePath: "assets/images/bk.png",
        rating: "4.5"),
    Food(
        name: "McDonald's",
        locator: "Shopping Recife",
        imagePath: "assets/images/mcDonalds.png",
        rating: "5.0"),
    Food(
        name: "Restaurante Atlantico",
        locator: "Shopping Recife",
        imagePath: "assets/images/atlantico.jpg",
        rating: "5.0"),
    Food(
        name: "Subway",
        locator: "Shopping Recife",
        imagePath: "assets/images/SUBWAY.png",
        rating: "2.0"),
    Food(
        name: "Pizza Hurt",
        locator: "Shopping Recife",
        imagePath: "assets/images/pizzaHurt.png",
        rating: "5.0"),
  ];

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 0, bottom: 0, right: 0),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(9.0),
              width: 350.0,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                color: const Color(0xFFE5C2F5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: const Text(
                'Olá, Usuário',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),

//Ligar essa saudação ao fire base para apresentar o nome da usuaria e sua localização se der tempo, se não alterar para outra forma de saudação

            const SizedBox(height: 5),

            Image.asset(
              "assets/images/Hamburguer.png",
              width: 600.0,
              height: 200.0,
            ),
            const SizedBox(
              height: 10,
            ),

            Expanded(
                child: ListView.builder(
                    itemCount: foodMenu.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print(
                                "Card clicado: ${foodMenu[index].name}"); //alterar para tela de erro
                          },
                          child: FoodTile(food: foodMenu[index]),
                        )))
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: ClipOval(
          child: Image.asset(
            "assets/images/logoR.png",
            width: 1500.0,
            height: 1500.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.black,
        height: 50,
        child: Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                iconSize: 30.0,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
              ),
              const SizedBox(width: 24.0),
              IconButton(
                icon: const Icon(
                  Icons.library_books,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/new');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Erro extends StatelessWidget {
  const Erro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 202, 203),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              "Ops! Algo deu errado.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Desculpe, encontramos um erro inesperado.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onDoubleTap: () {
          Navigator.pushNamed(context, '/new');
        },
        onLongPress: () {
          sendWhatsapp();
        },
        child: FloatingActionButton(
          onPressed: () {},
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

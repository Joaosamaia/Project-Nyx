import 'package:flutter/material.dart';

class Erro extends StatelessWidget {
  const Erro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 202, 203),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            SizedBox(height: 20),
            Text(
              "Ops! Algo deu errado.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Desculpe, encontramos um erro inesperado.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text("Voltar"),
            ),
          ],
        ),
      ),
      
      extendBodyBehindAppBar: true, 
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
        elevation: 0,
        height: 50,
        child: Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.grey),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/home1',
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                iconSize: 35.0,
                onPressed: () {},
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
                  color: Colors.white,
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
    );
  }
}

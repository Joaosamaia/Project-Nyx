import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  Widget buildEditableRow(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 15),
            Container(
              width: 150,
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: hintText,
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 194, 188, 188),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Color.fromARGB(255, 154, 151, 151),
        ),
      ],
    );
  }

  Widget buildExpansionTile(String title) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        SizedBox(
          height: 10,
        ),
        buildEditableRow("Nome", "nome da usuária"),
        buildEditableRow("Número", "número da usuária"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            color: Color(0xFFE5C2F5),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: BoxConstraints(
                maxWidth: 375,
                maxHeight: 650,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    'Meus Dados',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildEditableRow("Nome", "nome da usuária"),
                  buildEditableRow("Número", "número da usuária"),
                  buildEditableRow("Email", "email@email.com"),
                  buildEditableRow("Senha", "*****"),
                  SizedBox(
                    height: 5,
                  ),
                  buildEditableRow("CEP", "50767-692"),
                  buildEditableRow("Cidade", "Recife"),
                  buildEditableRow("Rua", "Avenida Alfredo Lisboa"),
                  buildEditableRow("Bairro", "Recife Antigo"),
                  SizedBox(height: 30),
                  buildExpansionTile("Contato de emergência"),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Salvar informações')),
                  ElevatedButton(onPressed: () {}, child: Text('Sair da conta'))
                ],
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
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

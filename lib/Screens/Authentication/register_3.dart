import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contato {
  final String nome;
  final String numero;

  Contato({
    required this.nome,
    required this.numero,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'número': numero,
      };
}

class Register3 extends StatefulWidget {
  const Register3({super.key});

  @override
  State<Register3> createState() => _Register3();
}

class _Register3 extends State<Register3> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  Future<void> createContato({
    required String nome,
    required String numero,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('contatos').doc();
    final contato = Contato(
      nome: nome,
      numero: numero,
    ).toJson();
    final json = contato;

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Landing page.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Container(
                color: const Color(0xFFE5C2F5),
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Column(children: [
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/images/logoG - red.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 375,
                      maxHeight: 650,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Text(
                          "Contato de Emergência: ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _nomeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira o nome do seu contato';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Nome do contato',
                            focusColor: Colors.black,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _numeroController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira o numero do seu contato';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Numero do contato',
                            focusColor: Colors.black,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 46,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffff9100),
                          ),
                          onPressed: () {
                            final nome = _nomeController.text;
                            final numero = _numeroController.text;

                            createContato(
                              nome: nome,
                              numero: numero,
                            );
                            Navigator.of(context).pushNamed(
                              '/auth',
                            );
                          },
                          child: const Text(
                            'Finalizar cadastro',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ]
        )
      )
    );
  }
}
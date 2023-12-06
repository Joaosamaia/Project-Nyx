import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userx {
  String id;
  final String email;
  final String password;
  final String nome;
  final String cpf;
  final String telefone;

  Userx({
    this.id = '',
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'cpf': cpf,
        'telefone': telefone,
        'email': email,
        'password': password,
      };
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String nome,
    required String cpf,
    required String telefone,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = Userx(
            id: docUser.id,
            nome: nome,
            cpf: cpf,
            telefone: telefone,
            email: email,
            password: password)
        .toJson();
    final json = user;

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
                          "Informações pessoais: ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
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
                          controller: _nomeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu nome';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Nome',
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
                          controller: _cpfController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu cpf';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'CPF',
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
                          controller: _telefoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu telefone';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Telefone',
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
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira sua senha';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Senha',
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
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            final nome = _nomeController.text;
                            final cpf = _cpfController.text;
                            final telefone = _telefoneController.text;

                            createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                              nome: nome,
                              cpf: cpf,
                              telefone: telefone,
                            );

                            Navigator.of(context).pushNamed(
                              '/reg2',
                            );
                          },
                          child: const Text(
                            'Continuar',
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

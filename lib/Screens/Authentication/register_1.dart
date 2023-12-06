import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Authentication/input.dart';

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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  Future<void> registerUser({
    required String email,
    required String password,
    required String nome,
    required String cpf,
    required String telefone,
  }) async {
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
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/logoG - red.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 375,
                      maxHeight: 580,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            "Informações pessoais: ",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomInputField(
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Email",
                            controller: _emailController,
                            validator: (String? email) {
                              if (email == null) {
                                return null;
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(email);
                              return emailValid ? null : "Email inválido";
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            keyboardType: TextInputType.name,
                            hintText: "Nome",
                            controller: _nomeController,
                            validator: (String? nome) {
                              if (nome == null) {
                                return null;
                              }
                              if (nome.isEmpty) {
                                return "Preencha seu nome";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            keyboardType: TextInputType.text,
                            hintText: "CPF",
                            controller: _cpfController,
                            validator: (String? cpf) {
                              if (cpf == null) {
                                return null;
                              }
                              if (cpf.isEmpty) {
                                return "Preencha seu CPF";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            keyboardType: TextInputType.phone,
                            hintText: "Telefone",
                            controller: _telefoneController,
                            validator: (String? telefone) {
                              if (telefone == null) {
                                return null;
                              }
                              if (telefone.isEmpty) {
                                return "Preencha seu telefone";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Senha",
                            obscureText: true,
                            controller: _passwordController,
                            validator: (String? password) {
                              if (password == null) {
                                return null;
                              }
                              if (password.length < 6) {
                                return "Senha muito curta";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            keyboardType: TextInputType.visiblePassword,
                            hintText: "Confirme a senha",
                            obscureText: true,
                            controller: _passwordConfirmationController,
                            validator: (String? password) {
                              if (password == null) {
                                return null;
                              }
                              if (password !=
                                  _passwordConfirmationController.value.text) {
                                return "Senha não confirmada";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff9100),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black, width: 0.5),
                                borderRadius: BorderRadius.circular(
                                    20.0), // Ajuste conforme necessário
                              ),
                            ),
                            child: const Text(
                              "Continuar",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              registerUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                                nome: _nomeController.text,
                                cpf: _cpfController.text,
                                telefone: _telefoneController.text,
                              );
                              if (_formKey.currentState!.validate()) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: _emailController.value.text,
                                  password: _passwordController.value.text,
                                )
                                    .then((result) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/reg2', (_) => false);
                                }).catchError((Object exception) {
                                  if (exception is FirebaseAuthException) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Falha ao registrar: ${exception.message}')),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          // ignore: unnecessary_brace_in_string_interps
                                          content: Text(
                                              'Erro de registro $exception')),
                                    );
                                  }
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text(
                                "Já possui uma conta?",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                ),
                              ),
                              TextButton(
                                child: const Text("Login"),
                                onPressed: () =>
                                    {Navigator.of(context).pushNamed("/login")},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ])));
  }
}

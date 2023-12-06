// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Authentication/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        child: Center(
          child: Column(children: [
            const SizedBox(height: 30),
            const Text(
              "Nyx Delivery",
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caladea',
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 140),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: const BoxConstraints(
                maxWidth: 375,
                maxHeight: 320,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
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
                        return emailValid ? null : "Email invalido";
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomInputField(
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "senha",
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
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffff9100),
                        shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(
                              20.0), // Ajuste conforme necessário
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: _emailController.value.text,
                            password: _passwordController.value.text,
                          )
                              .then((result) {
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/home', (_) => false);
                          }).catchError((Object exception) {
                            if (exception is FirebaseAuthException) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Falha na autenticaçao: ${exception.message}')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Falha na autenticaçao: ${exception}')),
                              );
                            }
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 38.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Não possui uma conta?",
                          style: TextStyle(
                            color: Color(0xff000000),
                          ),
                        ),
                        TextButton(
                          child: const Text("Registrar-se"),
                          onPressed: () =>
                              {Navigator.of(context).pushNamed("/reg")},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

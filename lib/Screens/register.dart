import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      );
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
    
    final json = {
      'email': email,
      'password': password,
      'age': 21,
      'bday': DateTime(2001, 7, 28),
    };

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
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20,),
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
                const SizedBox(height: 20,),
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
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        createUserWithEmailAndPassword(email: email, password: password,);
                  },
                  child: const Text('Cadastro'),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
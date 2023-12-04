import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../appbar.dart';
import '../input.dart';
import '../scrollable_column.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool _agreeWithTermsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: const CustomAppBar(title: "Realize seu cadastro"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Form(
          key: _formKey,
          child: ScrollableColumn(
            children: [
              CustomInputField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                controller: _emailController,
                validator: (String? email) {
                  if (email == null) {
                    return null;
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email);
                  return emailValid ? null : "Email inválido";
                },
              ),
              const SizedBox(height: 24),
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
              const SizedBox(height: 24),
              CustomInputField(
                keyboardType: TextInputType.visiblePassword,
                hintText: "Confirme a senha",
                obscureText: true,
                controller: _passwordConfirmationController,
                validator: (String? password) {
                  if (password == null) {
                    return null;
                  }
                  if (password != _passwordConfirmationController.value.text) {
                    return "Senha não confirmada";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CustomCheckbox(
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Ao criar uma conta voce concorda com nossos",
                        style: TextStyle(
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text('Termos e condições'),
                      onPressed: () {
                        print("// Termos e condições");
                      },
                    ),
                  ],
                ),
                value: _agreeWithTermsAndConditions,
                onChanged: (checked) => setState(
                    () => _agreeWithTermsAndConditions = checked ?? false),
              ),
              const SizedBox(height: 24),
              /*ElevatedButton(
                child: Text("Registrar"),
                  onPressed: !_agreeWithTermsAndConditions
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailController.value.text,
                            password: _passwordController.value.text,
                          )
                              .then((result) {
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/main', (_) => false);
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
                                    content:
                                        Text('Erro de registro ${exception}')),
                              );
                            }
                          });
                        }
                      }, 
              ),*/ 
              const SizedBox(height: 25.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/Acc_Logo_Black_Purple_RGB.png',
                      width: 100,
                      height: 58,
                    ),
                    //Image.network(
                    //'https://www.accenture.com/content/dam/accenture/final/images/icons/symbol/Acc_Logo_Black_Purple_RGB.png',
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/Marca_Porto_Digital_2019.png',

                      //Image.network(
                      //'https://www.portodigital.org/_nuxt/img/logo.9d0ef93.svg',
                      width: 100,
                      height: 58,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/ficr.png',

                      //Image.network(
                      //'https://ficr.catolica.edu.br/portal/wp-content/uploads/2019/06/recife-sigla.svg',
                      width: 100,
                      height: 58,
                    ),
                  ),
                ),
              ]),
              Expanded(
                child: Container(),
              ),
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
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

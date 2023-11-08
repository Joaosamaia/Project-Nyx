
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../appbar.dart';
import '../input.dart';
import '../scrollable_column.dart';

class LoginPage extends StatefulWidget {
  const LoginPage() : super();
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: CustomAppBar(title: "Bem-vindo ao contador Nyx!"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  return emailValid ? null : "Email invalido";
                },
              ),
              SizedBox(height: 24),
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
              SizedBox(height: 24),
              CustomCheckbox(
                labelText: "lembrar conta",
                value: _rememberMeChecked,
                onChanged: (checked) =>
                    setState(() => _rememberMeChecked = checked ?? false),
              ),
              SizedBox(height: 24),
              /*ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
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
                                  'Falha na autenticaçao: ${exception.message}')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Falha na autenticaçao: ${exception}')),
                        );
                      }
                    });
                  }
                },
              ), */
              const SizedBox(height: 38.0),
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
                  Text(
                    "Não possui uma conta?",
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),
                  ),
                  TextButton(
                    child: Text("Registrar-se"),
                    onPressed: () =>
                        {Navigator.of(context).pushNamed("/register")},
                  ),
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

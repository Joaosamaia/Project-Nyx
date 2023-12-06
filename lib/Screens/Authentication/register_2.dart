import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Endereco {
  final String cep;
  final String rua;
  final String bairro;
  final String cidade;
  final String numero;
  final String compl;

  Endereco({
    required this.cep,
    required this.rua,
    required this.bairro,
    required this.cidade,
    required this.numero,
    required this.compl,
  });

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'rua': rua,
        'bairro': bairro,
        'cidade': cidade,
        'número': numero,
        'complemento': compl,
      };
}

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2();
}

class _Register2 extends State<Register2> {
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complController = TextEditingController();

  Future<void> createEndereco({
    required String cep,
    required String rua,
    required String bairro,
    required String cidade,
    required String numero,
    required String compl,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('enderecos').doc();

    final endereco = Endereco(
      cep: cep,
      rua: rua,
      bairro: bairro,
      cidade: cidade,
      numero: numero,
      compl: compl,
    ).toJson();

    final json = endereco;

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
                          "Endereço: ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _cepController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu cep';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'CEP',
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
                          controller: _ruaController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira sua rua';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Rua',
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
                          controller: _bairroController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu bairro';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'bairro',
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
                          controller: _cidadeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira sua cidade';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'cidade',
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
                              return 'Insira o numero de sua casa';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'numero',
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
                          controller: _complController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Insira seu complemento';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Complemento',
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
                            final cep = _cepController.text;
                            final rua = _ruaController.text;
                            final bairro = _bairroController.text;
                            final cidade = _cidadeController.text;
                            final numero = _numeroController.text;
                            final compl = _complController.text;

                            createEndereco(
                              cep: cep,
                              rua: rua,
                              bairro: bairro,
                              cidade: cidade,
                              numero: numero,
                              compl: compl,
                            );
                            Navigator.of(context).pushNamed(
                              '/reg3',
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

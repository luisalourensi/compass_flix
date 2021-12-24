import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:projeto_pb/components/barra_forca.dart';
import 'package:projeto_pb/controller/controller.dart';
import 'package:projeto_pb/screens/home_screen.dart';
import 'package:projeto_pb/screens/login_screen.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _controllerCadastro = LoginController();
  var forcaSenha = '';
  var cor = Colors.white70;
  var corBarra1 = Colors.white70;
  var corBarra2 = Colors.white70;
  var corBarra3 = Colors.white70;
  var corBarra4 = Colors.white70;

  forcaForte() {
    setState(() {
      forcaSenha = 'Forte';
      cor = Colors.green;
      corBarra1 = Colors.green;
      corBarra2 = Colors.green;
      corBarra3 = Colors.green;
      corBarra4 = Colors.green;
    });
  }

  forcaMedia() {
    setState(() {
      forcaSenha = 'Média';
      cor = Colors.yellow;
      corBarra1 = Colors.yellow;
      corBarra2 = Colors.yellow;
      corBarra3 = Colors.yellow;
      corBarra4 = Colors.white70;
    });
  }

  forcaFraca() {
    setState(() {
      forcaSenha = 'Fraca';
      cor = Colors.deepOrange;
      corBarra1 = Colors.deepOrange;
      corBarra2 = Colors.deepOrange;
      corBarra3 = Colors.orange;
      corBarra4 = Colors.white70;
    });
  }

  forcaMFraca() {
    setState(() {
      forcaSenha = 'Muito Fraca';
      cor = Colors.deepOrange;
      corBarra1 = Colors.deepOrange;
      corBarra2 = Colors.orange;
      corBarra3 = Colors.white70;
      corBarra4 = Colors.white70;
    });
  }

  forcaSemSenha() {
    setState(() {
      forcaSenha = 'Digite um senha';
      cor = Colors.white;
      corBarra1 = Colors.red;
      corBarra2 = Colors.white70;
      corBarra3 = Colors.white70;
      corBarra4 = Colors.white70;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        /* padding: const EdgeInsets.only(
          left: 50,
          right: 50,
        ), */
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      child: Image.asset("assets/compassflix_logo.png"),
                    ),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor preencha nome";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          hintText: "Nome",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor preencha e-mail";
                        }
                        if (!value.contains('@')) {
                          return " E-mail invalido";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          hintText: "E-mail",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        if (value == null || value.isEmpty) {
                          forcaSemSenha();
                        } else {
                          if (value.length <= 8) {
                            forcaMFraca();
                          } else {
                            if (value.length >= 8 &&
                                !value.contains(RegExp(r'[A-Z]'))) {
                              forcaFraca();
                            } else {
                              if (!value.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                forcaForte();
                              }
                            }
                          }
                        }
                      },
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor preencha a senha";
                        }
                        if (value.length < 8) {
                          return "Deve conter pelo menos 8 caracteres";
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return "Deve conter pelo menos 1 letra maiúscula";
                        }
                        if (!value
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return "Deve conter pelo menos 1 caractere especial";
                        }
                      },
                      obscureText: !_isVisible,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                          fillColor: Colors.grey,
                          filled: true,
                          hintText: "Senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0, right: 2),
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topCenter,
                          width: 71,
                          height: 7,
                          decoration: BoxDecoration(
                            color: corBarra1,
                            border: Border.all(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0, right: 2),
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topCenter,
                          width: 71,
                          height: 7,
                          decoration: BoxDecoration(
                            color: corBarra2,
                            border: Border.all(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0, right: 2),
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topCenter,
                          width: 71,
                          height: 7,
                          decoration: BoxDecoration(
                            color: corBarra3,
                            border: Border.all(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0, right: 2),
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.topCenter,
                          width: 70,
                          height: 7,
                          decoration: BoxDecoration(
                            color: corBarra4,
                            border: Border.all(),
                          ),
                        )
                      ],
                    ),
                    TextoForca(
                      forca: forcaSenha,
                      cor: cor,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _controllerCadastro.signup(
                                _emailController.text,
                                _passwordController.text,
                                context);
                          }
                        },
                        child: const Text("CONCLUIR CADASTRO"),
                      ),
                    ),
                    ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

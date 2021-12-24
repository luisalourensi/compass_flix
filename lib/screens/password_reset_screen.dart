import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_pb/controller/controller.dart';

import 'login_screen.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  var _controllerLogin = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
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
              padding: const EdgeInsets.only(top: 60, left: 50, right: 50),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/compassflix_logo.png"),
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _passwordController,
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _passwordController.text
                              .replaceAll(new RegExp(r"\s+\b|\b\s"), "")
                              .trim();
                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: _passwordController.text)
                                .then((value) {
                              Fluttertoast.showToast(
                                  msg:
                                      "LINK DE RECURAÇÃO DE SENHA ENVIADO PARA SEU E-MAIL",
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.grey,
                                  timeInSecForIosWeb: 5,
                                  fontSize: 18);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            });
                          } on FirebaseAuthException catch (e) {
                            if (e.message ==
                                "There is no user record corresponding to this identifier. The user may have been deleted.") {
                              Fluttertoast.showToast(
                                  msg:
                                      "E-MAIL NÃO CADASTRADO, INFORME NOVAMENTE",
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.grey,
                                  timeInSecForIosWeb: 5,
                                  fontSize: 18);
                            }
                          }
                        }
                      },
                      child: const Text("ENVIAR"),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

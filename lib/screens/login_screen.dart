import 'package:projeto_pb/controller/controller.dart';
import 'package:projeto_pb/screens/form_screen.dart';
import 'package:projeto_pb/screens/password_reset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_pb/screens/thanks.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _controllerLogin = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 0),
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 40, right: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/compassflix_logo.png"),
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (!value!.contains('@')) {
                          Fluttertoast.showToast(
                              msg: "E-MAIL INVÁLIDO",
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.grey,
                              timeInSecForIosWeb: 5,
                              fontSize: 18);
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: "E-mail",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _passwordController,
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
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                        ),
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: "Senha",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
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
                            await _controllerLogin.signin(_emailController.text,
                                _passwordController.text, context);
                          }
                        },
                        child: const Text("LOGIN"),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text(
                          "Esqueceu sua senha?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordResetScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text(
                          "Cadastro",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThanksScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "S2",
                          style: TextStyle(color: Colors.lightGreenAccent),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

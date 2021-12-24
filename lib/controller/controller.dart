import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_pb/screens/home_screen.dart';
import 'package:projeto_pb/screens/login_screen.dart';

class LoginController {
  signin(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((userCredential) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ));
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.message ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        Fluttertoast.showToast(
            msg: "E-MAIL NÃO REGISTRADO",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.grey,
            timeInSecForIosWeb: 5,
            fontSize: 18);
      }
      if (e.message ==
          "The password is invalid or the user does not have a password.") {
        Fluttertoast.showToast(
            msg: "SENHA INVÁLIDA",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.grey,
            timeInSecForIosWeb: 5,
            fontSize: 18);
      }
    }
  }

  signup(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ));
    } on FirebaseAuthException catch (e) {
      if (e.message ==
          "The email address is already in use by another account.") {
        Fluttertoast.showToast(
            msg: "E-mail já existe na base de dados.",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.grey,
            timeInSecForIosWeb: 5,
            fontSize: 18);
      }
    }
  }

  /* requestPassword(String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  } */
}

/* else {
      Fluttertoast.showToast(
          msg: "E-MAIL NÃO CADASTRADO, INFORME NOVAMENTE",
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.grey,
          timeInSecForIosWeb: 5,
          fontSize: 18);
    } */

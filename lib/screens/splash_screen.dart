import 'package:flutter/material.dart';
import 'package:projeto_pb/components/Progress.dart';
import 'package:projeto_pb/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 0),
        children: [
          Container(
            height: 780,
            padding: const EdgeInsets.only(left: 60, right: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/compassflix_logo.png"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Progress(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

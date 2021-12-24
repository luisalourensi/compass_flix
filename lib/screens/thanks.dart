import 'package:flutter/material.dart';

class ThanksScreen extends StatefulWidget {
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  _ThanksScreenState createState() => _ThanksScreenState();
}

class _ThanksScreenState extends State<ThanksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.center,
        ),
      ),
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
                  height: 30,
                ),
                Image.asset("assets/compassflix_logo.png", scale: 4),
                const SizedBox(
                  height: 30,
                ),
                Image.asset("assets/thanks.png", scale: 2),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 290,
                  child: Text(
                    'E não poderíamos deixar de falarmos da nossa primeira cliente, Grazi. Uma pessoa dedicada, um ser humano do bem que é bom se ter por perto. Gostaríamos de deixar aqui nosso desejo que sejas sempre muito feliz, realizada e tenha muito sucesso. Muito obrigado por tudo!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  'Um grande abraço,',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  'Léo, Lu,Fábio, Gieder, Tassi e Tati.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

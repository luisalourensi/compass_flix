import 'package:flutter/material.dart';
import 'package:projeto_pb/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on})
      : super(key: key);
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
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ])),
          SizedBox(height: 15),
          Positioned(
              bottom: 5,
              child: modified_text(
                text: '⭐ Average Rating - ' + vote,
                color: Colors.white,
              )),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : 'Not Loaded',
                size: 24,
                color: Colors.white,
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: 'Releasing On - ' + launch_on,
                size: 14,
                color: Colors.white,
              )),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(
                      text: description,
                      size: 18,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

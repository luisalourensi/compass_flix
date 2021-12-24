import 'package:flutter/material.dart';

class Progress extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 90.0,
              width: 90.0,
              child:
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                  strokeWidth: 5.0)
          ),
        ],
      ),
    );
  }
}

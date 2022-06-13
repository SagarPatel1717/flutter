import 'package:flutter/material.dart';

class FirstDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.green,
        ),
        Positioned(
          right: 10.0,
          left: 10.0,
          child: Container(
            color: Colors.blue,
            height: 300.0,
            width: 300.0,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.pink,
            height: 150.0,
            width: 150.0,
          ),
        )
      ],
    );
  }
}

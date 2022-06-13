import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SimpleSquareWithAngle extends StatefulWidget {
  @override
  _SimpleSquareWithAngleState createState() => _SimpleSquareWithAngleState();
}

class _SimpleSquareWithAngleState extends State<SimpleSquareWithAngle> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      // child: Transform.rotate(
      // angle: -pi / 2,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerFromX = size.width / 2;
    var centerFromY = size.height / 2;
    var radius = min(centerFromX, centerFromY);

    var squareBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    print('centerFromX: $centerFromX, outerCircleRadius: $outerCircleRadius');
    print('centerFromX: $centerFromX, outerCircleRadius: $innerCircleRadius');
    for (double i = 0; i < 360; i += 30) {
      var x1 = centerFromX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerFromX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerFromX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerFromX + innerCircleRadius * sin(i * pi / 180);

      print('i: $i, pi: $pi, cos(i * pi / 180): ${cos(i * pi / 180)}');
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), squareBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
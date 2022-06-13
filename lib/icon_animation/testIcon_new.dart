import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingIcon extends StatefulWidget {
  const FloatingIcon({Key? key}) : super(key: key);

  @override
  _FloatingIconState createState() => _FloatingIconState();
}

class _FloatingIconState extends State<FloatingIcon> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    final timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {});
    });

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // timer.cancel();
          animationController.reverse();
          print('completed');
        }
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        color: Colors.redAccent,
        child: CustomPaint(
          painter: LinePainter(animationValue: animation.value),
        ));
  }
}

class LinePainter extends CustomPainter {
  double animationValue;
  LinePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    var lineBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    ///From Center
    var centerFromX = size.width / 2;
    var centerFromY = size.height / 2;
    var center = Offset(centerFromX, centerFromY);


    ///Simple lineOne Calculation
    var lineOneStartingY = centerFromY + (animationValue * 50);
    var lineOneEndingY = centerFromY - (animationValue * 50);

    var lineOneStartingPoint = Offset(0, lineOneStartingY);
    var lineOneEndingPoint = Offset(size.width, lineOneEndingY);
    canvas.drawLine(lineOneStartingPoint, lineOneEndingPoint, lineBrush);



    ///Simple lineTwo Calculation
    var lineTwoStartingY = centerFromY - (animationValue * 50);
    var lineTwoEndingY = centerFromY + (animationValue * 50);

    var lineTwoStartingPoint = Offset(0, lineTwoStartingY);
    var lineTwoEndingPoint =Offset(size.width, lineTwoEndingY);
    canvas.drawLine(lineTwoStartingPoint, lineTwoEndingPoint, lineBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

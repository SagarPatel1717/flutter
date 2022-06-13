import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';


class TestIcon extends StatefulWidget {
  @override
  _TestIconState createState() => _TestIconState();
}

class _TestIconState extends State<TestIcon> with TickerProviderStateMixin {

  late AnimationController animationController;
  late AnimationController animationControllerCross;
  late Animation<double> animation;
  late Animation<double> animationCross;
  bool isForCross = false;
  @override
  void initState() {
    super.initState();
    final timer = Timer.periodic(Duration(milliseconds: 1), (timer) { setState(() {});});

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationControllerCross = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // print('horizontal completed >>>> >>>> >>>> >>>> >>>> ');
          isForCross = true;
          animationControllerCross.forward();
        } else if (status == AnimationStatus.dismissed) {
          // print('horizontal dismissed >>>> >>>> >>>> >>>> >>>> ');
          await Future.delayed(Duration(milliseconds: 300));
          animationController.forward();
        }
      });

    animationCross = Tween(begin: 0.0, end: 1.0).animate(animationControllerCross)
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // print('cross completed >>>> >>>> >>>> >>>> >>>> ');
          await Future.delayed(Duration(milliseconds: 300));
          animationControllerCross.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // print('cross dismissed >>>> >>>> >>>> >>>> >>>> ');
          isForCross = false;
          animationController.reverse();

        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFFff5558),
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: LinePainter(animationValue: animation.value, crossAnimationValue: animationCross.value, isForCross: isForCross),
      ),
    );
  }
}


class LinePainter extends CustomPainter {
  LinePainter({required this.animationValue, required this.crossAnimationValue, required this.isForCross});
  double animationValue;
  double crossAnimationValue;
  bool isForCross;

  @override
  void paint(Canvas canvas, Size size) {
    var minHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    // print('animationValue $animationValue');

    ///From Center
    var centerFromX = size.width / 2;
    var centerFromY = size.height / 2;

    double lineOneStartingY, lineOneEndingY, lineTwoStartingY, lineTwoEndingY;

    if (!isForCross) {
      lineOneStartingY = (centerFromY - 50) + (animationValue * 50);
      lineOneEndingY = (centerFromY - 50) + (animationValue * 50);

      lineTwoStartingY = (centerFromY + 50) - (animationValue * 50);
      lineTwoEndingY = (centerFromY + 50) - (animationValue * 50);
    } else {
      lineOneStartingY = centerFromY + (crossAnimationValue * 50);
      lineOneEndingY = centerFromY - (crossAnimationValue * 50);

      lineTwoStartingY = centerFromY - (crossAnimationValue * 50);
      lineTwoEndingY = centerFromY + (crossAnimationValue * 50);
    }

    var lineOneStartingPoint = Offset(0, lineOneStartingY);
    var lineOneEndingPoint = Offset(size.width, lineOneEndingY);
    canvas.drawLine(lineOneStartingPoint, lineOneEndingPoint, minHandBrush);

    var lineTwoStartingPoint = Offset(0, lineTwoStartingY);
    var lineTwoEndingPoint =Offset(size.width, lineTwoEndingY);
    canvas.drawLine(lineTwoStartingPoint, lineTwoEndingPoint, minHandBrush);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
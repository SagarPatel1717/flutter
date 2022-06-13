import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';


class ClockSimplePath extends StatefulWidget {
  @override
  _ClockSimplePathState createState() => _ClockSimplePathState();
}

class _ClockSimplePathState extends State<ClockSimplePath> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(1, animation.value),
      child: Container(),
    );
  }
}


class ShapePainter extends CustomPainter {
  ShapePainter(this.sides, this.radius);
  int sides;
  double radius;
  final radius1 = 100;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    // path.moveTo(100, 100);
    path.lineTo(radius + 50, radius + 50);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sf_test/clock_loader_view/simple_square_old.dart';
import 'package:sf_test/config/timer_manager.dart';

double mainHand = 100.0;
double upperBound = 334;
int mainHandDivider = 0;

class ClockLoaderViewOld extends StatefulWidget {
  @override
  _ClockLoaderViewOldState createState() => _ClockLoaderViewOldState();
}

class _ClockLoaderViewOldState extends State<ClockLoaderViewOld>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      lowerBound: 1,
      upperBound: upperBound,
      vsync: this,
      duration: const Duration(milliseconds: 4008),
    )
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // print('AnimationStatus.completed >>>> >>>> >>>> >>>> ');
          _animationController.reset();
          // _animationController.forward();
          // TimerManager().mainTimer?.cancel();
        } else if (status == AnimationStatus.dismissed) {
          // print('AnimationStatus.dismissed ................... ');
          _animationController.forward();
        }
      })
      ..addListener(_update)
      ..forward();



    super.initState();
  }

  void _update() {
    mainHandDivider += 1;
    print('mainHandDivider: $mainHandDivider');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: loaderWidth,
      height: loaderHeight,
      child: CustomPaint(
        painter: ClockPainter(_animationController),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final AnimationController animationController;

  ClockPainter(this.animationController);

  @override
  void paint(Canvas canvas, Size size) {


    upperBound = upperBound - 1;
    if ((upperBound % 416) == 0) {
      // mainHand = mainHand - 8.3333333333;
      // print('mainHand $mainHand >>>>>> >>>>>> >>>>>> >>>>>> >>>>>> >>>>>> >>>>>> >>>>>> >>>>>> ');
    }
    // mainHand = mainHand/2;
    var centerFromX = size.width / 2;
    var centerFromY = size.height / 2;
    var center = Offset(centerFromX, centerFromY);
    var radius = min(centerFromX, centerFromY);

    var minHandBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    var mainHandX =
        centerFromX + (mainHand * cos(animationController.value * 1 * pi / 180));
    var mainHandY =
        centerFromY + (mainHand * sin(animationController.value * 1 * pi / 180));
    canvas.drawLine(center, Offset(mainHandX, mainHandY), minHandBrush);


    // var squareBrush = Paint()
    //   ..color = Colors.white
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 10;

    // var outerCircleRadius = radius - 35;
    // var innerCircleRadius = radius - 50;
    // for (double i = 0; i < 360; i += 30) {
    //   var x1 = centerFromX + outerCircleRadius * cos(i * pi / 180);
    //   var y1 = centerFromX + outerCircleRadius * sin(i * pi / 180);
    //
    //   var x2 = centerFromX + innerCircleRadius * cos(i * pi / 180);
    //   var y2 = centerFromX + innerCircleRadius * sin(i * pi / 180);
    //   canvas.drawLine(Offset(x1, y1), Offset(x2, y2), squareBrush);
    //   print('x2: $x2, y2:$y2 >>>>>> >>>>>>');
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sf_test/clock_loader_view/simple_square_old.dart';

double mainHand = 100.0;
double upperBound = 4992;
int mainHandDivider = 0;
List<Path>_listOfPath = [];

class CircleTwelvePath extends StatefulWidget {
  @override
  _ClockLoaderViewState createState() => _ClockLoaderViewState();
}

class _ClockLoaderViewState extends State<CircleTwelvePath>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // _animationController = AnimationController(
    //   lowerBound: 1,
    //   upperBound: upperBound,
    //   vsync: this,
    //   duration: const Duration(minutes: 1),
    // )
    //   ..addListener(_update)
    //   ..forward();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    listOfPath();

    super.initState();
  }

  void listOfPath() {
    final centerFromX = 0.0;
    final centerFromY = 0.0;
    final innerCircleRadius = centerFromX - 90;
    for (double i = 0; i < 360; i += 30) {
      var x = centerFromX + innerCircleRadius * cos(i * pi / 180);
      var y = centerFromX + innerCircleRadius * sin(i * pi / 180);
      Path path = Path();
      path.moveTo(centerFromX, centerFromY);
      path.lineTo(x, y);
      _listOfPath.add(path);
    }
    print('_listOfPath: $_listOfPath');
  }

  // void _update() {
  //   setState(() {});
  // }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: CustomPaint(
            painter: ClockPainter(_animationController),
          ),
        ),
        // CustomPaint(
        //   painter: AnimatedShapePainter(
        //       Offset(calculate(_animation.value, _listOfPath[0])?.dx ?? 0,
        //           calculate(_animation.value, _listOfPath[0])?.dy ?? 0)),
        //   child: Container(),
        // ),
        // for (var pathElement in _listOfPath)
        // CustomPaint(
        //   painter: AnimatedShapePainter(
        //       Offset(calculate(_animation.value, pathElement)?.dx ?? 0,
        //           calculate(_animation.value, pathElement)?.dy ?? 0)),
        //   child: Container(),
        // ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  final AnimationController animationController;

  ClockPainter(this.animationController);

  @override
  void paint(Canvas canvas, Size size) {
    var centerFromX = size.width / 2;
    var centerFromY = size.height / 2;
    var radius = min(centerFromX, centerFromY);

    var squareBrush = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var innerCircleRadius = radius - 90;
    for (double i = 0; i < 360; i += 30) {
      var x = centerFromX + innerCircleRadius * cos(i * pi / 180);
      var y = centerFromX + innerCircleRadius * sin(i * pi / 180);
      Path path = Path();
      path.moveTo(centerFromX, centerFromY);
      path.lineTo(x, y);
      // _listOfPath.add(path);
      canvas.drawPath(path, squareBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

extension _ on _ClockLoaderViewState {

  Offset? calculate(double animationValue, Path path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    animationValue = pathMetric.length * animationValue;
    Tangent? pos = pathMetric.getTangentForOffset(animationValue);
    return pos?.position;
  }
}
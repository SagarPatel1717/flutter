import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sf_test/clock_loader_view/simple_square.dart';

enum ShapeOfParticlesEnum { circle, square }

class ClockLoaderModel {
  /// This will give selection choise for single or multiple for list.
  ShapeOfParticlesEnum? shapeOfParticles = ShapeOfParticlesEnum.square;

  /// This will give the background color to the search text filed.
  Color? mainHandleColor = Colors.white;

  /// This will give the background color to the search text filed.
  Color? particlesColor = Colors.white;

  ClockLoaderModel({
    Key? key,
    this.shapeOfParticles,
    this.mainHandleColor,
    this.particlesColor,
  });
}

class ClockLoaderView extends StatefulWidget {
  ClockLoaderModel clockLoaderModel;

  ClockLoaderView({required this.clockLoaderModel});
  @override
  _ClockLoaderViewState createState() => _ClockLoaderViewState();
}

class _ClockLoaderViewState extends State<ClockLoaderView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: wholeRoundAnimMilliSec),
    )
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        } else if (status == AnimationStatus.dismissed) {
          await Future.delayed(Duration(milliseconds: 20));
          _animationController.forward();
        }
      })
      ..addListener(_update)
      ..forward();

    _animation = Tween(begin: 0.0, end: 360).animate(_animationController);

    super.initState();
  }

  void _update() {
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: loaderWidth,
      height: loaderHeight,
      child: CustomPaint(
        painter: ClockPainter(
            animationController: _animation,
            clockLoaderModel: widget.clockLoaderModel),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final Animation animationController;
  ClockLoaderModel clockLoaderModel;

  ClockPainter(
      {required this.animationController, required this.clockLoaderModel});

  @override
  void paint(Canvas canvas, Size size) {
    var centerFromX = size.width / 2;
    var centerFromY = size.height / 2;
    var center = Offset(centerFromX, centerFromY);

    var minHandBrush = Paint()
      ..color = clockLoaderModel.mainHandleColor ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap =
          clockLoaderModel.shapeOfParticles == ShapeOfParticlesEnum.square
              ? StrokeCap.square
              : StrokeCap.round
      ..strokeWidth = squareSize;

    var mainHandX = centerFromX +
        (mainHand * cos(animationController.value * 1 * pi / 180));
    var mainHandY = centerFromY +
        (mainHand * sin(animationController.value * 1 * pi / 180));
    canvas.drawLine(center, Offset(mainHandX, mainHandY), minHandBrush);

    ///squares around the circle
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
    return false;
  }
}

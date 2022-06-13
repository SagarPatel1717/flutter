
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sf_test/clock_loader_view/clock_loader_old.dart';
import 'package:collection/collection.dart';
import 'package:sf_test/config/timer_manager.dart';

final loaderWidth = 300.0;
final loaderHeight = 300.0;
final radius = loaderWidth / 2;
final numberOfSquare = 12;

// var mainTimer = Timer.periodic(Duration(milliseconds: 1), (timer) { });

class SimpleSquareOld extends StatefulWidget {
  @override
  _ClockSimplePathOldState createState() => _ClockSimplePathOldState();
}

class _ClockSimplePathOldState extends State<SimpleSquareOld>
    with TickerProviderStateMixin {
  List<Path> listPath = [];
  List<Animation<double>> listOfAnimations = [];
  List<AnimationController> listOfAnimationController = [];

  @override
  void initState() {
    super.initState();
    // var mainTimer = Timer.periodic(Duration(milliseconds: 1), (timer) { setState(() {});});
    TimerManager().startTimer(
        timerType: TimerType.milliseconds,
        timerCallback: () {
          setState(() {});
        });

    ///fill the AnimationController and Animations
    for (int i = 0; i < numberOfSquare; i++) {
      listOfAnimationController.add(AnimationController(
          vsync: this,
          duration:
          Duration(milliseconds: (4008 ~/ numberOfSquare) * (i + 1))));
      listOfAnimations.add(Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: listOfAnimationController[i],
          curve: Interval((1 / numberOfSquare) * (i + 1), 1.0))));
      // listOfAnimations.add(Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: listOfAnimationController[i], curve: Interval((1/numberOfSquare) * (i + 1), 1.0, curve: Cubic(0.25, 0.46, 0.45, 0.94)))));
      listOfAnimationController[i].forward();
    }


    ///Add StatusListener for the very last AnimationController
    // for (int i = 0; i < numberOfSquare; i++) {
    //   if (i == (numberOfSquare - 1)) {
    listOfAnimationController[numberOfSquare - 1]
        .addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        mainHand = 50;
        for (int i = 0; i < numberOfSquare; i++) {
          await Future.delayed(Duration(milliseconds: 334));
          listOfAnimationController[i].reverse();
        }
      } else if (status == AnimationStatus.reverse) {

        for (int i = 0; i < numberOfSquare; i++) {
          // await Future.delayed(Duration(milliseconds: 334));
          listOfAnimationController[i].reset();
          listOfAnimationController[i].forward();
        }
      }

      // else if (status == AnimationStatus.dismissed) {
      //     print('AnimationStatus.dismissed');
      //   for (int i = 0; i < numberOfSquare; i++) {
      //     // await Future.delayed(Duration(milliseconds: 334));
      //     listOfAnimationController[i].forward();
      //   }
      // }
    });
    // }
    // }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      listPath = listOfOuterCircleOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: -pi / 2,
        child: Container(
          width: loaderWidth,
          height: loaderHeight,
          child: Stack(
            children: [
              Center(child: ClockLoaderViewOld()),
              // ...listOfCirclePath(),
              ...listOfAnimatedSquare(),
            ],
            // children: (listOfCirclePath() + listOfAnimatedSquare()),
          ),
        ),
      ),
    );
  }
}

class AnimatedShapePainter extends CustomPainter {
  AnimatedShapePainter(this.animation, this.path);
  Animation animation;
  Path path;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = animation.value == 0 ? Colors.transparent : Colors.white
      ..style = PaintingStyle.fill;
    // canvas.draw
    canvas.drawRect(
        Offset(calculate(animation.value, path)?.dx ?? 0,
            calculate(animation.value, path)?.dy ?? 0) &
        Size(12, 12),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  Offset? calculate(value, Path path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos?.position;
  }
}

class PathPainter extends CustomPainter {
  Path path;
  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
    // ..color = Colors.white
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

extension _ on _ClockSimplePathOldState {
  List<Widget> listOfCirclePath() {
    List<Widget> listOfWidget = [];

    listPath.map((pathElement) {
      listOfWidget.add(Positioned(
        top: 0,
        child: CustomPaint(
          painter: PathPainter(pathElement),
        ),
      ));
    }).toList();

    return listOfWidget;
  }

  List<Widget> listOfAnimatedSquare() {
    List<Widget> listOfWidget = [];

    listPath.mapIndexed((index, pathElement) {
      listOfWidget.add(
        CustomPaint(
          painter: AnimatedShapePainter(listOfAnimations[index], pathElement),
          child: Container(),
        ),
      );
    }).toList();

    return listOfWidget;
  }

  List<Path> listOfOuterCircleOffset() {
    var innerCircleRadius = radius - 50;
    List<Path> listPath = [];
    for (double i = 0; i < 360; i += 30) {
      var x2 = radius + innerCircleRadius * cos(i * pi / 180);
      var y2 = radius + innerCircleRadius * sin(i * pi / 180);
      Path path = Path();
      path.moveTo(radius, radius);
      path.lineTo(x2, y2);
      listPath.add(path);
    }
    return listPath;
  }
}


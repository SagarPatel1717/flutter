import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sf_test/clock_loader_view/clock_loader_old.dart';
import 'package:collection/collection.dart';

final loaderWidth = 300.0;
final loaderHeight = 300.0;
final radius = loaderWidth / 2;
final numberOfSquare = 12;

class Test1 extends StatefulWidget {
  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1>
    with TickerProviderStateMixin {

  List<Path> listPath = [];
  List<Animation<double>> listOfAnimations = [];
  List<AnimationController> listOfAnimationController = [];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1), (timer) { setState(() {});});

    for (int i = 0; i < numberOfSquare; i++) {
      listOfAnimationController.add(AnimationController(vsync: this, duration: Duration(milliseconds: (4008~/numberOfSquare) * (i + 1) )));
      listOfAnimations.add(Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: listOfAnimationController[i], curve: Interval((1/numberOfSquare) * (i + 1), 1.0, curve: Cubic(0.0, 0.0, 0.0, 0.0)))));
      listOfAnimationController[i].forward();
    }

    for (int i = 0; i < numberOfSquare; i++) {

      if (i == (numberOfSquare - 1)) {
        listOfAnimationController[i].addStatusListener((status) {


          // if (status == AnimationStatus.completed) {
          //   animationController.reverse();
          // } else if (status == AnimationStatus.dismissed) {
          //   animationController.forward();
          // }


        });
      }
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      listPath = listOfOuterCircleOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Transform.rotate(
        angle: -pi / 2,
        child: Container(
          width: loaderWidth,
          height: loaderHeight,
          child: Stack(
            children: [
              // Center(child: ClockLoaderView()),
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
  AnimatedShapePainter(this.offset);
  Offset? offset;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    // ..color = Color(0xFF2D2F41)
      ..color = Colors.white
    // ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawRect(offset! & Size(12, 12), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
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

extension _ on _Test1State {
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

    listOfWidget.add(
      CustomPaint(
        painter: AnimatedShapePainter(Offset(
            calculate(listOfAnimations[9].value, listPath[9])?.dx ?? 0,
            calculate(listOfAnimations[9].value, listPath[9])?.dy ?? 0)),
        child: Container(),
      ),
    );

    // listPath.mapIndexed((index, pathElement) {
    //   listOfWidget.add(
    //     CustomPaint(
    //       painter: AnimatedShapePainter(Offset(
    //           calculate(listOfAnimations[index].value, pathElement)?.dx ?? 0,
    //           calculate(listOfAnimations[index].value, pathElement)?.dy ?? 0)),
    //       child: Container(),
    //     ),
    //   );
    // }).toList();

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

  Offset? calculate(value, Path path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos?.position;
  }
}

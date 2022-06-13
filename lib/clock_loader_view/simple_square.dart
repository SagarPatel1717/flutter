import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:sf_test/clock_loader_view/clock_loader.dart';
import 'package:sf_test/config/timer_manager.dart';

final loaderWidth = 300.0;
final loaderHeight = 300.0;
final radius = loaderWidth / 2;
final squareSize = 10.0;

double mainHand = 100.0;
final numberOfSquare = 12;
double mainHandOneSquarePartHeight = mainHand / numberOfSquare;

final wholeRoundAnimMilliSec = 4008;
double neededDelayForSquareAnim = wholeRoundAnimMilliSec / numberOfSquare;

double mainHandConverterValue = mainHand;

///customisable properties
// final shapeOfParticles = ShapeOfParticlesEnum.square;
// final mainHandleColor = Colors.white;
// final particlesColor = Colors.white;

class SimpleSquare extends StatefulWidget {
  ClockLoaderModel clockLoaderModel;

  SimpleSquare({required this.clockLoaderModel});
  @override
  _ClockSimplePathState createState() => _ClockSimplePathState();
}

class _ClockSimplePathState extends State<SimpleSquare>
    with TickerProviderStateMixin {
  List<Path>? listPath = [];
  List<Animation<double>> listOfAnimations = [];
  List<AnimationController> listOfAnimationController = [];

  @override
  void dispose() {
    super.dispose();
    listOfAnimationController.map((elemant) => elemant.dispose());
    TimerManager().mainTimer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    TimerManager().startTimer(
        timerType: TimerType.milliseconds,
        timerCallback: () {
          setState(() {});
        });

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      listPath = listOfOuterCircleOffset();
      fillAnimationController();
    });
  }

  Future<void> fillAnimationController() async {
    ///just fill the AnimationController
    for (int i = 0; i < numberOfSquare; i++) {
      listOfAnimationController.add(AnimationController(
          vsync: this,
          duration: Duration(milliseconds: neededDelayForSquareAnim.toInt())));
      listOfAnimations.add(
          Tween(begin: 0.0, end: 1.0).animate(listOfAnimationController[i]));
    }

    ///add statuslistener
    listOfAnimationController[numberOfSquare - 1]
        .addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // TimerManager().mainTimer?.cancel();
        for (int i = 0; i < numberOfSquare; i++) {
          listOfAnimationController[i].reverse();
          await Future.delayed(
              Duration(milliseconds: neededDelayForSquareAnim.toInt()));
        }
      } else if (status == AnimationStatus.reverse) {
        // print('AnimationStatus.reverseeeeeeeeeee');
      } else if (status == AnimationStatus.dismissed) {
        for (int i = 0; i < numberOfSquare; i++) {
          // listOfAnimationController[i].reset();
          listOfAnimationController[i].forward();
          await Future.delayed(
              Duration(milliseconds: neededDelayForSquareAnim.toInt()));
        }
      }
    });

    ///starting first animation from here
    for (int i = 0; i < numberOfSquare; i++) {
      mainHand -= mainHandOneSquarePartHeight;
      listOfAnimationController[i].forward();
      await Future.delayed(
          Duration(milliseconds: neededDelayForSquareAnim.toInt()));
    }

    for (int i = 0; i < numberOfSquare; i++) {
      listOfAnimationController[i].addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // print('status completedddddddddd $i.........');
        } else if (status == AnimationStatus.reverse) {
          mainHand += mainHandOneSquarePartHeight;
        } else if (status == AnimationStatus.forward) {
          mainHand -= mainHandOneSquarePartHeight;
        }
      });
    }
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
              // Center(
              //     child: ClockLoaderView(
              //   clockLoaderModel: widget.clockLoaderModel,
              // )),
              ...listOfCirclePath(),
              // ...listOfAnimatedSquare(
              //     clockLoaderModel: widget.clockLoaderModel),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedShapePainter extends CustomPainter {
  AnimatedShapePainter(
      {required this.animation,
      required this.path,
      required this.clockLoaderModel});
  Animation animation;
  Path path;
  ClockLoaderModel clockLoaderModel;

  @override
  void paint(Canvas canvas, Size size) {
    final mainHandConvertedValueRelativeTo0And1 =
        mainHand / mainHandConverterValue;
    final color = (animation.value == 0 ||
            mainHandConvertedValueRelativeTo0And1 > animation.value)
        ? Colors.transparent
        : clockLoaderModel.particlesColor;
    // final color = (animation.value == 0 || animation.value < 0.8) ? Colors.transparent : Colors.white;
    var paint = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.fill;

    final x1 = calculate(animation.value, path)?.dx ?? 0;
    final y1 = calculate(animation.value, path)?.dy ?? 0;
    clockLoaderModel.shapeOfParticles == ShapeOfParticlesEnum.square
        ? canvas.drawRect(Offset(x1, y1) & Size(squareSize, squareSize), paint)
        : canvas.drawCircle(Offset(x1, y1), 5.2, paint);
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
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

extension _ on _ClockSimplePathState {
  List<Widget> listOfCirclePath() {
    List<Widget> listOfWidget = [];

    listPath?.map((pathElement) {
      listOfWidget.add(Positioned(
        top: 0,
        child: CustomPaint(
          painter: PathPainter(pathElement),
        ),
      ));
    }).toList();

    return listOfWidget;
  }

  List<Widget> listOfAnimatedSquare(
      {required ClockLoaderModel clockLoaderModel}) {
    List<Widget> listOfWidget = [];

    listPath?.mapIndexed((index, pathElement) {
      listOfWidget.add(
        CustomPaint(
          painter: AnimatedShapePainter(
              animation: listOfAnimations[index],
              path: pathElement,
              clockLoaderModel: clockLoaderModel),
          child: Container(),
        ),
      );
    }).toList();

    return listOfWidget;
  }

  List<Path> listOfOuterCircleOffset() {
    var innerCircleRadius = radius - (radius / 3);
    var quadraticCircleRadius = radius - (radius / 1.5);
    List<Path> listPath = [];

    var initSectors = getSectionsCoordinatesInCircle(
        Offset(radius, radius), quadraticCircleRadius, (numberOfSquare * 2));

    ///this evenOffsets tens for the each middle offset of total count
    ///So suppose total is 24 then middle should be 12
    ///we require this evenOffsets to make a curve on path
    ///we use this offsets in quadraticBezierTo property of Path.
    List<Offset> evenOffsets = [];

    ///
    initSectors.mapIndexed((index, element) {
      if (index % 2 != 0) {
        evenOffsets.add(element);
      }
    }).toList();

    // evenOffsets = iterateOverList(evenOffsets: evenOffsets, iterationNumber: 9);

    int index = -1;
    for (double i = 0; i < 360; i += 30) {
      index += 1;
      var endPointX2 = radius + (innerCircleRadius * cos(i * pi / 180));
      var endPointY2 = radius + (innerCircleRadius * sin(i * pi / 180));
      Path path = Path();
      path.moveTo(radius, radius);
      path.quadraticBezierTo(
          evenOffsets[index].dx, evenOffsets[index].dy, endPointX2, endPointY2);
      listPath.add(path);
    }

    return listPath;
  }

  // ///generate the Outer Circle Offsets make one list of that
  // List<Path> listOfOuterCircleOffset() {
  //   var innerCircleRadius = radius - (radius / 3);
  //   var quadraticCircleRadius = radius - (radius / 1.5);
  //
  //   List<Path> listPath = [];
  //
  //   for (double i = 0; i < 360; i += 30) {
  //     var endPointX2 = radius + (innerCircleRadius * cos(i * pi / 180));
  //     var endPointY2 = radius + (innerCircleRadius * sin(i * pi / 180));
  //     var quadraticX1 = radius + (quadraticCircleRadius * cos(i * pi / 170));
  //     var quadraticY1 = radius + (quadraticCircleRadius * sin(i * pi / 170));
  //     Path path = Path();
  //     path.moveTo(radius, radius);
  //     path.quadraticBezierTo(quadraticX1, quadraticY1, endPointX2, endPointY2);
  //     listPath.add(path);
  //   }
  //   return listPath;
  // }
}

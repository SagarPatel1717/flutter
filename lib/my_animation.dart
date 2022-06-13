import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final tappedPositions = <Offset>[];

  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController?.repeat();
    super.initState();
  }

  final x = const CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTapUp: (tabDetails) {
              setState(() {
                tappedPositions.add(tabDetails.localPosition);
              });
            },
            child: Container(
              color: Colors.white,
            ),
          ),
          for (final position in tappedPositions)
            Positioned(
              top: position.dy,
              left: position.dx,
              child: MyAnimatedWidget(
                animation: _animationController,
              ),
            ),
        ],
      ),
    );
  }
}

class MyAnimatedWidget extends StatelessWidget {
  final Animation? animation;

  const MyAnimatedWidget({this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: Icon(
        Icons.phone,
        color: Colors.blue,
        size: 30.0,
      ),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(animation!.value)
            ..rotateZ(pi * 2 * animation!.value),
          child: child,
        );
      },
    );
  }
}
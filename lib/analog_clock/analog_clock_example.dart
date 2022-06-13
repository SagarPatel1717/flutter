import 'package:flutter/material.dart';
import 'package:sf_test/analog_clock/flutter_analog_clock.dart';

class FlutterAnalogClockDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(child: buildClock1(),),
                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(child: buildClock5(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildClock1() {
  return FlutterAnalogClock();
}

Widget buildClock5() {
  return FlutterAnalogClock(
    hourNumbers: ['', '', '3', '', '', '6', '', '', '9', '', '', '12'],
    dialPlateColor: Colors.blue,
    hourHandColor: Colors.white,
    centerPointColor: Colors.white,
    showMinuteHand: false,
    showSecondHand: false,
    showBorder: false,
    showTicks: false,
    showNumber: false,
  );
}
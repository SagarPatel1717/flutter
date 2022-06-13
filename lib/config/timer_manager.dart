import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:ui';

enum TimerType { minutes, seconds, milliseconds, microseconds }

// typedef TimerReturnCallBack = void Function(Store<AppState> store, dynamic action, NextDispatcher next);
typedef StringVoidFunc = void Function(String);

class TimerManager {
  static final TimerManager _singleton = TimerManager._internal();

  factory TimerManager() {
    return _singleton;
  }

  TimerManager._internal();

  Timer? mainTimer;

  void startTimer(
      {required TimerType timerType, required VoidCallback timerCallback}) {
    switch (timerType) {
      case TimerType.minutes:
        mainTimer = Timer.periodic(Duration(minutes: 1), (timer) {
          timerCallback();
        });
        break;

      case TimerType.seconds:
        mainTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          timerCallback();
        });
        break;

      case TimerType.milliseconds:
        mainTimer = Timer.periodic(Duration(milliseconds: 1), (timer) {
          timerCallback();
        });
        break;

      case TimerType.microseconds:
        mainTimer = Timer.periodic(Duration(microseconds: 1), (timer) {
          timerCallback();
        });
        break;
    }
  }
}

List<Offset> getSectionsCoordinatesInCircle(
    Offset center, double radius, int sections) {
  var intervalAngle = (pi * 2) / sections;
  return List<int>.generate(sections, (int index) => index).map((i) {
    var radians = (pi * 2) + (intervalAngle * i);
    return radiansToCoordinates(center, radians, radius);
  }).toList();
}

Offset radiansToCoordinates(Offset center, double radians, double radius) {
  var dx = center.dx + radius * cos(radians);
  var dy = center.dy + radius * sin(radians);
  return Offset(dx, dy);
}

List<Offset> iterateOverList(
    {required List<Offset> evenOffsets, required int iterationNumber}) {
  for (int i = 0; i < iterationNumber; i++) {
    final Offset first = evenOffsets.removeAt(0);
    evenOffsets.add(first);
  }
  return evenOffsets;
}

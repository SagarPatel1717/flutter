import 'package:flutter/material.dart';

class CountState extends InheritedWidget {

  final int? count;
  final Widget child;
  final void Function()? addCounter;
  final void Function()? removeCounter;

  CountState({Key? key, this.count, required this.child, this.addCounter,this.removeCounter})
      : super(key: key, child: child);

  static CountState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CountState>());
  }

  @override
  bool updateShouldNotify(CountState oldWidget) {
    //return true;
    return count != oldWidget.count;
  }
}
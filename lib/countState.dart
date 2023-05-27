
import 'package:flutter/material.dart';

class CountState extends InheritedWidget {
  final int? count;
  final Widget child;
  final Function? addCounter;
  final Function? removeCounter;

  CountState(
      {Key? key , this.count, required this.child, this.addCounter, this.removeCounter})
      :super(key: key, child: child);

  @override
  bool updateShouldNotify(CountState oldWidget) {
     return count != oldWidget.count;
  }
}
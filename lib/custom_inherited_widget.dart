import 'package:flutter/material.dart';

class CustomInheritedWidget extends InheritedWidget {
  final int counterIndex;
  final VoidCallback incrementCounter;

  const CustomInheritedWidget({
    Key? key,
    required this.counterIndex,
    required this.incrementCounter,
    required Widget child,
  }) : super(key: key, child: child);


  static CustomInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomInheritedWidget>()!;
  }


  @override
  bool updateShouldNotify(CustomInheritedWidget oldWidget) {
    return oldWidget.counterIndex != counterIndex;
  }
}
import 'package:flutter/material.dart';

class Inherited extends InheritedWidget {
  const Inherited({
    Key? key,
    this.text = 'nothing',
    required Widget child,
  }) : super(key: key, child: child);

  final String text;

  static String of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Inherited>()?.text ??
      'not found';

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

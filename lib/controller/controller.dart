import 'package:authorization/controller/state_controller.dart';
import 'package:flutter/material.dart';

import '../main.dart';



class Controller extends InheritedWidget {
  final StateControllerState stateCountState;

  Controller({Key? key, required Widget child, required this.stateCountState})
      : super(key: key, child: child);

  static StateControllerState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Controller>()!.stateCountState;

  @override
  bool updateShouldNotify(Controller oldWidget) {
    return oldWidget != oldWidget;
  }
}

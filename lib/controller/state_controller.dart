import 'package:authorization/widget/alert_dialog.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'controller.dart';

class StateController extends StatefulWidget {
  const StateController({Key? key, required this.child, required this.context})
      : super(key: key);
  final Widget child;
  final BuildContext context;

  @override
  StateControllerState createState() => StateControllerState();
}

class StateControllerState extends State<StateController> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => Future.delayed(
        Duration(seconds: 5), () => dialog(ctx: widget.context)));
  }

  @override
  Widget build(BuildContext context) {
    return Controller(
      child: widget.child,
      stateCountState: this,
    );
  }

  void showAlertDialog(TextEditingController _login,
      TextEditingController _pass, VoidCallback dialog, BuildContext context) {
    if (_login.text == user_login && _pass.text == user_password) {
      print("Login successful");
      _login.clear();
      _pass.clear();
      Navigator.pop(context);
      WidgetsBinding.instance!.addPostFrameCallback(
          (_) => Future.delayed(Duration(seconds: 3), dialog));
    }
  }
}

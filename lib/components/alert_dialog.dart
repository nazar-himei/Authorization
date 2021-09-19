import 'dart:ui';

import 'package:authorization/model/user.dart';
import 'package:authorization/view/login.dart';
import 'package:flutter/material.dart';

void dialog({required BuildContext ctx}) {
  final _login = TextEditingController();
  final _pass = TextEditingController();
  showDialog(
    barrierDismissible: false,
    context: ctx,
    builder: (BuildContext context) {
      void repairDialog() {
        if (_login.text == User.user_login &&
            _pass.text == User.user_password) {
          Navigator.pop(context);
          Future.delayed(
            const Duration(seconds: 5),
            () => dialog(ctx: ctx),
          );
        }
      }
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: const BorderRadius.all(const Radius.circular(32.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextFormField(
                  controller: _login,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onFieldSubmitted: (item) => repairDialog(),
                  decoration: InputDecoration(
                    labelText: 'login',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _pass,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onFieldSubmitted: (item) => repairDialog(),
                  decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: const Text("close"),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                    ),
                    TextButton(
                        child: const Text("login"),
                        onPressed: () => repairDialog()),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

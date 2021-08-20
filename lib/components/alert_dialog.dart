import 'package:authorization/view/login.dart';
import 'package:flutter/material.dart';

void dialog({required BuildContext ctx}) {
  final _login = TextEditingController();
  final _pass = TextEditingController();
  showDialog(
    barrierDismissible: false,
    context: ctx,
    builder: (BuildContext context) {
      final emailField = TextFormField(
        controller: _login,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'login',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      );
      final passField = TextFormField(
        controller: _pass,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'password',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      );

      return AlertDialog(
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
              emailField,
              passField,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: const Text("close"),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login())),
                  ),
                  FlatButton(
                      child: const Text("login"),
                      onPressed: () async {
                        Navigator.pop(context);
                        await Future.delayed(
                          Duration(seconds: 2),
                        );
                        dialog(ctx: ctx);
                      }),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

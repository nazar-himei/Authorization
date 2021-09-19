import 'package:authorization/model/user.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _login = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Sing in",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: _login,
                decoration: InputDecoration(hintText: "login"),
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: "password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_login.text == User.user_login &&
                            _password.text == User.user_password) {
                          _login.clear();
                          _password.clear();
                          Navigator.pushNamed(context, 'home');
                        }
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('not current data')),
                          );
                        }
                      },
                      child: Text("log in")))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }
}

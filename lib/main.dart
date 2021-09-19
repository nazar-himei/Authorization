import 'package:authorization/view/home.dart';
import 'package:authorization/view/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authorization',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: 'login',
      routes:{
        'login':(context) => Login(),
        'home':(context) => MyHomePage(),
      },
      home: const Login(),
    );
  }
}


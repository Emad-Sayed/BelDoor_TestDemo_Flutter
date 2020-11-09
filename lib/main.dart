import 'package:flutter/material.dart';
import 'package:beldoor/pages/login.dart';
import 'package:beldoor/pages/loading.dart';
import 'package:beldoor/pages/home.dart';
import 'package:beldoor/pages/generate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Login(),
        '/loading':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/generate':(context)=>Generate(),
      },
    );
  }
}


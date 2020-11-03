import 'package:flutter/material.dart';
import 'package:beldoor/pages/loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(onPressed: ()
              {
                Navigator.pushNamed(context, '/loading',arguments: {'nextSucess':'/home','nextFailure':'/'});}
              , child: Text("Login"),color: Colors.blue),
            ]),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:beldoor/pages/loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  Map formData={};
  login(){
    formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/loading',arguments: {
      'requestType':'post',
      'requestTarget':'auth',
      'successRoute':'/home',
      'failureRoute':'/',
      'data':formData,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text("LoginIn",
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onSaved: (str)=> formData['username']=str,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onSaved: (str)=> formData['password']=str,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        Center(
                            child: FlatButton(
                                onPressed: () {
                                  if(formKey.currentState.validate()){
                                    login();
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    backgroundColor: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )))
                      ],
                    ),
                  ),
                ])));
  }
}

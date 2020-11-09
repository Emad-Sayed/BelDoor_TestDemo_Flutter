import 'package:flutter/material.dart';
import 'package:beldoor/common/httpManager.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool error = false;
  var formKey = GlobalKey<FormState>();
  Map formData = {};

  login() async {
    formKey.currentState.save();
    setState(() {
      isLoading = true;
    });
    Response response = await HttpManager.postRequest('auth', this.formData);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200)
      Navigator.pushNamed(context, '/home');
    // Navigator.pushReplacementNamed(context, '/home');
    else {
      setState(() {
        error = true;
      });
      Future.delayed(
          Duration(seconds: 5),
          () => setState(() {
                error = false;
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    color: Colors.grey[420],
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        error ? Text("Email Or Password Invalid",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red))
                            : Text(""),
                        SizedBox(height: 10),
                        Text("Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onSaved: (str) => formData['username'] = str,
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
                          onSaved: (str) => formData['password'] = str,
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
                        SizedBox(height: 20),
                        Center(
                          child: !isLoading ? RaisedButton(
                                  onPressed: () {if (formKey.currentState.validate()) {login();}},
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  )) : SpinKitDoubleBounce(
                                  color: Colors.grey,
                                  size: 50.0,
                                ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ])));
  }
}

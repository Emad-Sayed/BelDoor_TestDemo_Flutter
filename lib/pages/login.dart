import 'package:beldoor/app_localization.dart';
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
      backgroundColor: Colors.blueGrey[800],
        body: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),color: Colors.blueGrey[600]),
                      child: Column(
                        children: <Widget>[
                          error ? Text("Email Or Password Invalid",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))
                              : Text(""),
                          SizedBox(height: 10),
                          Text("Login To Bel-Door",
                              style: TextStyle(
                                  fontSize: 20,color: Colors.white60, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).translate('email'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              ),
                            onSaved: (str) => formData['username'] = str,
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).translate('password'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            onSaved: (str) => formData['password'] = str,
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: !isLoading ? RaisedButton(
                                    onPressed: () {if (formKey.currentState.validate()) {login();}},
                                color:Colors.blueGrey[300],
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
                  ),
                ])));
  }
}

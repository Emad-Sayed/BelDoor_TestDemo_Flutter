import 'package:beldoor/app_localization.dart';
import 'package:beldoor/models/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';



class Login extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  Map formData = {};
  LoginModel loginModel ;
  login(context) async {
    formKey.currentState.save();
    Response response = await loginModel.login(formData);
    if(response.statusCode == 200){
      loginModel.setErrorMessage(false);
      Navigator.pushReplacementNamed(context, '/home');
    }
    else
      loginModel.setErrorMessage(true);
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
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
                          loginModel.inValid ? Text("Email Or Password Invalid",
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
                            child: !loginModel.isLoading ? RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blueGrey)
                                ),
                                    onPressed: () {if (formKey.currentState.validate()) {login(context);}},
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

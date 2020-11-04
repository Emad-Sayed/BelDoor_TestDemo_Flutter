import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:beldoor/common/httpManager.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};

  // @override
  // void initState() {
  //   super.initState();
  // }
  takeHandOfRequest(BuildContext context) {
    if (data['requestType'] == 'post') {
      print(data['data']);
      makePostRequest(context);
    }
  }

  makePostRequest(BuildContext context) async {
    Response response = await HttpManager.postRequest(this.data['requestTarget'],this.data['data']);
    if (response.statusCode == 200)
      Navigator.pushReplacementNamed(context,this.data['successRoute']);
    else
      Navigator.pushReplacementNamed(context,this.data['failureRoute']);
  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    takeHandOfRequest(context);
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SpinKitSquareCircle(
          color: Colors.grey,
          size: 50.0,
        ),
        // FlatButton(onPressed: (){Navigator.pushReplacementNamed(context, data['nextSucess'],arguments: {'data':{}});}, child: Text("Success")),
        // FlatButton(onPressed: (){Navigator.pushReplacementNamed(context, data['nextFailure'],arguments: {'data':{}});}, child: Text("Error")),
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



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

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
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

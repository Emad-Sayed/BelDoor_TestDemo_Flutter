import 'package:flutter/material.dart';

class UserSetting extends StatefulWidget {
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      children: <Widget>[
        Container(
          color: Colors.grey[500],
          height: 100,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children :[
              Text("Emad"),
              Text("emadsayedd@gmail.com"),
              Text("Code 13"),
          ]),
        ),
        ListTile(
          title: Text("Title 1"),
          trailing: Icon(Icons.accessibility_rounded),
        ),
        ListTile(
          title: Text("Title 1"),
          trailing: Icon(Icons.accessibility_rounded),
        ),
        ListTile(
          title: Text("Cancel"),
          trailing: Icon(Icons.cancel),
          onTap:()=>Navigator.of(context).pop()
        ),
      ]
      )
    );
  }
}

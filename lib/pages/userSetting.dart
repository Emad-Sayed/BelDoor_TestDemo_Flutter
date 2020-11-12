import 'package:beldoor/app_localization.dart';
import 'package:beldoor/common/httpManager.dart';
import 'package:beldoor/main.dart';
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
          title: Text("History"),
          trailing: Icon(Icons.history),
          onTap: ()=> Navigator.pushNamed(context, '/filter'),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context).translate('switchLang')),
          trailing: Icon(Icons.language),
          onTap:()=>{
            Navigator.of(context).pop(),
            AppLocalizations.isEnglish? MyApp.setLocale(context, Locale('ar','SA')): MyApp.setLocale(context, Locale('en','UA'))
          }
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

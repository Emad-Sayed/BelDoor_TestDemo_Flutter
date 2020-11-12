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
        child: Container(
          color: Colors.blueGrey[800],
          child: ListView(
      children: <Widget>[
          Container(
            color: Colors.blueGrey[600],
            height: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children :[
                Text("Emad",style: TextStyle(color: Colors.white54),),
                Text("emadsayedd@gmail.com",style: TextStyle(color: Colors.white54),),
                Text("Code 13",style: TextStyle(color: Colors.white54),),
            ]),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('history'),style: TextStyle(color: Colors.white70),),
            trailing: Icon(Icons.history),
            onTap: ()=> Navigator.pushNamed(context, '/filter'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('switchLang'),style:TextStyle(color: Colors.white70),),
            trailing: Icon(Icons.language),
            onTap:()=>{
              Navigator.of(context).pop(),
              AppLocalizations.isEnglish? MyApp.setLocale(context, Locale('ar','SA')): MyApp.setLocale(context, Locale('en','UA'))
            }
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('cancel'),style:TextStyle(color: Colors.white70),),
            trailing: Icon(Icons.cancel),
            onTap:()=>Navigator.of(context).pop()
          ),
        ListTile(
            title: Text(AppLocalizations.of(context).translate('logOut'),style:TextStyle(color: Colors.white70),),
            trailing: Icon(Icons.exit_to_app),
            onTap:()=>{
              Navigator.of(context).pop(),
              Navigator.pushReplacementNamed(context, '/')
            }
        ),
      ]
      ),
        )
    );
  }
}

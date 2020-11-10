import 'package:flutter/material.dart';
import 'package:beldoor/pages/login.dart';
import 'package:beldoor/pages/loading.dart';
import 'package:beldoor/pages/home.dart';
import 'package:beldoor/pages/generate.dart';
import 'package:beldoor/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Login(),
        '/loading':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/generate':(context)=>Generate(),
      },
      supportedLocales: [
        Locale('en','US'),
        Locale('ar','AE'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocal,supportedLocales){
        for(var supportedLocal in supportedLocales){
          if(supportedLocal.languageCode==deviceLocal.languageCode&&
          supportedLocal.countryCode==deviceLocal.countryCode){
            return supportedLocal;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}


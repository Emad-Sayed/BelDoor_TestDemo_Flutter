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

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context,Locale local){
    _MyAppState state=context.findAncestorStateOfType<_MyAppState>(); // getting App Current Instance
    state.setLocale(local);
  }
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale;

  void setLocale(Locale locale_){
    setState(() {
      locale=locale_;
    });
  }
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
      locale: locale,
      supportedLocales: [
        Locale('en','US'),
        Locale('ar','SA'),
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


import 'package:flutter/material.dart';
import 'package:msg_firebase/ui/screens/login_screen.dart';
import 'package:msg_firebase/ui/screens/welcome_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: Welcome(),
    theme: ThemeData(
      textTheme: TextTheme(
        body1: TextStyle(color: Colors.black45)
      )
    ),
    initialRoute: Welcome.routeName,
    routes: <String, WidgetBuilder>{
      Login.routeName : (BuildContext context ) => Login(),
      Welcome.routeName : (BuildContext context) => Welcome()
    },
  ));
}
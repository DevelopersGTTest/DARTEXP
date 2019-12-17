import 'package:flutter/material.dart';
import 'package:messages_app/ui/screens/login_screen.dart';
import 'package:messages_app/ui/screens/welcome_screen.dart';
import 'package:messages_app/ui/screens/register_screen.dart';
import 'package:messages_app/ui/screens/dashboard_screen.dart';

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
      Welcome.routeName : (BuildContext context) => Welcome(),
      Register.routeName : (BuildContext context) => Register(),
      Dashboard.routeName : ( BuildContext context) => Dashboard()
    },
  ));
}
import 'package:flutter/material.dart';
import 'package:msg_firebase/ui/screens/welcome_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Welcome(),
      ),
    );
  }
}
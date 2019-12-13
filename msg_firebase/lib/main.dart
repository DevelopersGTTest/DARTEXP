import 'package:flutter/material.dart';
import 'package:msg_firebase/ui/app.dart';

void main() {
  runApp(new MaterialApp(
    home: App(),
    theme: ThemeData(
      textTheme: TextTheme(
        body1: TextStyle(color: Colors.black45)
      )
    ),
  ));
}
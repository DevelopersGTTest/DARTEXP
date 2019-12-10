import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => new _MyTextFieldState();
 }

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Hola mundo Flutter"),
     ),
     body: Container(
       child: Column(children: <Widget>[
         TextField()
       ],),
     ),
   );
  }
}
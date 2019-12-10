import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => new _MyTextFieldState();
 }

class _MyTextFieldState extends State<MyTextField> {
  String textTying = "";

  //catch value input
  void onSubmitted(String value){
    setState(() {
      textTying = textTying + "\n" + value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Hola mundo Flutter"),
     ),
     body: Container(
       child: Column(children: <Widget>[
         TextField(
           decoration: InputDecoration(hintText: "que estas pensando" ),
           onSubmitted: this.onSubmitted,
         ),
         Text(this.textTying)
       ],),
     ),
   );
  }
}
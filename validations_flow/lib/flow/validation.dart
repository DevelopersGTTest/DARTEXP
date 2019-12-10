import 'package:flutter/material.dart';

class ValidationHck extends StatefulWidget {
  @override
  _ValidationHckState createState() => new _ValidationHckState();
 }

class _ValidationHckState extends State<ValidationHck> {

  void showMessage(){
    AlertDialog alertDialog = AlertDialog(
      content:  Text("alert demo")
    );
    showDialog( context: context, builder: (BuildContext context) {
     return alertDialog; 
    });
  }



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Simple validator :)"),
     ),
     body: Container(
      child: Column(children: <Widget>[
        TextField(
          decoration:  InputDecoration(hintText:  "escribe algo"),
        ),
        RaisedButton(
          child: Text("ver alert"),
          onPressed: this.showMessage //calling method alert
          )
      ],),      
     ),
   );
  }
}
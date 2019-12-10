import 'package:flutter/material.dart';

enum DialogAction { NOT_ACTION, YES_ACTION  }

class ValidationHck extends StatefulWidget {
  @override
  _ValidationHckState createState() => new _ValidationHckState();
 }

class _ValidationHckState extends State<ValidationHck> {
  /**
   * Handlers statements
   */
  void alertResult( DialogAction action ){

  }

  void showMessage(){
    AlertDialog alertDialog = AlertDialog(
      content:  Text("alert demo"),
      actions: <Widget>[
        FlatButton(
          child:  Text("si"),
          onPressed: (){},
        ),
        FlatButton(
          child: Text("no"),
          onPressed: (){},
        )
      ],
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
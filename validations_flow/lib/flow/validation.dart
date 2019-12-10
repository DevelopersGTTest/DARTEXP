import 'package:flutter/material.dart';

enum DialogAction { NOT_ACTION, YES_ACTION  }

class ValidationHck extends StatefulWidget {
  @override
  _ValidationHckState createState() => new _ValidationHckState();
 }

class _ValidationHckState extends State<ValidationHck> {
  String valueTextFiel = "";

  /**
   * Handlers statements
   */

  void alertResult( DialogAction action ){
    print("has seleccionado :: $action");
  }

  //state
  void onChanged(String value){
    setState(() {
      this.valueTextFiel = value;
    });
  }

  void showMessage(String valueTextFiel ){
    AlertDialog alertDialog = AlertDialog(
      content:  Text( valueTextFiel ),
      actions: <Widget>[
        FlatButton(
          child:  Text("si"),
          onPressed: (){
            this.alertResult(
              DialogAction.YES_ACTION
            );
          },
        ),
        FlatButton(
          child: Text("no"),
          onPressed: (){
            this.alertResult(
              DialogAction.NOT_ACTION
            );
          },
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
          onChanged: onChanged, 
        ),        RaisedButton(
          child: Text("ver alert"),
          onPressed: (){
            //pased by value
            this.showMessage( this.valueTextFiel );
          }
          )
      ],),      
     ),
   );
  }
}
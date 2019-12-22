import 'package:flutter/material.dart';

class AlertWgt extends StatelessWidget {
  //properties
  String data = "";
  //String typeAlert = ""; not use

  AlertWgt({ this.data });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Upss....",
        style:  TextStyle( 
          color: Colors.redAccent
        )
      ),
      content: Text(this.data), //is use exceptions
    );
 }
}
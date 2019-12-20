import 'package:flutter/material.dart';

class AlertWgt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Upss....",
        style:  TextStyle( color: Colors.redAccent) ), //is use exceptions
    );
 }
}
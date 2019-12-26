import 'package:flutter/material.dart';

class MessageWgt extends StatelessWidget {
  String owner = "";
  String ctxMessage = "";
 @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.owner, style: TextStyle(fontSize: 15.0, color: Colors.black54) )
        ],
      ),
    );
 }
}
import 'package:flutter/material.dart';

class MessageWgt extends StatelessWidget {
  String owner = "";
  String ctxMessage = "";

  MessageWgt({this.owner, this.ctxMessage});
 @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.owner, 
            style: TextStyle(
              fontSize: 15.0, 
              color: Colors.black54
            ) 
          ),
          Text( 
            this.ctxMessage, 
            style: TextStyle( 
              fontSize: 16.0, 
              color: Colors.black54 
            ), 
          )
        ],
      ),
    );
 }
}
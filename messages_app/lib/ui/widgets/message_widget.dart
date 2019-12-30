import 'package:flutter/material.dart';

class MessageWgt extends StatelessWidget {
  String owner = "";
  String ctxMessage = "";

  MessageWgt({this.owner, this.ctxMessage});
 @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            this.owner, 
            style: TextStyle(
              fontSize: 15.0, 
              color: Colors.black54
            ) 
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric( 
                vertical: 10.0,
                horizontal: 20.0  
              ),
              child: Text(
                this.ctxMessage, 
                style: TextStyle( 
                  fontSize: 16.0,  //fixeds styles
                  color: Colors.black54 
                ), 
              ) 
            ),
          )
        ],
      ),
    );
 }
}
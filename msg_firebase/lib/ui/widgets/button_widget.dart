import 'package:flutter/material.dart';

class ButtonWgt extends StatelessWidget {
  //properties
  MaterialAccentColor _color;
  String _nameButton;
  VoidCallback _onPressed;

  //with params
  //with params
  ButtonWgt(MaterialAccentColor c, String n, VoidCallback onP ) 
  : this._color = c 
  , this._nameButton = n
  , this._onPressed = onP; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: this._color,
        borderRadius: BorderRadius.circular(30.0),
        child: FlatButton(
          child: Text(this._nameButton),
          onPressed: this._onPressed,
        ),
      ), 
    );
  }
}
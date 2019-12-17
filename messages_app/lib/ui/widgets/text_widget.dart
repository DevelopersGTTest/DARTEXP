import 'package:flutter/material.dart';

class TextWgt extends StatelessWidget {
  //properties
  String namaPlaceholder = "";
  ValueChanged<String> onChanged;
  bool typeTextFile;

 
  TextWgt(String nP, ValueChanged<String> eventCallback, bool typeText ) 
  : this.namaPlaceholder = nP
  , this.onChanged = eventCallback
  , this.typeTextFile = typeText;

 @override
 Widget build(BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical:  10.0, horizontal: 20.0 ),
      hintText: this.namaPlaceholder,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0) 
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0) 
      ),
    ),
    onChanged: this.onChanged,
    textAlign:  TextAlign.center,
    obscureText: this.typeTextFile,
 );
 }
}
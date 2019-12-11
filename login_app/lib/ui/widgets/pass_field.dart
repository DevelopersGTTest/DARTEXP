import 'package:flutter/material.dart';

class PassField extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return TextField(
      decoration:  InputDecoration(
      hintText: "ex : 123",
      labelText: "Password",
      errorText: ""
    ),
  );
 }
}
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "hackobo@gmail.com",
        labelText: "Email",
        errorText: ""
      ),
    );
  }
}
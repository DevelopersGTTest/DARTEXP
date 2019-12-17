import 'package:flutter/material.dart';

class IconWgt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        Image.asset('images/icons8.png'),
        Text(
          " Flutter",
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w700
          ),
        )
      ],
    ); 
  }
}
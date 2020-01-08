import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("search"),
      actions: <Widget>[
        IconButton( 
          icon: Icon( Icons.search ),
          onPressed: (){ },
        )
      ],
    ),
 );
 }
}
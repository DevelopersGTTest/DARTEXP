import 'package:flutter/material.dart';
import 'package:login_app/ui/screens/login_screen.dart';
import 'package:login_app/blocs/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Provider(           //wrap provider
      child: MaterialApp(
        home: Scaffold( 
          body: Login(),
        ),
      ),
    );
  }
}
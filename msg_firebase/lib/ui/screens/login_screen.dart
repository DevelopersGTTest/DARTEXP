import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => new _LoginState();
 }
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar:  AppBar(
      title: Text("holas") ,),
   );
  }
}
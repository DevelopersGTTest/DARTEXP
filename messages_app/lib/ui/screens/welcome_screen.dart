import 'package:flutter/material.dart';
import 'package:messages_app/ui/widgets/button_widget.dart';
import 'package:messages_app/ui/widgets/icon_widget.dart';
   
class Welcome extends StatefulWidget {
  static const String routeName = "";
  @override
  _WelcomeState createState() => new _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IconWgt(),
            ButtonWgt(
              Colors.lightBlueAccent,
              "Login",
              (){
                Navigator.pushNamed(context, "/login");
              }
            ),
            ButtonWgt(
              Colors.blueAccent,
              "Register",
              (){
                 Navigator.pushNamed(context, "/register");
              }
            )
          ],
        ),
      ),
    );
  }
}
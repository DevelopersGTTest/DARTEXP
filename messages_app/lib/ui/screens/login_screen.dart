import 'package:flutter/material.dart';
import 'package:messages_app/ui/widgets/button_widget.dart';
import 'package:messages_app/ui/widgets/icon_widget.dart';
import 'package:messages_app/ui/widgets/text_widget.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => new _LoginState();
 }
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:  24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IconWgt(),
            SizedBox( height: 48.0),
            TextWgt(
              "Write email",
              (value) {
                print("el email es $value");
              }
            ),
            SizedBox( height: 8.0),
            TextWgt(
              "Write password",
              (value) {
                print("el pass es $value");
              }
            ),
            SizedBox( height: 23.0),
            ButtonWgt(
              Colors.blueAccent,
              "Log In",
              (){}
            )
          ],
        ),
      ),
    );
  }
}
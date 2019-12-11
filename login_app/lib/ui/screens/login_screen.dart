import 'package:flutter/material.dart';
import 'package:login_app/ui/widgets/email_field.dart';
import 'package:login_app/ui/widgets/pass_field.dart';
import 'package:login_app/ui/widgets/submit_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
@override
  Widget build(BuildContext context) {
  return new Container(
    margin: EdgeInsets.all(20.0),
    child: Column(
      children: <Widget>[
        EmailField(),
        PassField(),
        Container(margin: EdgeInsets.only(top: 25.0),),
        SubmitVal()
      ],
    ),
   );
  }
}
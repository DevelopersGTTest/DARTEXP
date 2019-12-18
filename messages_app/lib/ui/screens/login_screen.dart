import 'package:flutter/material.dart';
import 'package:messages_app/ui/widgets/button_widget.dart';
import 'package:messages_app/ui/widgets/icon_widget.dart';
import 'package:messages_app/ui/widgets/text_widget.dart';
import 'package:messages_app/services/auth_service.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => new _LoginState();
 }
class _LoginState extends State<Login> {
  //properties 
  String _email = "";
  String _password = "";

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
                this._email = value;
                print("el email es $value");
              },
              false
            ),
            SizedBox( height: 8.0),
            TextWgt(
              "Write password",
              (value) {
                this._password = value;
                print("el pass es $value");
              },
              true
            ),
            SizedBox( height: 23.0),
            ButtonWgt(
              Colors.blueAccent,
              "Log In",
              () async {
                var loginUser = await Auth().loginUser( 
                  emailParam: this._email, passwordParam:  this._password
                );
                if( loginUser != null ){
                  Navigator.pushNamed(context, "/dashboard");
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
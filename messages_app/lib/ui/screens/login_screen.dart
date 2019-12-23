import 'package:flutter/material.dart';
import 'package:messages_app/ui/widgets/button_widget.dart';
import 'package:messages_app/ui/widgets/icon_widget.dart';
import 'package:messages_app/ui/widgets/text_widget.dart';
import 'package:messages_app/services/auth_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => new _LoginState();
 }
class _LoginState extends State<Login> {
  //properties 
  String _email = "";
  String _password = "";
  bool showSpinner = false;

  //controller state
  void setSpinnerStatus(bool  status){
    setState(() {
      this.showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: this.showSpinner,
        child: Container(
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
                this.setSpinnerStatus(true);
                var loginUser = await Auth().loginUser( 
                  emailParam: this._email, passwordParam:  this._password
                );
                if( loginUser != null ){
                  Navigator.pushNamed(context, "/dashboard");
                }
                this.setSpinnerStatus(false);
              }
            )
          ],
        ),
        ),
      ),
    );
  }
}
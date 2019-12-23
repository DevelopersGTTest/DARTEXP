import 'package:flutter/material.dart';
import 'package:messages_app/ui/widgets/alert_widget.dart';
import 'package:messages_app/ui/widgets/button_widget.dart';
import 'package:messages_app/ui/widgets/icon_widget.dart';
import 'package:messages_app/ui/widgets/text_widget.dart';
import 'package:messages_app/services/auth_service.dart';    

class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  //properties
  String _email = "";
  String _pass = "";
   String _errorAlert = "";

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
                print("email register ::: $value");
              },
              false
            ),
            SizedBox( height: 8.0),
            TextWgt(
              "Write password",
              (value) { 
                this._pass = value;
                print("password register ::: $value");
              },
              true
            ),
            SizedBox( height: 23.0),
            ButtonWgt(
              Colors.blueAccent,
              "Register",
              () async {
                var newUser = await Auth().createUser(
                  emailParam: this._email, passwordParam: this._pass
                );
                if( newUser.success ){
                  Navigator.pushNamed(context, "/dashboard");
                }else{
                  setState(() {
                    this._errorAlert = newUser.messageError;  
                  });
                }
              }
            ),
            _showErrorMessage()
          ],
        ),
      ),
    );
  }

    //invoke type widget input
  Widget _showErrorMessage(){
    if( this._errorAlert.length > 0 && this._errorAlert != null ){
      return AlertWgt(data:  this._errorAlert );
    }else{
      return Container(
        height: 0.0,
      );
    }
  }
}
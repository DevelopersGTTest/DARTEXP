import 'package:flutter/material.dart';
import 'package:messages_app/ui/widgets/button_widget.dart';
import 'package:messages_app/ui/widgets/icon_widget.dart';
import 'package:messages_app/ui/widgets/text_widget.dart';
//firebase package
import 'package:firebase_auth/firebase_auth.dart';
    
class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => new _RegisterState();
 }
class _RegisterState extends State<Register> {
  final auth = FirebaseAuth.instance;
  String _email = "";
  String _pass = "";
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
              (){
                try {
                  var newUser = auth
                  .createUserWithEmailAndPassword( 
                    email: this._email, password: this._pass
                  );
                  if( newUser != null ){
                    Navigator.pushNamed(context, "/dashboard");
                  }
                } catch (e) {
                  print("[register error] ::: $e ");
                } 
              }
            )
          ],
        ),
      ),
    );
  }
}
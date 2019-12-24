import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messages_app/services/auth_service.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";
  @override
  _DashboardState createState() => new _DashboardState();
 }
class _DashboardState extends State<Dashboard> {
  //properties
  FirebaseUser loogerUser;
  //decoration config
  InputDecoration _messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Write a message',
    border: InputBorder.none 
  );
  BoxDecoration _messageBoxDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(
        color: Colors.lightBlueAccent,
        width: 2.0
      )
    )
  );



  //is onInit in Flutter
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.currentUser();
  }

  //temp method
  void currentUser() async {
    var user = await Auth().getCurrentUser();
    if( user != null ){
      this.loogerUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: (){
              Auth().logOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: this._messageBoxDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: this._messageTextFieldDecoration,
                    ),
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text("Send"),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
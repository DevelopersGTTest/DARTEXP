import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messages_app/services/auth_service.dart';
import 'package:messages_app/services/message_service.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";
  @override
  _DashboardState createState() => new _DashboardState();
 }
class _DashboardState extends State<Dashboard> {
  //properties
  FirebaseUser loogerUser;
  TextEditingController _messageController = new TextEditingController();
  String emailShowInHeaderApp  = "";

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
  TextStyle _sendMessage = TextStyle(
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18.0
  );

  //is onInit in Flutter
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.currentUser();
    this.getDataFirebase();
  }

  //temp method
  void currentUser() async {
    var user = await Auth().getCurrentUser();
    if( user != null ){
      this.loogerUser = user;
      this.emailShowInHeaderApp = this.loogerUser.email;
    }
  }

  //getting data
  void getDataFirebase() async {
    await for( var snapshot in MessageService().getMessagesStream()){
      for(var msg in snapshot.documents){
        print(msg.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido $emailShowInHeaderApp"),
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
            StreamBuilder(
              stream: MessageService().getMessagesStream(),
              builder: ( context, snapshot ){
                if( snapshot.hasData ){
                  var messages = snapshot.data.documents;
                  List<Text> msgWiggets = [];
                  for( var message in messages ){
                    final vContent = message.data["ctxValue"];
                    final vOwner = message.data["owner"];
                    msgWiggets.add( Text('$vContent by $vOwner '));
                  }
                  return Flexible(
                    child: ListView(
                      children: msgWiggets,
                    ),
                  );
                }
              }
            ),
            Container(
              decoration: this._messageBoxDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: this._messageTextFieldDecoration,
                      controller: this._messageController,
                    ),
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text(
                "Send", 
                style: this._sendMessage
              ),
              onPressed: (){
                MessageService().saveMessages(
                  collectionName: "messages",
                  objValues: {
                    'ctxValue' : this._messageController.text,
                    'owner' : this.loogerUser.email
                  } 
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";
  @override
  _DashboardState createState() => new _DashboardState();
 }
class _DashboardState extends State<Dashboard> {
  final auth = FirebaseAuth.instance;
  FirebaseUser loogerUser;

  //is onInit in Flutter
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getCurrentUser();
  }

  //temp method
  void getCurrentUser() async {
    try {
      var user = await auth.currentUser();
      if( user != null ){
        this.loogerUser = user;
        print("[Current user id] ::: $user ");
      }
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hck msgs"),
      ) ,
    );
  }
}
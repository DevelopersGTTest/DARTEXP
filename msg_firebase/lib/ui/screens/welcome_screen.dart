import 'package:flutter/material.dart';
import 'package:msg_firebase/ui/widgets/button_widget.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => new _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
            Image.asset('images/icons8.png'),
            Text(
              " Flutter-APP",
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w700
              ),
            )
            ],
          ),
          ButtonWgt(
            Colors.lightBlueAccent,
            "Login",
            (){}
          ),
          ButtonWgt(
            Colors.blueAccent,
            "Register",
            (){}
          )
        ],
      ),
    );
  }
}
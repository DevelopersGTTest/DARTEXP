import 'package:flutter/material.dart';
import 'package:login_app/blocs/bloc.dart';

class PassField extends StatelessWidget {
  Bloc ctxLogin;
  
  //contructors
  PassField(Bloc bloc ) : this.ctxLogin = bloc;
  
@override
Widget build(BuildContext context) {
  return StreamBuilder(
    stream : ctxLogin.passwordStream ,
    builder: ( context, snapshot ){
      return TextField(
        decoration:  InputDecoration(
          hintText: "ex : 123",
          labelText: "Password",
          errorText: snapshot.error
        ),
        onChanged:  (value) => ctxLogin.passwordValue,
      );
    },  
  );
 }
}
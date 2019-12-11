import 'package:flutter/material.dart';
import 'package:login_app/blocs/bloc.dart';

class EmailField extends StatelessWidget {
  Bloc ctxLogin;

  //contructors
  EmailField( Bloc bloc ) : this.ctxLogin = bloc;

 @override
 Widget build(BuildContext context) {
  return StreamBuilder(
    stream: ctxLogin.emailStream,
    builder: ( context, snapshot ){
      return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "hackobo@gmail.com",
          labelText: "Email",
          errorText: snapshot.error
        ),
        onChanged: ( value ) => ctxLogin.emailValue,
      );      
    },
  );
}
}
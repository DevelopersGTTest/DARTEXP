import 'package:flutter/material.dart';
import 'package:login_app/blocs/bloc.dart';

class Provider extends InheritedWidget{
  
  @override
  bool updateShouldNotify(_) => true ;
  final bloc = Bloc();

  //provider
  static Bloc of (BuildContext context ) => 
    ( context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  
}
import 'package:flutter/material.dart';
import 'package:login_app/blocs/bloc.dart';

class Provider extends InheritedWidget{
  
  @override
  bool updateShouldNotify(_) => true ;
  final bloc = Bloc();

  //constructor that receives a widget
  Provider({Key key, Widget child}) 
    : super(key : key, child : child);
  

  //provider
  static Bloc of (BuildContext context ) => 
    ( context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  
}
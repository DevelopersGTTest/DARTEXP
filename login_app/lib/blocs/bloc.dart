import 'dart:async';
import 'package:login_app/blocs/validator.dart';

class Bloc with Validator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //Streams[transform]
  Stream<String> get emailStream => _emailController.stream.transform( validatorEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validatorPass);

  //Repository
  Function(String) get emailValue => _emailController.sink.add;
  Function(String) get passwordValue => _passwordController.sink.add;

  //close and clean flux
  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
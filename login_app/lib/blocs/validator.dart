import 'dart:async';

class Validator{
  //validator email
  final validatorEmail = 
    StreamTransformer<String, String>
    .fromHandlers( 
      handleData: ( email, sink ){
        if( email.contains('@')){
          sink.add(email);
        }else{
          sink.addError('error : email no valido ');        
        }
      }
    );

  //validator password
  final validatorPass = 
    StreamTransformer<String, String>
    .fromHandlers(
      handleData: ( pass, sink ){
        if( pass.length < 3 ){
          sink.addError("password invalido");
        }
        sink.add(pass);
      }
    );
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messages_app/models/authentication_request.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  //register method
  Future<AuthenticationRequest> createUser(
  { String emailParam = "", String passwordParam = "" }) async {
    AuthenticationRequest authRequest = new AuthenticationRequest();
    try {
      var user = await this._auth
        .createUserWithEmailAndPassword( 
          email: emailParam, password: passwordParam
        );
      if( user != null ){
        authRequest.success = true;
      }
    } catch (e) {
      print("[Error in register user] ::: $e ");
      this._mapError(authRequest, e.code);
    }
    return authRequest;
  }

  //getting { currentUser }
  Future<FirebaseUser> getCurrentUser() async {
    try {
      return await this._auth.currentUser();
    } catch (e) {
      print("[error in current user] ::: $e ");
    }
  }

  //authenticate user
  Future<AuthenticationRequest> loginUser(
  { String emailParam = "", String passwordParam = "" }) async {
    AuthenticationRequest authRequest =  new AuthenticationRequest();
    try {
      var user = await this._auth
        .signInWithEmailAndPassword( 
          email: emailParam, password: passwordParam 
        );
      if( user != null ){
        authRequest.success = true;
      }   
    } catch (e) {
      print("[error login user] ::: $e ");
      this._mapError(authRequest, e.code);
    }
    return authRequest;
  }

  Future<void> logOut() async{
    try {
      return await this._auth.signOut();
    } catch (e) {
      print("error logged ::: $e");
    }
  }

  /**
   * Handler Error
   * in auth
  */
  void _mapError( AuthenticationRequest authRequest, String codeReason ){
    switch(codeReason){
      case 'ERROR_USER_NOT_FOUND':
        authRequest.messageError = "Usuario no encontrado";
      break;
      case 'ERROR_WRONG_PASSWORD':
        authRequest.messageError = "Contrasena invalida";
      break;
      case 'ERROR_NETWORK_REQUEST_FAILED':
        authRequest.messageError  = "Error de red";
      break;
      case 'ERROR_EMAIL_ALREADY_IN_USER':
        authRequest.messageError = "Usuario ya registrado";
      break;
      default:
        authRequest.messageError = codeReason;
    }
  }

}
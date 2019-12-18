import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  //register method
  Future<FirebaseUser> createUser(
  { String emailParam = "", String passwordParam = "" }) async {
    try {
      return await this._auth
        .createUserWithEmailAndPassword( 
          email: emailParam, password: passwordParam
        );
    } catch (e) {
      print("[Error in register user] ::: $e ");
    }
    return null;
  }

  //getting { currentUser }
  Future<FirebaseUser> getCurrentUser() async {
    try {
      return await this._auth.currentUser();
    } catch (e) {
      print("[error in current user] ::: $e ");
    }
  }


}
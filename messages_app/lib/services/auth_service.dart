import 'package:firebase_auth/firebase_auth.dart';
import 'package:messages_app/ui/widgets/alert_widget.dart';

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
      AlertWgt(data: e,);
    }
    return null;
  }

  //getting { currentUser }
  Future<FirebaseUser> getCurrentUser() async {
    try {
      return await this._auth.currentUser();
    } catch (e) {
      print("[error in current user] ::: $e ");
      AlertWgt(data: e,);
    }
  }

  //authenticate user
  Future<FirebaseUser> loginUser(
  { String emailParam = "", String passwordParam = "" }) async {
    try {
      return await this._auth
        .signInWithEmailAndPassword( 
          email: emailParam, password: passwordParam 
        );   
    } catch (e) {
      print("[error login user] ::: $e ");
      AlertWgt(data: e);
    }
    return null;
  }

  Future<void> logOut() async{
    try {
      return await this._auth.signOut();
    } catch (e) {
      print("error logged ::: $e");
      AlertWgt(data: e,);
    }
  }


}
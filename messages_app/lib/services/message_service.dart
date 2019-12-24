import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService{
   final _firestore = Firestore.instance;

  void saveMessages(
  { String collectionName, Map<String, dynamic> objValues}){
    this._firestore
      .collection(collectionName)
      .add(objValues);
  }

  //without [stream]
  //[ not used ]
  Future<QuerySnapshot> getMessages() async {
    return await this._firestore
      .collection("messages")
      .getDocuments();
  }

  //stream 
  Stream<QuerySnapshot> getMessagesStream(){
    return this._firestore
      .collection("messages").snapshots();
  }

}